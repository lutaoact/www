<?php
$html = file_get_contents('http://www.baidu.com');
var_dump($http_response_header);
echo "<br>", "<br>";
$fp = fopen('http://www.baidu.com', 'r');
var_dump(stream_get_meta_data($fp));
fclose($fp);
?>
