<?php
$repobaselink = "http://git.savannah.gnu.org/cgit/liberty-eiffel.git/tree";
$commitbaselink = "http://git.savannah.gnu.org/cgit/liberty-eiffel.git/commit/?id=";
$BaseDir = "/home/et";
$LibertyBase = "$BaseDir/Liberty";
$out = "$BaseDir/Liberty/website/et";
$stageout_cfg = "$out/stages";
$stageout = "$stageout_cfg"; // do not change, this is kept for backward compatibility

$historysize = 6; // note: delete stagehistory manually on decrease

$lock = "$BaseDir/check.lock";
$request = "$out/request.new";
$requestJsonObj = "$out/request.serialjson";
$activeJsonObj = "$out/active.serialjson";

$currentTimes = "$out/current_times";
$timesHistory = "$out/times_history";

$templates = "$out/html_templates";

$dateFormat = "Y-m-d G:i:s O (T)";
$debuildDateFormat = "Ymd.His";

$publicBase = "";
$img = "$publicBase/images";

$breakFlag = "$out/break.flag";

$gitBranch = "master";
if (file_exists("$BaseDir/branch")) {
   $gitBranch = trim(file_get_contents("$BaseDir/branch"));
}
?>