<?php

class TB_EnvHelper
{
    /**
     * @var TB_EnvHelper
     */
    protected static $instance;

    /**
     * @var Registry
     */
    protected $registry;

    protected function __construct(Registry $registry)
    {
        $this->registry = $registry;
    }

    /**
     * @param Registry $registry
     *
     * @throws InvalidArgumentException
     * @return TB_EnvHelper
     */
    public static function getInstance(Registry $registry = null)
    {
        if (!isset(self::$instance)) {
            if (null === $registry) {
                throw new InvalidArgumentException('You must supply Registry instance');
            }
            self::$instance = new self($registry);
        }

        return self::$instance;
    }

    public function getThemeConfig($basename)
    {
        static $config = null;

        if (null !== $config) {
            return $config;
        }

        $config_file = realpath(DIR_SYSTEM . '../') . '/tb_themes/' . $basename . '/config/theme.php';
        if (!file_exists($config_file)) {
            throw new Exception('The theme config file cannot be found: ' . $config_file);
        }

        $config = require_once $config_file;

        if (!is_array($config)) {
            throw new Exception('Theme config structure is not array');
        }

        return $config;
    }

    public function getCurrentLanguage($key = null)
    {
        static $current = null;

        if (null === $current) {
            /** @var $config Config */
            $config = $this->registry->get('config');

            foreach ($this->getLanguages() as $language) {
                if ($language['code'] == $config->get('config_language')) {
                    $current = $language;
                }
            }
        }

        return $key !== null ? $current[$key] : $current;
    }

    public function getLanguages($cache = true)
    {
        static $language_data = null;

        if (!$cache) {
            $language_data = null;
        }

        if (null !== $language_data) {
            return $language_data;
        }

        /** @var $db DB */
        $db = $this->registry->get('db');

        $language_data = array();

        $query = $db->query("SELECT * FROM " . DB_PREFIX . "language ORDER BY sort_order, name");
        foreach ($query->rows as $result) {
            if (version_compare(VERSION, '2.2.0.0', '>=') ) {
                $directory = $result['code'];
                $filename  = $result['code'];
            } else {
                $directory = $result['directory'];
                //$filename  = isset($result['filename']) ? $result['filename'] : $result['directory'];
                $filename  = isset($result['filename']) ? $result['filename'] : 'default';
            }

            $language_data[$result['language_id']] = array(
                'id'          => (int) $result['language_id'],
                'language_id' => (int) $result['language_id'],
                'name'        => $result['name'],
                'code'        => $result['code'],
                'locale'      => $result['locale'],
                'image'       => $result['image'],
                'directory'   => $directory,
                'filename'    => $filename,
                'sort_order'  => $result['sort_order'],
                'status'      => $result['status']
            );
        }

        return $language_data;
    }
}