FROM centos:centos6
MAINTAINER Dennis Kanbier <dennis@kanbier.net>

# Update base images.
RUN yum distribution-synchronization -y

# Install Zabbix release packages.
RUN yum install -y http://repo.zabbix.com/zabbix/2.4/rhel/6/x86_64/zabbix-release-2.4-1.el6.noarch.rpm
RUN yum makecache

# Install Apache and PHP5
RUN yum -y -q install httpd php php-mysql php-snmp

# Install the rest of the zabbix packages
RUN yum -y -q install zabbix-web zabbix-web-mysql

# Cleaining up.
RUN yum clean all

# Zabbix Conf Files
ADD ./zabbix/zabbix.ini 				/etc/php.d/zabbix.ini
ADD ./zabbix/httpd_zabbix.conf  		/etc/httpd/conf.d/zabbix.conf
ADD ./zabbix/zabbix.conf.php    		/etc/zabbix/web/zabbix.conf.php

# https://github.com/dotcloud/docker/issues/1240#issuecomment-21807183
RUN echo "NETWORKING=yes" > /etc/sysconfig/network

# Expose http port
EXPOSE 80 

# Start apache in the foreground
CMD ["apachectl", "-DFOREGROUND"]
