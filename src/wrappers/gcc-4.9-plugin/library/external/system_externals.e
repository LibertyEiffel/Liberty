-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class SYSTEM_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	fancy_abort (an_argument_l410_c7: POINTER; an_argument_l411_c7: INTEGER; an_argument_l412_c7: POINTER) 
               -- fancy_abort
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	getopt (an_argc: INTEGER; an_argv: POINTER; a_shortopts: POINTER): INTEGER 
               -- getopt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end


end -- class SYSTEM_EXTERNALS
