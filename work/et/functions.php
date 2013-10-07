<?php
function startsWith($haystack, $needle)
{
   return !strncmp($haystack, $needle, strlen($needle));
}

function endsWith($haystack, $needle)
{
   $length = strlen($needle);
   if ($length == 0) {
      return true;
   }

   return (substr($haystack, -$length) === $needle);
}

function timesArray($times) {
   if (array_key_exists("per-stage", $times)) return $times;
   $result = array();
   $result["per-stage"] = array();
   $result["per-stage"]["/"] = $times;
   return $result;
}

function recordTime($times, $stageName, $time, $hsz) {
   $key = "/" . $stageName;
   if (array_key_exists($key, $times["per-stage"])) {
      $stageTimes = $times["per-stage"][$key];
   } else {
      $stageTimes = array();
   }
   $stageTimes[] = $time;
   $stageTimes = array_slice($stageTimes, -$hsz);
   $times["per-stage"][$key] = $stageTimes;
   return $times;
}
?>
