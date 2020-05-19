 #!/usr/bin/env bash
 yum update -y
 yum install -y java
 cd /opt
 wget https://archive.apache.org/dist/lucene/solr/6.6.2/solr-6.6.2.tgz
 tar xzf solr-6.6.2.tgz solr-6.6.2/bin/install_solr_service.sh --strip-components=2
 ./install_solr_service.sh solr-6.6.2.tgz