-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class MATH_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	-- `hidden' variable _LIB_VERSION skipped.
	matherr (an_exc: POINTER): INTEGER is
 		-- matherr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "matherr"
		}"
		end

	signgam: INTEGER is
 		-- signgam
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "signgam"
		}"
		end

	address_of_signgam: POINTER is
 		-- Address of signgam
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&signgam"
		}"
		end

	set_signgam (a_value: INTEGER) is
		-- Set variable signgam value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_signgam"
		}"
		end


end -- class MATH_EXTERNALS
