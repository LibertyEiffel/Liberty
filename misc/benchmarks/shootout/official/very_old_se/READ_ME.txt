This directory contains modified code that can be run with old SmartEiffel
releases (tested with 1.0 and 1.1).

pidigits is code is removed because it runs in infinite loop due to some bug in
big numbers multiplications.

mandelbrot compiles with 1.0 but does not work (search if the test can be
fixed).

Compilation is made with a lazy strategy: continue the makefile even if compilation failed.
