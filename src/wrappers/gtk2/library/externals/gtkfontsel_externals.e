-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKFONTSEL_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_font_selection_dialog_get_cancel_button (a_fsd: POINTER): POINTER is
 		-- gtk_font_selection_dialog_get_cancel_button
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_get_cancel_button"
		}"
		end

	gtk_font_selection_dialog_get_font_name (a_fsd: POINTER): POINTER is
 		-- gtk_font_selection_dialog_get_font_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_get_font_name"
		}"
		end

	gtk_font_selection_dialog_get_font_selection (a_fsd: POINTER): POINTER is
 		-- gtk_font_selection_dialog_get_font_selection
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_get_font_selection"
		}"
		end

	gtk_font_selection_dialog_get_ok_button (a_fsd: POINTER): POINTER is
 		-- gtk_font_selection_dialog_get_ok_button
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_get_ok_button"
		}"
		end

	gtk_font_selection_dialog_get_preview_text (a_fsd: POINTER): POINTER is
 		-- gtk_font_selection_dialog_get_preview_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_get_preview_text"
		}"
		end

	gtk_font_selection_dialog_get_type: like long_unsigned is
 		-- gtk_font_selection_dialog_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_get_type()"
		}"
		end

	gtk_font_selection_dialog_new (a_title: POINTER): POINTER is
 		-- gtk_font_selection_dialog_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_new"
		}"
		end

	gtk_font_selection_dialog_set_font_name (a_fsd: POINTER; a_fontname: POINTER): INTEGER is
 		-- gtk_font_selection_dialog_set_font_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_set_font_name"
		}"
		end

	gtk_font_selection_dialog_set_preview_text (a_fsd: POINTER; a_text: POINTER) is
 		-- gtk_font_selection_dialog_set_preview_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_set_preview_text"
		}"
		end

	gtk_font_selection_get_face (a_fontsel: POINTER): POINTER is
 		-- gtk_font_selection_get_face
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_get_face"
		}"
		end

	gtk_font_selection_get_face_list (a_fontsel: POINTER): POINTER is
 		-- gtk_font_selection_get_face_list
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_get_face_list"
		}"
		end

	gtk_font_selection_get_family (a_fontsel: POINTER): POINTER is
 		-- gtk_font_selection_get_family
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_get_family"
		}"
		end

	gtk_font_selection_get_family_list (a_fontsel: POINTER): POINTER is
 		-- gtk_font_selection_get_family_list
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_get_family_list"
		}"
		end

	gtk_font_selection_get_font_name (a_fontsel: POINTER): POINTER is
 		-- gtk_font_selection_get_font_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_get_font_name"
		}"
		end

	gtk_font_selection_get_preview_entry (a_fontsel: POINTER): POINTER is
 		-- gtk_font_selection_get_preview_entry
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_get_preview_entry"
		}"
		end

	gtk_font_selection_get_preview_text (a_fontsel: POINTER): POINTER is
 		-- gtk_font_selection_get_preview_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_get_preview_text"
		}"
		end

	gtk_font_selection_get_size (a_fontsel: POINTER): INTEGER is
 		-- gtk_font_selection_get_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_get_size"
		}"
		end

	gtk_font_selection_get_size_entry (a_fontsel: POINTER): POINTER is
 		-- gtk_font_selection_get_size_entry
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_get_size_entry"
		}"
		end

	gtk_font_selection_get_size_list (a_fontsel: POINTER): POINTER is
 		-- gtk_font_selection_get_size_list
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_get_size_list"
		}"
		end

	gtk_font_selection_get_type: like long_unsigned is
 		-- gtk_font_selection_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_get_type()"
		}"
		end

	gtk_font_selection_new: POINTER is
 		-- gtk_font_selection_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_new()"
		}"
		end

	gtk_font_selection_set_font_name (a_fontsel: POINTER; a_fontname: POINTER): INTEGER is
 		-- gtk_font_selection_set_font_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_set_font_name"
		}"
		end

	gtk_font_selection_set_preview_text (a_fontsel: POINTER; a_text: POINTER) is
 		-- gtk_font_selection_set_preview_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_set_preview_text"
		}"
		end


end -- class GTKFONTSEL_EXTERNALS
