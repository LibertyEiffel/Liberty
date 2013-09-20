This directory refers to programming languages benchmarking from the following web-site:
http://shootout.alioth.debian.org/

Compiling C code require libgmp3-dev package.

Compiling C++ code require libboost-regex-dev package.

NOTE: do not modify code in official directory unless you want to mirror changes
from the official web-site.

dev directory is here for benchmark developpment. Here, you can improve existing
programs or implement some missing program. Each program has to follow some
guidlines. See the rules here:
http://shootout.alioth.debian.org/gp4/miscfile.php?file=rules&title=The%20Benchmarks%20Rules

How to compile:
---------------
Run "make compile" in some dir to compile everything in the current directory.
Run "make compile-dirname" to compile some specific directory content.

How to check:
-------------
Run "make check" in some dir to run and check the output result on everything in the current directory.
Run "make check-dirname" to run and check the output result of some specific directory content.

Execution output is in /tmp/out file.

Note: you can run only with similar patterns: "make run", "make run-dirname"

How to benchmark:
-----------------
Run "make bench" in some dir to compile and bench everything in the current directory.
Run "make bench-dirname" to compile and bench some specific directory content.

Execution times are stored in SmartEiffel/misc/benchmarks/shootout/*/results/recent_times file.
(* being official or dev).

This file is cleard by any "make clean" command (but not clean-*).

How to save results:
--------------------
Run "make race" in some dir to bench and save backup the result. Results are
identified with the processor and the compiler version.

Files are in SmartEiffel/misc/benchmarks/shootout/*/results/processor_id file.
(* being official or dev).

How to show the results:
------------------------
Run tools/show_result.pl

Syntax: show_result.pl [-bench=bench_names] [CPU...]

"bench_names" is a space separated list or a single benchmark name. If omitted,
all benchmarks are displayed.

CPU...: cpu files names without directory. If omitted, current CPU is used.

Example:
cd official/results
../../tools/show_result.pl -bench=pidigits AuthenticAMD.15.67.2.2610MHz GenuineIntel.6*MHz

Note: recent gnuplot is required (tested with 4.2).

Trick: when the gnuplot window opens, maximize it and press redraw button.

How to add a benchmark program:
-------------------------------
Add the directory with the benchmark's name if it does not exist (dash separated name).
Add the source files. The "main" file must have the same name as the directory without dash.
Complete compile_options file in the corresponding language directory.
Complete exec_info file in data directory.
Add file with the expected result in data directory.
Check everything is OK with "make check" (see "How to check" paragraph above).

How to contribute:
------------------
First, identify some program to be improved. File official/results/eiffel_scores
will help to find programs with high improvement capabilities. Once you choosed
some program, check the time of the official version and the developpment
version. For this, either use already registered timings or run youself both
version to check how much it has alread been improved. So you can estimate the
remaining potential improvement.

Now, you found a good candidate for improvement. Your helps may be:
- Check how it is implemented in the quickest language: open you benchmark from
the following page http://shootout.alioth.debian.org/gp4sandbox/.
- Read again the benchmark rules at the end of the just referenced page.
- Check how it is implemented in eiffel.
- Check the C generated code.
- Check assembler generated code.
- Try other C compiler options.

If you improved the program, please send it to the SmartEiffel project!
