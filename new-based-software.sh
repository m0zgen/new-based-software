#!/bin/bash
# Install need software for CentOS web server role (LEMP) nginx + php-fpm
#

yum update -y && yum install epel-release git yum-plugin-priorities net-tools -y
