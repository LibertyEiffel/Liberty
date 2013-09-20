DIR=$(shell for f in $$(ls); do if [ -d $$f ] ; then echo $$f ; fi ; done)
LANGUAGE=Eiffel
COMPILER=compile
EXTENSION=e

include ../../tools/lazy_compile.makefile
include ../../tools/run.makefile
include ../../tools/check.makefile
include ../../tools/bench.makefile
include ../../tools/race.makefile
include ../../tools/clean.makefile
