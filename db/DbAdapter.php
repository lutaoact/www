<?php
class DbAdapter {
	public function __construct(){
		mysql_connect('10.132.64.207', 'root', '111111') or die('could not connect to database');
		mysql_select_db('test_lutao');
	}
	
	public function runSql($sql) {
		return mysql_query($sql); 
	}
	
	private function format_data($params, $separator = ','){
		$str = $s = '';
		foreach ($params as $k => $v) {
			// $v = $this->_mysql->escape($v);
			// htmlspecialchars($v);
			$v = is_int($v) ? $v : "'{$v}'";
			$str .= $s . "`{$k}`={$v}";
			$s = $separator;
		}
		return $str;
	}
	
	private function format_list_to_string($list) {
		$list_string = '';
		foreach($list as $e) {
			$e = $this->escape($e);
			if($list_string == '') {
				$list_string = "'{$e}'";
			} else {
				$list_string .= ", '{$e}'";
			}
		}
		return $list_string;
	}
	
	public function insert_runner($params) {
		$data = $this->format_data($params);
		$sql = "INSERT 
					runner
				SET
					{$data}
		";
		return $this->runSql($sql);
	}
	
	public function select_all_runners() {
		$sql = "select * from runner";
		return $this->runSql($sql);
	}
}
?>