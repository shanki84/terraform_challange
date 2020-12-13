#!/bin/bash

# Check the logs
exec > >(tee /var/log/user-data-output.log|logger -t user-data -s 2>/dev/console) 2>&1

# fetch the metadata of the instance on JSON format
wget -q -O - http://169.254.169.254/latest/dynamic/instance-identity/document

echo "instance_id:" wget -q -O - http://169.254.169.254/latest/meta-data/instance-id
echo "ami-id:" wget -q -O - http://169.254.169.254/latest/meta-data/ami-id
echo "ami-launch-index:" wget -q -O - http://169.254.169.254/latest/meta-data/ami-launch-index
echo "ami-manifest-path:" wget -q -O - http://169.254.169.254/latest/meta-data/ami-manifest-path
echo "block-device-mapping:" wget -q -O - http://169.254.169.254/latest/meta-data/block-device-mapping/
echo "hostname:" wget -q -O - http://169.254.169.254/latest/meta-data/hostname
echo "instance-action:" wget -q -O - http://169.254.169.254/latest/meta-data/instance-action
echo "instance-type:" wget -q -O - http://169.254.169.254/latest/meta-data/instance-type
echo "kernel-id:" wget -q -O - http://169.254.169.254/latest/meta-data/kernel-id
echo "local-hostname:" wget -q -O - http://169.254.169.254/latest/meta-data/local-hostname
echo "local-ipv4:" wget -q -O - http://169.254.169.254/latest/meta-data/local-ipv4
echo "mac:" wget -q -O - http://169.254.169.254/latest/meta-data/mac
echo "metrics:" wget -q -O - http://169.254.169.254/latest/meta-data/metrics/
echo "network:" wget -q -O - http://169.254.169.254/latest/meta-data/network/
echo "placement:" wget -q -O - http://169.254.169.254/latest/meta-data/placement/
echo "profile:" wget -q -O - http://169.254.169.254/latest/meta-data/profile
echo "public-hostname:" wget -q -O - http://169.254.169.254/latest/meta-data/public-hostname
echo "public-ipv4:" wget -q -O - http://169.254.169.254/latest/meta-data/public-ipv4
echo "public-keys:" wget -q -O - http://169.254.169.254/latest/meta-data/public-keys/
echo "reservation-id:" wget -q -O - http://169.254.169.254/latest/meta-data/reservation-id
echo "security-groups:" wget -q -O - http://169.254.169.254/latest/meta-data/security-groups