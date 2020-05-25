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
    wget https://archive.apache.org/dist/lucene/solr/6.6.2/solr-6.6.2.tgz
    tar xzf solr-6.6.2.tgz solr-6.6.2/bin/install_solr_service.sh --strip-components=2
    ./install_solr_service.sh solr-6.6.2.tgz -d "$solr_writable_files"
else
    echo "Solr Server is already installed or another service is using port 8983"
fi