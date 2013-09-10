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
   if (array_key_exists("per-stage")) return $times;
   $result = array();
   $result["per-stage"] = array();
   $result["per-stage"]["/"] = $times;
   return $result;
}

function recordTime(&$times, $stageName, $time, $historysize) {
   $stageTimes = $times["per-stage"]["/" . $stageName];
   $stageTimes[] = $time;
   $stageTimes = array_slice($stageTimes, $historysize);
}
?>
