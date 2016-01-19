-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCOMBOBOXTEXT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_combo_box_text_append_text (a_combo_box: POINTER; a_text: POINTER) is
 		-- gtk_combo_box_text_append_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_text_append_text"
		}"
		end

	gtk_combo_box_text_get_active_text (a_combo_box: POINTER): POINTER is
 		-- gtk_combo_box_text_get_active_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_text_get_active_text"
		}"
		end

	gtk_combo_box_text_get_type: like long_unsigned is
 		-- gtk_combo_box_text_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_text_get_type()"
		}"
		end

	gtk_combo_box_text_insert_text (a_combo_box: POINTER; a_position: INTEGER; a_text: POINTER) is
 		-- gtk_combo_box_text_insert_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_text_insert_text"
		}"
		end

	gtk_combo_box_text_new: POINTER is
 		-- gtk_combo_box_text_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_text_new()"
		}"
		end

	gtk_combo_box_text_new_with_entry: POINTER is
 		-- gtk_combo_box_text_new_with_entry
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_text_new_with_entry()"
		}"
		end

	gtk_combo_box_text_prepend_text (a_combo_box: POINTER; a_text: POINTER) is
 		-- gtk_combo_box_text_prepend_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_text_prepend_text"
		}"
		end

	gtk_combo_box_text_remove (a_combo_box: POINTER; a_position: INTEGER) is
 		-- gtk_combo_box_text_remove
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_text_remove"
		}"
		end


end -- class GTKCOMBOBOXTEXT_EXTERNALS
