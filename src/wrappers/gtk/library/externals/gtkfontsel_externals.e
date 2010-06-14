-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKFONTSEL_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_font_selection_get_type: NATURAL_32 is
 		-- gtk_font_selection_get_type (node at line 4953)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_get_type()"
		}"
		end

	gtk_font_selection_get_font (a_fontsel: POINTER): POINTER is
 		-- gtk_font_selection_get_font (node at line 7486)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_get_font"
		}"
		end

	gtk_font_selection_get_size_entry (a_fontsel: POINTER): POINTER is
 		-- gtk_font_selection_get_size_entry (node at line 7710)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_get_size_entry"
		}"
		end

	gtk_font_selection_get_family_list (a_fontsel: POINTER): POINTER is
 		-- gtk_font_selection_get_family_list (node at line 7880)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_get_family_list"
		}"
		end

	gtk_font_selection_get_face (a_fontsel: POINTER): POINTER is
 		-- gtk_font_selection_get_face (node at line 8538)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_get_face"
		}"
		end

	gtk_font_selection_get_family (a_fontsel: POINTER): POINTER is
 		-- gtk_font_selection_get_family (node at line 9372)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_get_family"
		}"
		end

	gtk_font_selection_dialog_get_font_name (a_fsd: POINTER): POINTER is
 		-- gtk_font_selection_dialog_get_font_name (node at line 10229)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_get_font_name"
		}"
		end

	gtk_font_selection_dialog_get_apply_button (a_fsd: POINTER): POINTER is
 		-- gtk_font_selection_dialog_get_apply_button (node at line 10993)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_get_apply_button"
		}"
		end

	gtk_font_selection_dialog_set_font_name (a_fsd: POINTER; a_fontname: POINTER): INTEGER_32 is
 		-- gtk_font_selection_dialog_set_font_name (node at line 14271)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_set_font_name"
		}"
		end

	gtk_font_selection_set_preview_text (a_fontsel: POINTER; a_text: POINTER) is
 		-- gtk_font_selection_set_preview_text (node at line 15699)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_set_preview_text"
		}"
		end

	gtk_font_selection_dialog_set_preview_text (a_fsd: POINTER; a_text: POINTER) is
 		-- gtk_font_selection_dialog_set_preview_text (node at line 15758)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_set_preview_text"
		}"
		end

	gtk_font_selection_dialog_get_type: NATURAL_32 is
 		-- gtk_font_selection_dialog_get_type (node at line 16104)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_get_type()"
		}"
		end

	gtk_font_selection_get_font_name (a_fontsel: POINTER): POINTER is
 		-- gtk_font_selection_get_font_name (node at line 16734)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_get_font_name"
		}"
		end

	gtk_font_selection_get_size (a_fontsel: POINTER): INTEGER_32 is
 		-- gtk_font_selection_get_size (node at line 17653)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_get_size"
		}"
		end

	gtk_font_selection_dialog_get_font (a_fsd: POINTER): POINTER is
 		-- gtk_font_selection_dialog_get_font (node at line 18392)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_get_font"
		}"
		end

	gtk_font_selection_new: POINTER is
 		-- gtk_font_selection_new (node at line 19606)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_new()"
		}"
		end

	gtk_font_selection_dialog_get_preview_text (a_fsd: POINTER): POINTER is
 		-- gtk_font_selection_dialog_get_preview_text (node at line 20026)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_get_preview_text"
		}"
		end

	gtk_font_selection_get_preview_entry (a_fontsel: POINTER): POINTER is
 		-- gtk_font_selection_get_preview_entry (node at line 20617)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_get_preview_entry"
		}"
		end

	gtk_font_selection_set_font_name (a_fontsel: POINTER; a_fontname: POINTER): INTEGER_32 is
 		-- gtk_font_selection_set_font_name (node at line 20657)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_set_font_name"
		}"
		end

	gtk_font_selection_dialog_get_cancel_button (a_fsd: POINTER): POINTER is
 		-- gtk_font_selection_dialog_get_cancel_button (node at line 23441)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_get_cancel_button"
		}"
		end

	gtk_font_selection_get_size_list (a_fontsel: POINTER): POINTER is
 		-- gtk_font_selection_get_size_list (node at line 24491)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_get_size_list"
		}"
		end

	gtk_font_selection_get_preview_text (a_fontsel: POINTER): POINTER is
 		-- gtk_font_selection_get_preview_text (node at line 24499)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_get_preview_text"
		}"
		end

	gtk_font_selection_dialog_get_ok_button (a_fsd: POINTER): POINTER is
 		-- gtk_font_selection_dialog_get_ok_button (node at line 30403)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_get_ok_button"
		}"
		end

	gtk_font_selection_dialog_new (a_title: POINTER): POINTER is
 		-- gtk_font_selection_dialog_new (node at line 36879)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_dialog_new"
		}"
		end

	gtk_font_selection_get_face_list (a_fontsel: POINTER): POINTER is
 		-- gtk_font_selection_get_face_list (node at line 37252)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_selection_get_face_list"
		}"
		end


end -- class GTKFONTSEL_EXTERNALS
