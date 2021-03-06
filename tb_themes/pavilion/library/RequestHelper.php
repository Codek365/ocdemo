<?php

class TB_RequestHelper
{
    public static function isAjaxRequest()
    {
        return (bool) self::getHeader('X-Requested-With') ||
               self::getHeader('x-requested-with') ||
               (isset($_REQUEST['type']) && $_REQUEST['type'] == 'XMLHttpRequest');
    }

    public static function getHeader($header)
    {
        $temp = 'HTTP_' . strtoupper(str_replace('-', '_', $header));
        if (isset($_SERVER[$temp]) && !empty($_SERVER[$temp])) {
            return $_SERVER[$temp];
        }

        if (function_exists('apache_request_headers')) {
            $headers = apache_request_headers();
            if (!empty($headers[$header])) {
                return $headers[$header];
            }
        }

        return false;
    }

    public static function isRequestHTTPS()
    {
        return isset($_SERVER['HTTPS']) && (!strcasecmp($_SERVER['HTTPS'], 'on') || $_SERVER['HTTPS'] == 1);
    }

    public static function redirect($url, $status = 302)
    {
        header('Status: ' . $status);
        header('Location: ' . str_replace('&amp;', '&', $url));
        exit();
    }

    public static function lteIe9()
    {
        static $result = null;

        if (null === $result && isset($_SERVER['HTTP_USER_AGENT'])) {
            $result = preg_match('/(?i)msie [7-9]/',$_SERVER['HTTP_USER_AGENT']);
        }

        return $result;
    }
}