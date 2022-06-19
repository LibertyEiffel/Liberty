#!/usr/bin/php
<?php
include "config.php";
include "functions.php";
setlocale(LC_ALL, 'en_US.utf8');

// store active commits for stage history
// grep warnings (eiffel and C compiler) from eiffeltest output
// add email notification
// todo: add IRC handling: http://oreilly.com/pub/h/1963
// todo: add -Wall compiler option

$force = false;
$verbose = false;

foreach ($argv as $arg){
   if ($arg == "--force") {
      $force = true;
   } elseif ($arg == "--verbose") {
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

// adds two warning/error counts
// if $a and $b have the same sign, the sum is returned
// other wise the positive (=the error count) is returnd
function warnErrAdd($a, $b) {
   if ($a <= 0) {
      if ($b < 0) {
         $result = $a + $b;
      }else{
         $result = $b;
      }
   } else {
      if ($b >= 0) {
         $result = $a + $b;
      } else {
         $result = $a;
      }
   }
   return $result;
}

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

function checkBreak(){
    global $breakFlag, $lock;
    if (file_exists($breakFlag)) {
        echo "Interrupted build.";
        unlink($breakFlag);
        unlink($lock);
        exit(1);
    }
}

function substage($name, $link = ""){
   global $stagedir, $stageout, $verbose, $stageStackName, $stageStackTime, $dateFormat;

   checkBreak();

   $substageDepth = count($stageStackName);
   array_push($stageStackName, iconv('utf-8', 'us-ascii//TRANSLIT', $name));
   $startTime = time();
   array_push($stageStackTime, $startTime);

   $fullStageName = implode("/", $stageStackName);

   $stagedir = "$stageout/" . $fullStageName;

   if ($verbose) echo "starting " . $fullStageName . " in $stagedir ...\n";

   file_put_contents("$stageout/current_stage.txt", $stagedir);

   if (!is_dir($stagedir)) {
      mkdir($stagedir, 0755);
   } else {
      system("rm -rf ". $stagedir . "/* > /dev/null");
   }

   file_put_contents("$stagedir/retValue.txt", "active (since " . date($dateFormat) .")");
   file_put_contents("$stagedir/stagename.txt", "$fullStageName");
   if (strlen($link) > 0) {
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

   checkBreak();

   $fullStageName = implode("/", $stageStackName);
   $startTime = array_pop($stageStackTime);
   $endTime = time();
   $times = recordTime($times, $fullStageName, (int)($endTime - $startTime), $historysize);

   if ($verbose) echo "end substage $stage/" . implode("/", $stageStackName) . " ...(" . $stagedir ."\n";
   file_put_contents("$stagedir/end.txt", $endTime);
   touch($stagedir);
   sleep(2);

   array_pop($stageStackName);

   $fullStageName = implode("/", $stageStackName);

   $stagedir = "$stageout/" . $fullStageName;
   file_put_contents("$stageout/current_stage.txt", $stagedir);

   if ($verbose) echo "new (old) stagedir is " . $stagedir ."\n";
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

   checkBreak();

   if ($verbose) echo "executing '$cmd'\n";
   file_put_contents($stagedir . "/cmd.txt", $cmd);
   system("( ulimit -t " . $ulimit_time . " ; ulimit -v " . $ulimit_virt . " ; ulimit -m " . $ulimit_virt . " ; " . $cmd . " ) > '" . $stagedir . "/out.txt' 2>'" .$stagedir . "/err.txt'", $retval);
   file_put_contents($stagedir . "/retValue.txt", $retval);
   if ($simple) file_put_contents($stagedir ."/result.txt", $retval);

   return $retval;
}

if ($verbose) echo "wakeup ET...\n";

if (file_exists($lock)) {
   if ($verbose) echo "still working on last update (you may want to kill the active process and rm $lock)\n";
   exit(1);
}

if (!$force) {
   system("users | grep et > /dev/null", $retVal);
   if (file_exists($request)) {
      $reqStr = file_get_contents($request);
      if (!preg_match("/MANUAL/", $reqStr) && ($retVal == 0)) {
         echo "et logged in - nothing done while in maintainance, please logout\n";
         exit(2);
      }
   } else {
      // no new request
      if ($verbose) echo "nothing to do.\n";
      exit(0);
   }
   unlink($request);
}

$startTime = time();
file_put_contents ($lock, "started on " . date($dateFormat, $startTime) . ($force?" with force":""));
unlink($activeJsonObj);
if (file_exists($requestJsonObj)) {
   rename($requestJsonObj, $activeJsonObj);
}

system("rm -rf ". $stageout . "_$historysize > /dev/null");

for ($i = $historysize; $i > 1 ; $i--) {
   system("mv " . $stageout . "_" . ($i - 1) . " " . $stageout . "_" . $i . " > /dev/null");
}
system("mv " . $stageout . " " . $stageout . "_1 > /dev/null");

mkdir($stageout, 0755);
if (file_exists($activeJsonObj)) {
   copy($activeJsonObj, $stageout . "/saved.serialjson");
}

if (substage("git pull")) {
   if (execute("cd $LibertyBase && git fetch origin && git checkout $gitBranch && git clean -f && git merge --ff-only FETCH_HEAD") != 0) {
      failed();
   }
   endsubstage();
}

if (substage("bootstrap")) {
   if (execute("cd $LibertyBase && ./install.sh -plain -bootstrap", $ulimit_time = 3600) > 0) {
      failed();
   }
   endsubstage();
}

if (substage("class check ANY")) {
   if (execute("se class_check ANY") > 0) {
      failed();
   }
   endsubstage();
}

//- se doc
if (substage("eiffeldoc")) {
   execute("$LibertyBase/work/build_doc.sh -plain -zip && mkdir -p $LibertyBase/website/doc/files && rm -f $LibertyBase/website/doc/files/*.tgz && mv $LibertyBase/website/doc/api/*.tgz $LibertyBase/website/doc/files/", $ulimit_time = 3600, $ulimit_virt = 8388608);
   endsubstage();
}

//- debian packaging
if (substage("debian packaging")) {
   $pkg_result = 0;
   if (substage("source")) {
      $result = execute("export PKG_DATE='" . date($debuildDateFormat, $startTime) . "' ; $LibertyBase/work/packaging/build_debian.sh -debuild=-S && mkdir -p $LibertyBase/work/packaging/debs_src && ln $LibertyBase/work/packaging/debs/* $LibertyBase/work/packaging/debs_src/", $ulimit_time = 3600, $ulimit_virt = 8388608);
      file_put_contents($stagedir ."/result.txt", $result);
      $pkg_result += $result;
      endsubstage();
   }
   if (substage("amd64")) {
      $result = execute("export PKG_DATE='" . date($debuildDateFormat, $startTime) . "' ; $LibertyBase/work/packaging/build_debian.sh -debuild=-b && mkdir -p $LibertyBase/work/packaging/debs_amd64 && ln $LibertyBase/work/packaging/debs/* $LibertyBase/work/packaging/debs_amd64/", $ulimit_time = 3600, $ulimit_virt = 8388608);
      file_put_contents($stagedir ."/result.txt", $result);
      $pkg_result += $result;
      endsubstage();
   }
   if (substage("i386")) {
      $result = execute("ssh et32@et32 \"export PKG_DATE='" . date($debuildDateFormat, $startTime) . "' ; cd $LibertyBase && git fetch origin && git checkout $gitBranch && git merge --ff-only FETCH_HEAD && $LibertyBase/work/packaging/build_debian.sh -debuild=-b\" && mkdir -p $LibertyBase/work/packaging/debs_i386 && scp -p et32@et32:$LibertyBase/work/packaging/debs/* $LibertyBase/work/packaging/debs_i386/", $ulimit_time = 3600);
      file_put_contents($stagedir ."/result.txt", $result);
      $pkg_result += $result;
      endsubstage();
   }
   if (substage("deploy")) {
      $result = execute("mkdir -p $LibertyBase/work/packaging/debs && ln $LibertyBase/work/packaging/debs_*/* $LibertyBase/work/packaging/debs/ && rm -rf $LibertyBase/work/packaging/debs_* ; export PKG_DATE='" . date($debuildDateFormat, $startTime) . "' && $LibertyBase/work/packaging/build_debian.sh -deploy",  $ulimit_time = 3600, $ulimit_virt = 8388608);
      $pkg_result += $result;
      endsubstage();
   }
   file_put_contents($stagedir ."/result.txt", $pkg_result);
   endsubstage();
}

function tutorialDir($dir) {
   global $stagedir;
   global $dateFormat;
   global $repobaselink, $LibertyBase;
   $result = 0;
   $acecnt = count(glob("$dir/*.ace"));

   if ($acecnt > 0) {
      foreach (glob("$dir/*.ace") as $acefilename) {
         if (substage("ACE file " . basename($acefilename), str_replace($LibertyBase, $repobaselink, $acefilename))) {
            $ret = execute("cd $dir && se c --clean " . $acefilename);
            if ($ret > 0) {
               $curRes = $ret;
            } else {
               $curRes = 0 - exec("grep -i " . escapeshellarg("Warning:") . " " . escapeshellarg($stagedir . "/err.txt") . " | wc -l");
            }
            if ($curRes > 0 || $result == 0) {
               $result = $curRes;
            }
            file_put_contents($stagedir ."/result.txt", $curRes);
            endsubstage();
         }
      }
   } else {
      foreach (glob("$dir/*") as $filename) {
         if (is_file($filename) && preg_match("/(.*)\.e$/", $filename)) {
            $class = strtoupper(basename($filename, ".e"));
            if (substage("class $class", str_replace($LibertyBase, $repobaselink, $filename))) {
               $exe = basename($filename, ".e");
               $cmdfile = "$dir/$exe.cmd";
               if (file_exists($cmdfile)) {
                  $cmd = trim(file_get_contents($cmdfile));
               } else {
                  $cmd = "se c $class";
               }
               $ret = execute("cd $dir && $cmd -clean -o $exe");
               if ($ret > 0) {
                  $curRes = $ret;
               } else {
                  $warnCnt = exec("grep -i " . escapeshellarg("Warning:") . " " . escapeshellarg($stagedir . "/err.txt") . " | wc -l");
                  $curRes = -$warnCnt;
                  if (file_exists("$dir/output")) {
                     $ret = execute("$dir/$exe > $dir/$exe.out && diff -u $dir/output $dir/$exe.out");
                     if ($ret > 0) {
                        $curRes = $ret;
                     }
                  }
               }
               if ($curRes <= 0) {
                  if ($result <= 0) {
                     $result += $curRes;
                  }
               } else {
                  if ($result >= 0) {
                     $result += $curRes;
                  } else {
                     $result = $curRes;
                  }
               }
               file_put_contents($stagedir ."/result.txt", $curRes);
               endsubstage();
            }
         }
      }
   }

   foreach (glob("$dir/*", GLOB_ONLYDIR) as $dirname) {
      if (!startsWith(basename($dirname), "aux")) {
         if (substage(basename($dirname), str_replace($LibertyBase, $repobaselink, $dirname))) {
            $res = tutorialDir($dirname);

            if ($res <= 0) {
               if ($result <= 0) {
                  $result += $res;
               }
            } else {
               if ($result >= 0) {
                  $result += $res;
               } else {
                  $result = $res;
               }
            }
            endsubstage();
         }
      }
   }

   file_put_contents($stagedir ."/result.txt", $result);
   return $result;
}
if (substage("compile tutorial")) {
   tutorialDir("$LibertyBase/tutorial");
   endsubstage();
}

function testDir($dir) {
   global $stagedir;
   global $repobaselink, $LibertyBase;
   $result = 0;

   foreach (glob("$dir/*", GLOB_ONLYDIR) as $dirname) {
      if (basename($dirname) != "eiffeltest") {
         if (substage(basename($dirname), str_replace($LibertyBase, $repobaselink, $dirname))) {
            $res = testDir($dirname);
            if ($res <= 0) {
               if ($result <= 0) {
                  $result += $res;
               }
            } else {
               if ($result >= 0) {
                  $result += $res;
               } else {
                  $result = $res;
               }
            }
            endsubstage();
         }
      }
   }

   $tests = count(glob("$dir/test_*.e")) + count(glob("$dir/bad_*.e")) + count(glob("$dir/ace_*.ace"));
   if ($tests > 0) {
      $hasEiffelTest = is_dir("$dir/eiffeltest");
      if ($hasEiffelTest) {
         if(file_exists("$dir/eiffeltest/LOCK")){
            unlink("$dir/eiffeltest/LOCK");
         }
         $res = execute("se test -flat $dir");
         if ($res == 0) {
             foreach(file($stagedir . "/err.txt") as $line) {
                 if(preg_match("/Warning:/i", $line)){
                     $warnCnt++;
                 }
             }
             $res = -$warnCnt;
         } else {
             $cases = array();
             foreach(file($dir . "/eiffeltest/log.new") as $line) {
                 if(preg_match("/^Abnormal:.*\"(.*)\\.exe\"\\.\"\\./i", $line, $matches)) {
                     $tcase = $matches[1];
                     print("found '$tcase'\n");
                     $cases[] = $tcase;
                 }
             }
             $cases = array_unique($cases);
             foreach($cases as $case) {
                 foreach(file($dir . "/" . $case. ".e") as $line) {
                     if(preg_match("/--\s*(BUG|TASK)#(\S)-(\d+)/i", $line, $matches)) {
                         $type = $matches[1]; // BUG or TASK
                         $sys = $matches[2]; // the ticket system. S = GNU savannah
                         $id =  $matches[3];
                         file_put_contents($dir . "/eiffeltest/tickets.txt", $case . ": " . $type . "(" . $sys . "): " . $id . "\n", FILE_APPEND);
                         
                     }
                 }
             }
             
             $res += count($cases);
         }
      } else {
         file_put_contents($stagedir . "/err.txt", "missing eiffeltest directory - please add to repository");
         $res = 1;
      }
      if ($res <= 0) {
         if ($result <= 0) {
            $result += $res;
         }
      } else {
         if ($result >= 0) {
            $result += $res;
         } else {
            $result = $res;
         }
      }
   }

   file_put_contents($stagedir ."/result.txt", $result);
   return $result;
}
if (substage("TestSuite")) {
   testDir("$LibertyBase/test");
   endsubstage();
}

// generate the wrapper $name
function genWrapper($name) {
   global $LibertyBase;
   $result = 0;

   if (substage($name)) {
      $result = execute("cd $LibertyBase/src/wrappers && make " . $name, $ulimit_time = 3600);
      endsubstage();
   }
   return $result;
}

if (substage("wrappers")) {
   $wrapperresult = 0;
   if (substage("generate wrappers")) {
      $genresult =                        genWrapper("common");
      $genresult = warnErrAdd($genresult, genWrapper("ffi"));
      $genresult = warnErrAdd($genresult, genWrapper("posix"));
      $genresult = warnErrAdd($genresult, genWrapper("posix/dynamic-linking"));
      $genresult = warnErrAdd($genresult, genWrapper("readline"));
      $genresult = warnErrAdd($genresult, genWrapper("xml"));
      $genresult = warnErrAdd($genresult, genWrapper("zmq"));
      $wrapperresult = $genresult;
      
      file_put_contents($stagedir ."/result.txt", $wrapperresult);
      endsubstage();
   }

   if (substage("compile examples")) {
      $result = 0;
      foreach (glob("$LibertyBase/src/wrappers/*/examples/*_example.e") as $filename) {
         if (is_file($filename) && preg_match("/(.*)\.e$/", $filename)) {
            $class = strtoupper(basename($filename, ".e"));
            $dir = dirname($filename);
            
            if (substage($class)) {
               $ret = execute("cd $dir && se c --clean -o " . strtolower(basename($filename, ".e")) . " " . $class, $ulimit_time = 3600);

               if ($ret > 0) {
                  $curRes = $ret;
               } else {
                  $warnCnt = exec("grep -i " . escapeshellarg("Warning:") . " " . escapeshellarg($stagedir . "/err.txt") . " | wc -l");
                  $curRes = -$warnCnt;
               }
               file_put_contents($stagedir ."/result.txt", $curRes);
               $result =  warnErrAdd($result, $curRes);

               endsubstage();
            }
         }
      }
      file_put_contents($stagedir ."/result.txt", $result);
      $wrapperresult =  warnErrAdd($wrapperresult, $result);

      endsubstage();
   }

   if (substage("cleanup wrappers")) {
      $result = execute("cd $LibertyBase && git checkout -f -- src/wrappers", $ulimit_time = 3600);
      $wrapperresult =  warnErrAdd($wrapperresult, $result);

      endsubstage();
   }
   
   file_put_contents($stagedir ."/result.txt", $wrapperresult);
   endsubstage();
}


file_put_contents("$stageout/current_stage.txt","");

$times = recordTime($times, "", (int)(time() - $startTime), $historysize);
file_put_contents($timesHistory, serialize($times));

unlink($lock);

if ($verbose) echo "good night.\n";

exit(0);
?>
