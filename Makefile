all: .flag-bootstrap .flag-doc

.flag-bootstrap: install.sh
	bash install.sh -bootstrap -plain
	touch .flag-bootstrap

.flag-doc: install.sh
	bash install.sh -doc -plain

install: .flag-install

.flag-install: all
	bash install.sh -local_install
	touch .flag-install

.PHONY: all install
