#!/usr/bin/php
<?php
include "config.php";
include "functions.php";
setlocale(LC_ALL, 'en_US.utf8');

// store active commits for stage history
// grep warnings (eiffel and C compiler) from eiffeltest output
// add a cleaning phase: e. g. remove all LOCK files from eiffeltest
// add email notification
// todo: add IRC handling: http://oreilly.com/pub/h/1963
// todo: add -Wall compiler option

$force = false;
$verbose = false;

foreach ($argv as $arg){
   if($arg == "--force"){
      $force = true;
   }elseif($arg == "--verbose"){
      $verbose = true;
   }
}

$stageStackName = array();
$stageStackTime = array();

if (file_exists($timesHistory)) {
    $times = unserialize(file_get_contents($timesHistory));
} else {
    $times = array();
}
$times = timesArray($times);

// ends current stage and terminates ET
// call for stages where continuing is not useful
function failed(){
   global $out, $verbose, $lock, $stagedir;
   $outStr = file_get_contents($stagedir . "/out.txt");
   $stagename = file_get_contents($stagedir ."/stagename.txt");
   echo "stage $stagedir ($stagename) failed:\n\n--------\n" . $outStr . "\n--------";
   unlink($lock);
   exit(1);
}

function substage($name, $link = ""){
   global $stagedir, $stageout, $verbose, $stageStackName, $stageStackTime, $dateFormat;

   $substageDepth = count($stageStackName);
   array_push($stageStackName, iconv('utf-8', 'us-ascii//TRANSLIT', $name));
   $startTime = time();
   array_push($stageStackTime, $startTime);

   $fullStageName = implode("/", $stageStackName);

   $stagedir = "$stageout/" . $fullStageName;

   if($verbose) echo "starting " . $fullStageName . " in $stagedir ...\n";

   file_put_contents("$stageout/current_stage.txt", $stagedir);

   if(!is_dir($stagedir)){
      mkdir($stagedir, 0755);
   }else{
      system("rm -rf ". $stagedir . "/* > /dev/null");
   }

   file_put_contents("$stagedir/retValue.txt", "active (since " . date($dateFormat) .")");
   file_put_contents("$stagedir/stagename.txt", "$fullStageName");
   if(strlen($link) > 0){
      file_put_contents("$stagedir/stagelink.txt", "$link");
   }
   file_put_contents("$stagedir/start.txt", $startTime);
   touch($stagedir . "/cmd.txt");
   touch($stagedir . "/out.txt");
   touch($stagedir . "/err.txt");

   return true;
}

function endsubstage(){
   global $stageStackName, $stageStackTime, $verbose, $stage, $stagedir, $stageout, $times, $historysize;

   $fullStageName = implode("/", $stageStackName);
   $startTime = array_pop($stageStackTime);
   $endTime = time();
   $times = recordTime($times, $fullStageName, (int)($endTime - $startTime), $historysize);

   if($verbose) echo "end substage $stage/" . implode("/", $stageStackName) . " ...(" . $stagedir ."\n";
   file_put_contents("$stagedir/end.txt", $endTime);
   touch($stagedir);
   sleep(2);

   array_pop($stageStackName);

   $fullStageName = implode("/", $stageStackName);

   $stagedir = "$stageout/" . $fullStageName;
   file_put_contents("$stageout/current_stage.txt", $stagedir);

   if($verbose) echo "new (old) stagedir is " . $stagedir ."\n";
}

// returns:
// 0 success
// 1 error
// (-1 warning) - cannot be detected here
// filling result is the callers obligation if not called with simple = true
function execute($cmd, $simple = true, $ulimit_time = 600, $ulimit_virt = 4194304){ // 5 minutes CPU, 4Gio virtual memory: should be plenty for most cases
   global $stagedir;
   global $out;
   global $verbose;
   if($verbose) echo "executing '$cmd'\n";
   file_put_contents($stagedir . "/cmd.txt", $cmd);
   system("( ulimit -t " . $ulimit_time . " ; ulimit -v " . $ulimit_virt . " ; ulimit -m " . $ulimit_virt . " ; " . $cmd . " ) > '" . $stagedir . "/out.txt' 2>'" .$stagedir . "/err.txt'", $retval);
   file_put_contents($stagedir . "/retValue.txt", $retval);
   if($simple)    file_put_contents($stagedir ."/result.txt", $retval);

   return $retval;
}

if($verbose) echo "wakeup ET...\n";

if(file_exists($lock)){
   if($verbose) echo "still working on last update (you may want to kill the active process and rm $lock)\n";
   exit(1);
}

if(!$force){
   system("users | grep et > /dev/null", $retVal);
   if(file_exists($request)){
      $reqStr = file_get_contents($request);
      if(!preg_match("/MANUAL/", $reqStr) && ($retVal == 0)){
         echo "et logged in - nothing done while in maintainance, please logout\n";
         exit(2);
      }
   }else{
      // no new request
      if($verbose) echo "nothing to do.\n";
      exit(0);
   }
   unlink($request);
}

$startTime = time();
file_put_contents ($lock, "started on " . date($dateFormat, $startTime) . ($force?" with force":""));
unlink($activeJsonObj);
rename($requestJsonObj, $activeJsonObj);

system("rm -rf ". $stageout . "_$historysize > /dev/null");

for($i = $historysize; $i > 1 ; $i--){
   system("mv " . $stageout . "_" . ($i - 1) . " " . $stageout . "_" . $i . " > /dev/null");
}
system("mv " . $stageout . " " . $stageout . "_1 > /dev/null");

mkdir($stageout, 0755);
copy($activeJsonObj, $stageout . "/saved.serialjson");

if (substage("git pull")){
   if(execute("cd $LibertyBase && git fetch origin && git checkout $gitBranch") != 0){
      failed();
   }
   endsubstage();
}

if (substage("bootstrap")){
   if(execute("cd $LibertyBase && ./install.sh -plain -bootstrap", $ulimit_time = 3600) > 0){
      failed();
   }
   endsubstage();
}

if (substage("class check ANY")){
   if(execute("se class_check ANY") > 0){
      failed();
   }
   endsubstage();
}

//- se doc
if (substage("eiffeldoc")){
   execute("$LibertyBase/work/build_doc.sh -plain", $ulimit_time = 3600);
   endsubstage();
}

//- debian packaging
if (substage("debian packaging")){
   execute("$LibertyBase/work/packaging/build_debian.sh", $ulimit_time = 3600);
   endsubstage();
}

function tutorialDir($dir){
   global $stagedir;
   global $dateFormat;
   global $repobaselink, $LibertyBase;
   $result = 0;
   $acecnt = count(glob("$dir/*.ace"));

   if($acecnt > 0){
      foreach (glob("$dir/*.ace") as $acefilename){
         if (substage("ACE file " . basename($acefilename), str_replace($LibertyBase, $repobaselink, $acefilename))){
            $ret = execute("cd $dir && se c --clean " . $acefilename);
            if($ret > 0){
               $curRes = $ret;
            }else{
               $curRes = 0 - exec("grep " . escapeshellarg("Warning:") . " " . escapeshellarg($stagedir . "/err.txt") . " | wc -l");
            }
            if($curRes > 0 || $result == 0){
               $result = $curRes;
            }
            file_put_contents($stagedir ."/result.txt", $curRes);
            endsubstage();
         }
      }
   }else{
      foreach (glob("$dir/*") as $filename){
         if(is_file($filename) && preg_match("/(.*)\.e$/", $filename)){
            $class = strtoupper(basename($filename, ".e"));
            if (substage("class $class", str_replace($LibertyBase, $repobaselink, $filename))){
               $cmdfile = "$dir/" . basename($filename, ".e") . ".cmd";
               if (file_exists($cmdfile)) {
                  $cmd = trim(file_get_contents($cmdfile));
               } else {
                  $cmd = "se c $class";
               }
               $ret = execute("cd $dir && $cmd -o " . basename($filename, ".e") . " && se clean $class");
               /* TODO : if an "output" file exists, execute the program and compare the output */
               if($ret > 0){
                  $curRes = $ret;
               }else{
                  $curRes = 0 - exec("grep " . escapeshellarg("Warning:") . " " . escapeshellarg($stagedir . "/err.txt") . " | wc -l");
               }
               if($curRes <= 0) {
                  if($result <= 0){
                     $result += $curRes;
                  }
               }else{
                  if($result >= 0){
                     $result += $curRes;
                  }else{
                     $result = $curRes;
                  }
               }
               file_put_contents($stagedir ."/result.txt", $curRes);
               endsubstage();
            }
         }
      }
      foreach (glob("$dir/*", GLOB_ONLYDIR) as $dirname){
         if(!endsWith($dirname, "auxiliary")){
            if (substage(basename($dirname), str_replace($LibertyBase, $repobaselink, $dirname))){
               $res = tutorialDir($dirname);

               if($res <= 0) {
                  if($result <= 0){
                     $result += $res;
                  }
               }else{
                  if($result >= 0){
                     $result += $res;
                  }else{
                     $result = $res;
                  }
               }
               endsubstage();
            }
         }
      }
   }
   file_put_contents($stagedir ."/result.txt", $result);
   return $result;
}
if (substage("compile tutorial")){
   tutorialDir("$LibertyBase/tutorial");
   endsubstage();
}

function testDir($dir){
   global $stagedir;
   global $repobaselink, $LibertyBase;
   $result = 0;

   foreach (glob("$dir/*", GLOB_ONLYDIR) as $dirname){
      if(basename($dirname) != "eiffeltest"){
         if (substage(basename($dirname), str_replace($LibertyBase, $repobaselink, $dirname))){
            $res = testDir($dirname);
            if($res <= 0) {
               if($result <= 0){
                  $result += $res;
               }
            }else{
               if($result >= 0){
                  $result += $res;
               }else{
                  $result = $res;
               }
            }
            endsubstage();
         }
      }
   }

   $tests = count(glob("$dir/test_*.e")) + count(glob("$dir/bad_*.e")) + count(glob("$dir/ace_*.ace"));
   $hasEiffelTest = is_dir("$dir/eiffeltest");
   if($tests > 0){
      if($hasEiffelTest){
         $res = execute("se test -flat $dir");
         if($res == 0){
            $warnCnt = exec("grep " . escapeshellarg("Warning:") . " " . escapeshellarg($stagedir . "/err.txt") . " | wc -l");
            $res = -$warnCnt;
         }
      }else{
         file_put_contents($stagedir ."/err.txt", "missing eiffeltest directory - please add to repository");
         $res = 1;
      }
      if($res <= 0) {
         if($result <= 0){
            $result += $res;
         }
      }else{
         if($result >= 0){
            $result += $res;
         }else{
            $result = $res;
         }
      }
   }

   file_put_contents($stagedir ."/result.txt", $result);
   return $result;
}
if (substage("TestSuite")){
   testDir("$LibertyBase/test");
   endsubstage();
}

file_put_contents("$stageout/current_stage.txt","");

$times = recordTime($times, "", (int)(time() - $startTime), $historysize);
file_put_contents($timesHistory, serialize($times));

unlink($lock);

if($verbose) echo "good night.\n";

exit(0);
?>
