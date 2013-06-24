<?php
include "config.php";
$line = file_get_contents('php://input');
list($key, $value)  = explode("=", $line);
if($key == "payload"){
  $json_str = json_decode(urldecode($value), TRUE);

  if(json_last_error()){
    echo "failed";
  }else{
    echo "ok";
  }

  $last_commit = $json_str['commits'][count($json_str['commits']) - 1]['author']['email'];
  file_put_contents ($request, "new request on " . date('Y-m-d G:i:s') . "\n" 
		     . urldecode($value)
		     );
  file_put_contents ($requestJsonObj, serialize($json_str));

  chmod($request, 0666);
}else{
  echo "did not understand the request";
}

?>