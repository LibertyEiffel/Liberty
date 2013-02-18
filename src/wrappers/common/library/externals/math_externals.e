-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class MATH_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	signgam: INTEGER_32 is
 		-- signgam (node at line 161)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "signgam"
		}"
		end

	address_of_signgam: POINTER is
 		-- Address of signgam (node at line 161)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&signgam"
		}"
		end

	set_signgam (a_value: INTEGER_32) is
		-- Set variable signgam value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_signgam"
		}"
		end

	-- `hidden' variable _LIB_VERSION skipped.
	matherr (an_exc: POINTER): INTEGER_32 is
 		-- matherr (node at line 2892)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "matherr"
		}"
		end


end -- class MATH_EXTERNALS
