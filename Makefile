build: install.sh
	bash install.sh -bootstrap

clean:
	test -d target && rm -rf target

install: build
	bash install.sh -package
