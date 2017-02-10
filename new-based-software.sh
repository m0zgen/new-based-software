#!/bin/bash
# First install script.
# Install need software for CentOS web server role (LEMP) nginx + php-fpm
#

# Update and install new software
yum update -y && yum install epel-release git yum-plugin-priorities net-tools pwgen chrony -y

rpm -Uhv http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
# Add nginx repo
echo "" > /etc/yum.repos.d/nginx.repo && sed -i '1{/^$/d}' /etc/yum.repos.d/nginx.repo

cat >>/etc/yum.repos.d/nginx.repo <<EOF
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
gpgcheck=0
enabled=1
priority=1
EOF

yum install nginx -y
systemctl enable nginx
irewall-cmd --permanent --add-service=http

# Configure chronyd
systemctl start chronyd && systemctl enable chronyd
firewall-cmd --permanent --add-service=ntp

firewall-cmd –reload