<?php
// style shall be added around, not within htmlify
function htmlify($in)
{
  global $BaseDir;
  global $publicBase;

  foreach(preg_split("/((\r?\n)|(\r\n?))/", $in) as $line){
    $line = htmlspecialchars($line);
    if(preg_match("/(Please look at )(\\S*)/", $line, $match)){
      $link = preg_replace("!$BaseDir(.*)!","$publicBase$1",$match[2]);
      $displaypath = preg_replace("!$BaseDir/(.*)!","$1",$match[2]);
      $line = preg_replace("/(Please look at )(\\S*)/", "$1<a href=\"$link\">$displaypath</a>", $line);
    }
    
    if(preg_match("!$BaseDir([a-zA-Z0-9_\.\-/]+)!", $line, $match)){
      $link = preg_replace("!$BaseDir([a-zA-Z0-9_\.\-/]+)!","$publicBase$1",$match[1]);
      $displaypath = preg_replace("!$BaseDir/([a-zA-Z0-9_\.\-/]+)!","$1",$match[1]);
      $line = preg_replace("!$BaseDir([a-zA-Z0-9_\.\-/]+)!", "<a href=\"$link\">$displaypath</a>", $line);
      
    }
    if(strlen($line) > 0){
        $str .=  $line . "<br/>\n";
    }
  }

  return $str;
} 


function htmlForRetVal($in)
{
  $in = trim($in);
  if(strncmp("$in", "active", 6) == 0){
    return "<span style=\"color:orange\">$in</span>";
  }elseif($in == 0){
    return "<span style=\"color:green\">ok</span>";
  }else{
    return "<span style=\"color:red\">failed ($in)</span>";
  }
}

function htmlForResult($in)
{
  $in = trim($in);
  if(strlen($in) == 0){
    return "<span style=\"color:blue\">active</span>";
  }elseif($in < 0){
    return "<span style=\"color:orange\">warn</span>";
  }elseif($in == 0){
    return "<span style=\"color:green\">ok</span>";
  }else{
    return "<span style=\"color:red\">failed</span>";
  }
}

?>