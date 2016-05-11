-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SETJMP_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	-- `hidden' function _longjmp skipped.
	longjmp (an_env: POINTER; a_val: INTEGER) 

		-- function longjmp (in `/usr/include/setjmp.h')
               -- longjmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "longjmp"
               }"
               end

	-- `hidden' function _setjmp skipped.
	setjmp (an_env: POINTER): INTEGER 

		-- function setjmp (in `/usr/include/setjmp.h')
               -- setjmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setjmp"
               }"
               end

	siglongjmp (an_env: POINTER; a_val: INTEGER) 

		-- function siglongjmp (in `/usr/include/setjmp.h')
               -- siglongjmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "siglongjmp"
               }"
               end


end -- class SETJMP_EXTERNALS
