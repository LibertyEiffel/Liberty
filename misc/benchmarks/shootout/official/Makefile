DIR=c c++ eiffel

all: compile check

compile: $(DIR:%=compile-%)

compile-%:
	$(MAKE) -C $* compile

run: $(DIR:%=run-%)

run-%:
	$(MAKE) -C $* run

check: $(DIR:%=check-%)

check-%:
	$(MAKE) -C $* check

bench: $(DIR:%=bench-%)

bench-%:
	$(MAKE) -C $* bench

race: $(DIR:%=race-%)

race-%:
	$(MAKE) -C $* race

clean: $(DIR:%=clean-%)

clean-%:
	$(MAKE) -C $* clean
