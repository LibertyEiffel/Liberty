# Needs clean and bench targets to be defined

export LANGUAGE

race: clean bench
	@../../tools/do_backup
