#!/usr/bin/bash
datadisk_device_path="/dev/sdc"
datadisk_mounting_path="/data"
solr_writable_files="${datadisk_mounting_path}/solr"
solr_status=$(curl -IL http://localhost:8983 2>/dev/null | tail -n 5 | head -n 1 | cut -d$' ' -f2)

echo 'type=83' | sfdisk $datadisk_device_path
mkfs.ext4 "${datadisk_device_path}1"
mkdir -p "$datadisk_mounting_path"
mount "${datadisk_device_path}1" "$datadisk_mounting_path"
echo "${datadisk_device_path}1    $datadisk_mounting_path	ext4	defaults    0 0" >> /etc/fstab
mkdir -p "$solr_writable_files"

if [ "$solr_status" != "200" ]
then
    yum update
    yum install -y java
    wget --no-check-certificate https://archive.apache.org/dist/lucene/solr/6.6.2/solr-6.6.2.tgz
    tar xzf solr-6.6.2.tgz solr-6.6.2/bin/install_solr_service.sh --strip-components=2
    ./install_solr_service.sh solr-6.6.2.tgz -d "$solr_writable_files" -n
    rm -f /etc/init.d/solr
    touch /etc/systemd/system/solr.service
    cat > /etc/systemd/system/solr.service <<EOF
[Unit]
Description=Apache Solr Server

[Service]
Type=forking
User=solr
Environment=SOLR_INCLUDE=/etc/default/solr.in.sh
ExecStart=/opt/solr/bin/solr start
ExecStop=/opt/solr/bin/solr stop
Restart=on-failure
LimitNOFILE=65000
LimitNPROC=65000
TimeoutSec=180s

[Install]
WantedBy=multi-user.target
EOF
    systemctl daemon-reload
    systemctl enable solr
    systemctl start solr
    systemctl status solr
else
    echo "Solr Server is already installed or another service is using port 8983"
fi