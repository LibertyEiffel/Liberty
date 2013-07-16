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

$stageStack = array();
$stageStackNo = array();

// ends current stage and terminates ET
// call for stages where continuing is not useful
function failed(){
  global $out;
  global $verbose;
  global $lock;
  global $stagedir;
  $outStr = file_get_contents ($stagedir . "/out.txt");
  $stagename = file_get_contents($stagedir ."/stagename.txt");
  echo "stage $stagedir ($stagename) failed:\n\n--------\n" . $outStr . "\n--------";
  unlink($lock);
  exit(1);
}

function substage($name, $link = ""){
  global $stagedir;
  global $out, $stageout;
  global $verbose;
  global $substageNo, $stageStack, $stageStackNo, $lastsubStageNo;
  global $dateFormat;

  $substageDepth = count($stageStack);
  array_push ($stageStack, iconv('utf-8', 'us-ascii//TRANSLIT', $name));

  $stagedir = "$stageout/" . implode("/", $stageStack);

  if($verbose) echo "starting " . implode("/", $stageStack) . " in $stagedir ...\n";

  file_put_contents("$stageout/current_stage.txt", $stagedir);

  if(!is_dir($stagedir)){
      mkdir($stagedir, 0755);
  }else{
      system("rm -rf ". $stagedir . "/* > /dev/null");
  }

  file_put_contents("$stagedir/retValue.txt", "active (since " . date($dateFormat) .")");
  file_put_contents("$stagedir/stagename.txt", "$name");
  if(strlen($link) > 0){
      file_put_contents("$stagedir/stagelink.txt", "$link");
  }
  file_put_contents("$stagedir/start.txt", time());
  touch($stagedir . "/cmd.txt");
  touch($stagedir . "/out.txt");
  touch($stagedir . "/err.txt");

}

function endsubstage(){
    global $stageStack, $verbose, $stage, $stagedir, $stageout;

    if($verbose) echo "end substage $stage/" . implode("/", $stageStack) . " ...(" . $stagedir ."\n";
    file_put_contents("$stagedir/end.txt", time());
    touch($stagedir);
    sleep(2);

    array_pop ($stageStack);

    $stagedir = "$stageout/" . implode("/", $stageStack);

    if($verbose) echo "new (old) stagedir is " . $stagedir ."\n";
}

// returns:
// 0 success
// 1 error
// (-1 warning) - cannot be detected here
// filling result is the callers obligation if not called with simple = true
function execute($cmd, $simple = true){
    global $stagedir;
    global $out;
    global $verbose;
    if($verbose) echo "executing '$cmd'\n";
    file_put_contents($stagedir . "/cmd.txt", $cmd);
    system("{ " . $cmd . " ; " . "} > '$stagedir" ."/out.txt' 2>'$stagedir" . "/err.txt'", $retval);
    file_put_contents($stagedir ."/retValue.txt", $retval);
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
      $reqStr = file_get_contents ($request);
      if(!preg_match("/MANUAL/", $reqStr) && ($retVal == 0)){
          if($verbose) echo "et logged in - nothing done for maintainance\n";
          exit(2);
      }
  }else{
    // no new request
    exit(0);
  }
  unlink($request);
}

file_put_contents ($lock, "started on " . date($dateFormat) . ($force?" with force":""));
copy($requestJsonObj, $activeJsonObj);

system("rm -rf ". $stageout . "_$historysize > /dev/null");

for($i = $historysize; $i > 1 ; $i--){
    system("mv " . $stageout . "_" . ($i - 1) . " " . $stageout . "_" . $i . " 2>&1 > /dev/null");
}
system("mv " . $stageout . " " . $stageout . "_1 > /dev/null");
mkdir($stageout, 0755);

substage("git pull");
if(execute("cd $LibertyBase && git pull") != 0){
  failed();
}
endsubstage();

substage("bootstrap");
if(execute("cd $LibertyBase && ./install.sh -plain -bootstrap") > 0){
    failed();
}
endsubstage();

substage("class check ANY");
execute("se class_check ANY");
endsubstage();

//- se doc
substage("eiffeldoc");
execute("$LibertyBase/work/build_doc.sh -plain");
endsubstage();

//- debian packaging
substage("debian packaging");
execute("$LibertyBase/work/packaging/build_debian.sh");
endsubstage();

substage("compile tutorial");
function tutorialDir($dir){
    global $stagedir;
    global $dateFormat;
    global $repobaselink, $LibertyBase;
    $result = 0;
    $acecnt = count(glob("$dir/*.ace"));

    if($acecnt > 0){
        foreach (glob("$dir/*.ace") as $acefilename){
            substage("ACE file " . basename($acefilename), str_replace($LibertyBase, $repobaselink, $acefilename));

            $ret = execute("{ cd $dir && se c --clean " . $acefilename . " ; }");
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
    }else{
        foreach (glob("$dir/*") as $filename){
            if(is_file($filename) && preg_match("/(.*)\.e$/", $filename)){
                $class = strtoupper(basename($filename, ".e"));
                substage("class $class", str_replace($LibertyBase, $repobaselink, $filename));
                $ret = execute("{ cd $dir && se c -o " . basename($filename, ".e") . " $class ; } && se clean $class");
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
        foreach (glob("$dir/*", GLOB_ONLYDIR) as $dirname){
            if(!endsWith($dirname, "aux")){
                substage(basename($dirname), str_replace($LibertyBase, $repobaselink, $dirname));
                $res = tutorialDir($dirname);
                if($result == 0){
                    $result = $res;
                }elseif($result > 0 && $res > 0){
                    $result = $result + $res;
                }elseif($result > 0){
                    // no change
                }elseif($res > 0){
                    $result = $res;
                }elseif($result < 0 || $res < 0){
                    $result += $res;
                }
                file_put_contents($stagedir ."/result.txt", $result);
                endsubstage();
            }
        }
    }
    file_put_contents($stagedir ."/result.txt", $result);
    return $result;
}
tutorialDir("$LibertyBase/tutorial");
endsubstage();

substage("TestSuite");
function testDir($dir){
    global $stagedir;
    global $repobaselink, $LibertyBase;
    $result = 0;
    $tests = count(glob("$dir/test_*.e")) + count(glob("$dir/bad_*.e"));
    $hasEiffelTest = is_dir("$dir/eiffeltest");
    if($tests > 0){
        if($hasEiffelTest){
            $result = execute("se test $dir");
            $warnCnt = exec("grep " . escapeshellarg("Warning:") . " " . escapeshellarg($stagedir . "/err.txt") . " | wc -l");
            if($result == 0){
                if($warnCnt != 0){
                    $result = 0 - $warnCnt;
                }
            }

        }else{
            file_put_contents($stagedir ."/err.txt", "missing eiffeltest directory - please add to repository");
            $result = -1;
        }
        file_put_contents($stagedir ."/result.txt", $result);
    }

    foreach (glob("$dir/*", GLOB_ONLYDIR) as $dirname){
        if(basename($dirname) != "eiffeltest"){
            substage(basename($dirname), str_replace($LibertyBase, $repobaselink, $dirname));
            $res = testDir($dirname);
            if($result == 0){
                $result = $res;
            }elseif($result > 0 && $res > 0){
                $result = $result + $res;
            }elseif($result > 0){
                // no change
            }elseif($res > 0){
                $result = $res;
            }elseif($result < 0 || $res < 0){
                $result += $res;
            }
            file_put_contents($stagedir ."/result.txt", $result);
            endsubstage();
        }
    }

    file_put_contents($stagedir ."/result.txt", $result);
    return $result;
}
testDir("$LibertyBase/test");
endsubstage();

unlink($lock);
file_put_contents("$stageout/current_stage.txt","");

if($verbose) echo "good night.\n";
exit(0);
?>
