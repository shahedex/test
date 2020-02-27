#!/bin/bash

# Update hosts file
echo "Update /etc/hosts file"
cat >>/etc/hosts<<EOF
172.42.42.101 pgnode01
172.42.42.102 pgnode02
172.42.42.103 pgnode03
EOF