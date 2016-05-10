-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GETOPT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	getopt (an_argc: INTEGER; an_argv: POINTER; a_shortopts: POINTER): INTEGER 

		-- function getopt (in `/usr/include/getopt.h')
               -- getopt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getopt"
               }"
               end

	optarg: POINTER
               -- optarg
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "optarg"
               }"
               end

       address_of_optarg: POINTER
               -- Address of optarg
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&optarg"
               }"
               end

       set_optarg (a_value: POINTER)
               -- Set variable optarg value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_optarg"
               }"
               end

	opterr: INTEGER
               -- opterr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "opterr"
               }"
               end

       address_of_opterr: POINTER
               -- Address of opterr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&opterr"
               }"
               end

       set_opterr (a_value: INTEGER)
               -- Set variable opterr value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_opterr"
               }"
               end

	optind: INTEGER
               -- optind
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "optind"
               }"
               end

       address_of_optind: POINTER
               -- Address of optind
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&optind"
               }"
               end

       set_optind (a_value: INTEGER)
               -- Set variable optind value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_optind"
               }"
               end

	optopt: INTEGER
               -- optopt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "optopt"
               }"
               end

       address_of_optopt: POINTER
               -- Address of optopt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&optopt"
               }"
               end

       set_optopt (a_value: INTEGER)
               -- Set variable optopt value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_optopt"
               }"
               end


end -- class GETOPT_EXTERNALS
