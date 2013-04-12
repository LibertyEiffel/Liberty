-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_MESSAGE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_message (a_message: POINTER; a_file: POINTER; a_line: INTEGER_32; a_mask: NATURAL_32) is
 		-- gsl_message
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_message"
		}"
		end

	gsl_message_mask: NATURAL_32 is
 		-- gsl_message_mask
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_message_mask"
		}"
		end

	address_of_gsl_message_mask: POINTER is
 		-- Address of gsl_message_mask
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_message_mask"
		}"
		end

	set_gsl_message_mask (a_value: NATURAL_32) is
		-- Set variable gsl_message_mask value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_message_mask"
		}"
		end


end -- class GSL_MESSAGE_EXTERNALS
