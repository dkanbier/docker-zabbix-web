<?php
// Zabbix GUI configuration file
global $DB;

$DB["TYPE"]                     = 'MYSQL';
$DB["SERVER"]                   = getenv('ZABBIX_DB_PORT_3306_TCP_ADDR');
$DB["PORT"]                     = getenv('ZABBIX_DB_PORT_3306_TCP_PORT');
$DB["DATABASE"]                 = 'zabbix';
$DB["USER"]                     = 'zabbix';
$DB["PASSWORD"]                 = 'zabbix';
// SCHEMA is relevant only for IBM_DB2 database
$DB["SCHEMA"]                   = '';

$ZBX_SERVER                     = getenv('ZABBIX_SERVER_PORT_10051_TCP_ADDR');
$ZBX_SERVER_PORT                = getenv('ZABBIX_SERVER_PORT_10051_TCP_PORT');
$ZBX_SERVER_NAME                = '';

$IMAGE_FORMAT_DEFAULT   = IMAGE_FORMAT_PNG;
?>
