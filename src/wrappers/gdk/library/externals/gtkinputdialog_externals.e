-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKINPUTDIALOG_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_input_dialog_get_type: NATURAL_32 is
 		-- gtk_input_dialog_get_type (node at line 20160)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_input_dialog_get_type()"
		}"
		end

	gtk_input_dialog_new: POINTER is
 		-- gtk_input_dialog_new (node at line 30770)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_input_dialog_new()"
		}"
		end


end -- class GTKINPUTDIALOG_EXTERNALS
