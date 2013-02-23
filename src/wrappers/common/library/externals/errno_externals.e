-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class ERRNO_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	program_invocation_short_name: POINTER is
 		-- program_invocation_short_name (node at line 55)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "program_invocation_short_name"
		}"
		end

	address_of_program_invocation_short_name: POINTER is
 		-- Address of program_invocation_short_name (node at line 55)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&program_invocation_short_name"
		}"
		end

	set_program_invocation_short_name (a_value: POINTER) is
		-- Set variable program_invocation_short_name value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_program_invocation_short_name"
		}"
		end

	program_invocation_name: POINTER is
 		-- program_invocation_name (node at line 55)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "program_invocation_name"
		}"
		end

	address_of_program_invocation_name: POINTER is
 		-- Address of program_invocation_name (node at line 55)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&program_invocation_name"
		}"
		end

	set_program_invocation_name (a_value: POINTER) is
		-- Set variable program_invocation_name value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_program_invocation_name"
		}"
		end


end -- class ERRNO_EXTERNALS
