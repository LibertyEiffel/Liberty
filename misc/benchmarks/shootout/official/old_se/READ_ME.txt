This directory contains modified code that can be run with old SmartEiffel
releases (from 2.0 to 2.2).

But some old releases are unable to compile some benchmarks. For example, there
is no regular expression in 2.1 and before. So, compilation is made with a lazy
strategy: continue the makefile even if compilation failed.
