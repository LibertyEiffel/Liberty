-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCOMBOBOX_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_combo_box_set_active_iter (a_combo_box: POINTER; an_iter: POINTER) is
 		-- gtk_combo_box_set_active_iter (node at line 1215)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_set_active_iter"
		}"
		end

	gtk_combo_box_set_wrap_width (a_combo_box: POINTER; a_width: INTEGER_32) is
 		-- gtk_combo_box_set_wrap_width (node at line 2878)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_set_wrap_width"
		}"
		end

	gtk_combo_box_set_add_tearoffs (a_combo_box: POINTER; an_add_tearoffs: INTEGER_32) is
 		-- gtk_combo_box_set_add_tearoffs (node at line 5548)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_set_add_tearoffs"
		}"
		end

	gtk_combo_box_get_focus_on_click (a_combo: POINTER): INTEGER_32 is
 		-- gtk_combo_box_get_focus_on_click (node at line 6122)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_get_focus_on_click"
		}"
		end

	gtk_combo_box_get_row_span_column (a_combo_box: POINTER): INTEGER_32 is
 		-- gtk_combo_box_get_row_span_column (node at line 6531)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_get_row_span_column"
		}"
		end

	gtk_combo_box_new_text: POINTER is
 		-- gtk_combo_box_new_text (node at line 6542)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_new_text()"
		}"
		end

	gtk_combo_box_set_model (a_combo_box: POINTER; a_model: POINTER) is
 		-- gtk_combo_box_set_model (node at line 9107)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_set_model"
		}"
		end

	gtk_combo_box_get_add_tearoffs (a_combo_box: POINTER): INTEGER_32 is
 		-- gtk_combo_box_get_add_tearoffs (node at line 10007)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_get_add_tearoffs"
		}"
		end

	gtk_combo_box_get_button_sensitivity (a_combo_box: POINTER): INTEGER is
 		-- gtk_combo_box_get_button_sensitivity (node at line 12357)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_get_button_sensitivity"
		}"
		end

	gtk_combo_box_set_row_span_column (a_combo_box: POINTER; a_row_span: INTEGER_32) is
 		-- gtk_combo_box_set_row_span_column (node at line 12410)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_set_row_span_column"
		}"
		end

	gtk_combo_box_insert_text (a_combo_box: POINTER; a_position: INTEGER_32; a_text: POINTER) is
 		-- gtk_combo_box_insert_text (node at line 13073)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_insert_text"
		}"
		end

	gtk_combo_box_get_title (a_combo_box: POINTER): POINTER is
 		-- gtk_combo_box_get_title (node at line 13391)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_get_title"
		}"
		end

	gtk_combo_box_set_button_sensitivity (a_combo_box: POINTER; a_sensitivity: INTEGER) is
 		-- gtk_combo_box_set_button_sensitivity (node at line 14643)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_set_button_sensitivity"
		}"
		end

	gtk_combo_box_get_row_separator_func (a_combo_box: POINTER): POINTER is
 		-- gtk_combo_box_get_row_separator_func (node at line 14792)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_get_row_separator_func"
		}"
		end

	gtk_combo_box_set_focus_on_click (a_combo: POINTER; a_focus_on_click: INTEGER_32) is
 		-- gtk_combo_box_set_focus_on_click (node at line 14835)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_set_focus_on_click"
		}"
		end

	gtk_combo_box_get_active_iter (a_combo_box: POINTER; an_iter: POINTER): INTEGER_32 is
 		-- gtk_combo_box_get_active_iter (node at line 15116)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_get_active_iter"
		}"
		end

	gtk_combo_box_set_row_separator_func (a_combo_box: POINTER; a_func: POINTER; a_data: POINTER; a_destroy: POINTER) is
 		-- gtk_combo_box_set_row_separator_func (node at line 17054)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_set_row_separator_func"
		}"
		end

	gtk_combo_box_set_active (a_combo_box: POINTER; an_index: INTEGER_32) is
 		-- gtk_combo_box_set_active (node at line 21279)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_set_active"
		}"
		end

	gtk_combo_box_remove_text (a_combo_box: POINTER; a_position: INTEGER_32) is
 		-- gtk_combo_box_remove_text (node at line 21922)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_remove_text"
		}"
		end

	gtk_combo_box_get_type: NATURAL_32 is
 		-- gtk_combo_box_get_type (node at line 22455)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_get_type()"
		}"
		end

	gtk_combo_box_append_text (a_combo_box: POINTER; a_text: POINTER) is
 		-- gtk_combo_box_append_text (node at line 24063)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_append_text"
		}"
		end

	gtk_combo_box_new_with_model (a_model: POINTER): POINTER is
 		-- gtk_combo_box_new_with_model (node at line 26323)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_new_with_model"
		}"
		end

	gtk_combo_box_popdown (a_combo_box: POINTER) is
 		-- gtk_combo_box_popdown (node at line 26381)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_popdown"
		}"
		end

	gtk_combo_box_get_column_span_column (a_combo_box: POINTER): INTEGER_32 is
 		-- gtk_combo_box_get_column_span_column (node at line 27343)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_get_column_span_column"
		}"
		end

	gtk_combo_box_new: POINTER is
 		-- gtk_combo_box_new (node at line 27522)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_new()"
		}"
		end

	gtk_combo_box_get_popup_accessible (a_combo_box: POINTER): POINTER is
 		-- gtk_combo_box_get_popup_accessible (node at line 30884)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_get_popup_accessible"
		}"
		end

	gtk_combo_box_set_column_span_column (a_combo_box: POINTER; a_column_span: INTEGER_32) is
 		-- gtk_combo_box_set_column_span_column (node at line 31236)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_set_column_span_column"
		}"
		end

	gtk_combo_box_get_active_text (a_combo_box: POINTER): POINTER is
 		-- gtk_combo_box_get_active_text (node at line 32484)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_get_active_text"
		}"
		end

	gtk_combo_box_prepend_text (a_combo_box: POINTER; a_text: POINTER) is
 		-- gtk_combo_box_prepend_text (node at line 32664)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_prepend_text"
		}"
		end

	gtk_combo_box_popup (a_combo_box: POINTER) is
 		-- gtk_combo_box_popup (node at line 33336)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_popup"
		}"
		end

	gtk_combo_box_set_title (a_combo_box: POINTER; a_title: POINTER) is
 		-- gtk_combo_box_set_title (node at line 34722)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_set_title"
		}"
		end

	gtk_combo_box_get_wrap_width (a_combo_box: POINTER): INTEGER_32 is
 		-- gtk_combo_box_get_wrap_width (node at line 34894)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_get_wrap_width"
		}"
		end

	gtk_combo_box_get_active (a_combo_box: POINTER): INTEGER_32 is
 		-- gtk_combo_box_get_active (node at line 36166)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_get_active"
		}"
		end

	gtk_combo_box_get_model (a_combo_box: POINTER): POINTER is
 		-- gtk_combo_box_get_model (node at line 37382)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_box_get_model"
		}"
		end


end -- class GTKCOMBOBOX_EXTERNALS
