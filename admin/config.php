<?php
// HTTP
define('HTTP_SERVER', 'http://ocdemo.host/admin/');
define('HTTP_CATALOG', 'http://ocdemo.host/');

// HTTPS
define('HTTPS_SERVER', 'http://ocdemo.host/admin/');
define('HTTPS_CATALOG', 'http://ocdemo.host/');

// DIR
define('DIR_APPLICATION', '/Applications/MAMP/htdocs/ocdemo/admin/');
define('DIR_SYSTEM', '/Applications/MAMP/htdocs/ocdemo/system/');
define('DIR_IMAGE', '/Applications/MAMP/htdocs/ocdemo/image/');
define('DIR_CATALOG', '/Applications/MAMP/htdocs/ocdemo/catalog/');
define('DIR_LANGUAGE', DIR_APPLICATION . 'language/');
define('DIR_TEMPLATE', DIR_APPLICATION . 'view/template/');
define('DIR_CONFIG', DIR_SYSTEM . 'config/');
define('DIR_CACHE', DIR_SYSTEM . 'storage/cache/');
define('DIR_DOWNLOAD', DIR_SYSTEM . 'storage/download/');
define('DIR_LOGS', DIR_SYSTEM . 'storage/logs/');
define('DIR_MODIFICATION', DIR_SYSTEM . 'storage/modification/');
define('DIR_UPLOAD', DIR_SYSTEM . 'storage/upload/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', 'root');
define('DB_DATABASE', 'oc');
define('DB_PORT', '3306');
define('DB_PREFIX', 'oc_');
