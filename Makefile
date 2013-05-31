export plain := TRUE

build:
	bash install.sh -bootstrap
	-bash install.sh -doc

clean:
	rm -rf target website/doc/api

install:
	bash install.sh -package
