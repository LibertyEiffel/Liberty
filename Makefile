build: install.sh
	bash install.sh -plain -bootstrap

clean:
	test -d target && rm -rf target

install:
	bash install.sh -plain -package
