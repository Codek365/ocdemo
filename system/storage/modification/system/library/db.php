<?php
class DB {
	private $adaptor;

	public function __construct($adaptor, $hostname, $username, $password, $database, $port = NULL) {
		$class = 'DB\\' . $adaptor;

		if (class_exists($class)) {
			$this->adaptor = new $class($hostname, $username, $password, $database, $port);
		} else {
			throw new \Exception('Error: Could not load database adaptor ' . $adaptor . '!');
		}
	}

	public function query($sql, $params = array()) {

            static $cache_db = null;
            static $cache;

            if (null === $cache_db && class_exists('TB_Engine') && TB_Engine::hasInstance() && isset(TB_Engine::instance()->getThemeData()->system)) {
                $cache_db = false;
                $system_settings = TB_Engine::instance()->getThemeData()->system;

                if (!empty($system_settings['cache_db']) && defined('TB_OPTIMIZATIONS_DATABASE')) {
                    $optimizations_database = unserialize(TB_OPTIMIZATIONS_DATABASE);
                    $cache_db = array();

                    foreach ($optimizations_database['cache_items'] as $item_name => $item_value) {
                        if (isset($system_settings['cache_' . $item_name])) {
                            $cache_db[$item_name] = !empty($system_settings['cache_' . $item_name]) ? (int) $system_settings['cache_' . $item_name . '_ttl'] : 0;
                        } else {
                            $cache_db[$item_name] = (int) $item_value['default'] ? (int) $item_value['ttl'] : 0;
                        }

                    }
                }

                $cache = new TB_Cache(TB_Engine::instance()->getContext()->getTbCacheDir() . '/db');
            }

            if ($cache_db && 0 === stripos($sql, 'SELECT') && false === stripos($sql, 'burnengine')) {
                $cache_key = false;

                if ($cache_db['categories_sql'] && preg_match('/SELECT.*FROM ' . DB_PREFIX . 'category(_path)? /is', $sql)) {
                    $cache_key = 'categories_sql';
                } else
                if ($cache_db['products_sql'] && preg_match('/SELECT.*FROM ' . DB_PREFIX . 'product/is', $sql)) {
                    $cache_key = 'products_sql';
                } else
                if ($cache_db['information_sql'] && preg_match('/SELECT.*FROM ' . DB_PREFIX . 'information/is', $sql)) {
                    $cache_key = 'information_sql';
                } else
                if ($cache_db['manufacturer_sql'] && preg_match('/SELECT.*FROM ' . DB_PREFIX . 'manufacturer/is', $sql)) {
                    $cache_key = 'manufacturer_sql';
                } else
                if ($cache_db['other_sql'] && preg_match('/SELECT.*FROM ' . DB_PREFIX . 'layout_route|layout_module|language|oc_tax_rule/is', $sql)) {
                    $cache_key = 'other_sql';
                }

                if (false !== $cache_key) {
                    $query_hash = md5($sql);
                    if (!$result = $cache->get($cache_key . '_' . $query_hash)) {
                        $result = $this
                            ->db
                            ->query($sql);

                        $cache->set($cache_key . '_' . $query_hash, $result, $cache_db[$cache_key] * 60);
                    }

                    return $result;
                }
            }
            
		return $this->adaptor->query($sql, $params);
	}

	public function escape($value) {
		return $this->adaptor->escape($value);
	}

	public function countAffected() {
		return $this->adaptor->countAffected();
	}

	public function getLastId() {
		return $this->adaptor->getLastId();
	}
	
	public function connected() {
		return $this->adaptor->connected();
	}
}