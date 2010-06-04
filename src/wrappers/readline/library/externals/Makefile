## To avoid an Ubuntu Intrepid Ibex bug.
## See https://bugs.launchpad.net/ubuntu/+source/gccxml/+bug/293807 for further informations.
GCCXML_COMPILER = gcc-4.2

wrappers: readline.gcc-xml
	wrappers-generator --verbose --typedefs READLINE_TYPES --local --directory . readline.gcc-xml /usr/include/readline/*.h  

readline.gcc-xml:/usr/include/readline/
	gccxml -fxml=readline.gcc-xml readline.h

