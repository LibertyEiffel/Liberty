XML=eigen2.gcc-xml
FLAGS=$(shell pkg-config --cflags eigen2)
HEADER=eigen2.hpp
HEADERS=$(strip $(subst -I,,$(FLAGS)))/Eigen/*  
# Processed headers will be all the files you find in the path obtained removing the "-I", leading and trailing spaces from flags, with should be like "  -I/usr/include/eigen2  "

wrappers: $(XML)
	@echo unecho this wrappers-generator --local $(XML) $(HEADERS)   

$(XML):$(HEADER) 
	pkg-config --exists eigen2
	@echo gccxml `pkg-config --cflags eigen2 ` $(HEADER) -fxml=$(XML)

