build: install.sh
	bash install.sh -plain -bootstrap
	bash install.sh -plain -doc

clean:
	rm -rf target

install:
	bash install.sh -plain -package
