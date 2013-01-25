<?php
require_once('db/DbAdapter.php');

$action = $_REQUEST['action'];

switch($action) {
	case 'addRunner':
		add_runner();
		break;
	case 'getRunners':
		get_runners();
		break;
	default:
		break;
}

function add_runner() {
	$db = new DbAdapter();
	$params = array(
		first_name => $_REQUEST[first_name],
		last_name => $_REQUEST[last_name],
		gender => $_REQUEST[gender],
		finish_time => $_REQUEST[minute] . ':' . $_REQUEST[second]
	);
	$db->insert_runner($params);
}

function get_runners() {
	$db = new DbAdapter();
	$res = $db->select_all_runners();
	$runners = array();
	while($row = mysql_fetch_array($res, MYSQL_ASSOC)) {
		array_push($runners, $row);
	}
	echo json_encode($runners);
}
?>