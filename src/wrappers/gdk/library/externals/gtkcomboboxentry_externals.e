-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCOMBOBOXENTRY_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_combo_box_entry_set_text_column (an_entry_box: POINTER; a_text_column: INTEGER_32) is
 		-- gtk_combo_box_entry_set_text_column (node at line 1665)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_entry_set_text_column"
		}"
		end

	gtk_combo_box_entry_new_text: POINTER is
 		-- gtk_combo_box_entry_new_text (node at line 7580)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_entry_new_text()"
		}"
		end

	gtk_combo_box_entry_get_text_column (an_entry_box: POINTER): INTEGER_32 is
 		-- gtk_combo_box_entry_get_text_column (node at line 15521)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_entry_get_text_column"
		}"
		end

	gtk_combo_box_entry_get_type: NATURAL_32 is
 		-- gtk_combo_box_entry_get_type (node at line 29135)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_entry_get_type()"
		}"
		end

	gtk_combo_box_entry_new_with_model (a_model: POINTER; a_text_column: INTEGER_32): POINTER is
 		-- gtk_combo_box_entry_new_with_model (node at line 31917)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_entry_new_with_model"
		}"
		end

	gtk_combo_box_entry_new: POINTER is
 		-- gtk_combo_box_entry_new (node at line 36087)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_entry_new()"
		}"
		end


end -- class GTKCOMBOBOXENTRY_EXTERNALS
