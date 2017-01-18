<?php

if (version_compare(VERSION, '2.0.0.0') == 0) {
    echo '<h3>Your current OpenCart version is 2.0.0.0. Pavilion 1.2 is intentionally not compatible with it, because it contains many issues that would affect your shop. Please, <a href="http://www.opencart.com/index.php?route=download/download">upgrade to OpenCart 2.0.1.0</a>, which includes many important bugfixes.<br /><br /> If you have any questions, do not hesitate to ask in <a href="http://support.themeburn.com">our support forums</a> </h3>';
    exit();
}

!defined('TB_BASENAME')   && define('TB_BASENAME',   basename(dirname(dirname(__FILE__))));
!defined('TB_THEME_ROOT') && define('TB_THEME_ROOT', realpath(DIR_SYSTEM . '../') . '/tb_themes/' . TB_BASENAME);

require_once TB_THEME_ROOT . '/library/EnvHelper.php';
require_once TB_THEME_ROOT . '/library/Utils.php';
require_once TB_THEME_ROOT . '/library/Context.php';
require_once TB_THEME_ROOT . '/library/AdminDispatcher.php';

$registry = isset($registry) ? $registry : $this->registry;

$theme_config = TB_EnvHelper::getInstance($registry)->getThemeConfig(TB_BASENAME);

if (!TB_RequestHelper::isRequestHTTPS() && $registry->get('config')->get('config_secure') && $theme_config['admin_redirect_https'] && 0 === strpos('https', HTTPS_SERVER)) {
    header('Location: https://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI']);
    exit;
}

if (TB_Utils::parseDebug($theme_config['debug'])) {
    require_once TB_THEME_ROOT . '/library/vendor/FirePHP.php';

    FB::setOptions(array(
        'maxObjectDepth'      => 7,
        'maxArrayDepth'       => 7,
        'maxDepth'            => 10,
        'useNativeJsonEncode' => true,
        'includeLineNumbers'  => true
    ));
} else {
    if (!function_exists('fb')) {
        function fb($arg) {
            return $arg;
        }
    }
}