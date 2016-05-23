-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class ERRNO_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	program_invocation_name: POINTER
               -- program_invocation_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "program_invocation_name"
               }"
               end

       address_of_program_invocation_name: POINTER
               -- Address of program_invocation_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&program_invocation_name"
               }"
               end

       set_program_invocation_name (a_value: POINTER)
               -- Set variable program_invocation_name value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_program_invocation_name"
               }"
               end

	program_invocation_short_name: POINTER
               -- program_invocation_short_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "program_invocation_short_name"
               }"
               end

       address_of_program_invocation_short_name: POINTER
               -- Address of program_invocation_short_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&program_invocation_short_name"
               }"
               end

       set_program_invocation_short_name (a_value: POINTER)
               -- Set variable program_invocation_short_name value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_program_invocation_short_name"
               }"
               end


end -- class ERRNO_EXTERNALS
