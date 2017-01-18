<?php
class Request {
	public $get = array();
	public $post = array();
	public $cookie = array();
	public $files = array();
	public $server = array();

	public function __construct() {

            if (get_magic_quotes_gpc() && !version_compare(VERSION, '2.1.0.0', '>=')) {
                function stripslashes_deep($value) {
                    $value = is_array($value) ? array_map('stripslashes_deep', $value) : stripslashes($value);

                    return $value;
                }

                $_POST = array_map('stripslashes_deep', $_POST);
                $_GET = array_map('stripslashes_deep', $_GET);
                $_COOKIE = array_map('stripslashes_deep', $_COOKIE);
                $_REQUEST = array_map('stripslashes_deep', $_REQUEST);
            }
            
		$this->get = $this->clean($_GET);
		$this->post = $this->clean($_POST);
		$this->request = $this->clean($_REQUEST);
		$this->cookie = $this->clean($_COOKIE);
		$this->files = $this->clean($_FILES);
		$this->server = $this->clean($_SERVER);
	}

	public function clean($data) {
		if (is_array($data)) {
			foreach ($data as $key => $value) {
				unset($data[$key]);

				$data[$this->clean($key)] = $this->clean($value);
			}
		} else {
			$data = htmlspecialchars($data, ENT_COMPAT, 'UTF-8');
		}

		return $data;
	}
}