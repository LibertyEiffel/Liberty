-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKABOUTDIALOG_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_about_dialog_set_version (an_about: POINTER; a_version: POINTER) is
 		-- gtk_about_dialog_set_version (node at line 3449)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_set_version"
		}"
		end

	gtk_about_dialog_new: POINTER is
 		-- gtk_about_dialog_new (node at line 5385)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_new()"
		}"
		end

	gtk_about_dialog_get_copyright (an_about: POINTER): POINTER is
 		-- gtk_about_dialog_get_copyright (node at line 5961)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_get_copyright"
		}"
		end

	gtk_about_dialog_get_license (an_about: POINTER): POINTER is
 		-- gtk_about_dialog_get_license (node at line 6590)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_get_license"
		}"
		end

	gtk_about_dialog_get_translator_credits (an_about: POINTER): POINTER is
 		-- gtk_about_dialog_get_translator_credits (node at line 7035)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_get_translator_credits"
		}"
		end

	gtk_about_dialog_set_comments (an_about: POINTER; a_comments: POINTER) is
 		-- gtk_about_dialog_set_comments (node at line 7147)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_set_comments"
		}"
		end

	gtk_about_dialog_get_comments (an_about: POINTER): POINTER is
 		-- gtk_about_dialog_get_comments (node at line 8227)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_get_comments"
		}"
		end

	gtk_about_dialog_set_name (an_about: POINTER; a_name: POINTER) is
 		-- gtk_about_dialog_set_name (node at line 8451)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_set_name"
		}"
		end

	gtk_about_dialog_set_logo_icon_name (an_about: POINTER; an_icon_name: POINTER) is
 		-- gtk_about_dialog_set_logo_icon_name (node at line 8507)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_set_logo_icon_name"
		}"
		end

	gtk_about_dialog_set_translator_credits (an_about: POINTER; a_translator_credits: POINTER) is
 		-- gtk_about_dialog_set_translator_credits (node at line 9572)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_set_translator_credits"
		}"
		end

	gtk_about_dialog_get_website_label (an_about: POINTER): POINTER is
 		-- gtk_about_dialog_get_website_label (node at line 10967)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_get_website_label"
		}"
		end

	gtk_about_dialog_set_url_hook (a_func: POINTER; a_data: POINTER; a_destroy: POINTER): POINTER is
 		-- gtk_about_dialog_set_url_hook (node at line 11460)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_set_url_hook"
		}"
		end

	gtk_about_dialog_set_license (an_about: POINTER; a_license: POINTER) is
 		-- gtk_about_dialog_set_license (node at line 13219)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_set_license"
		}"
		end

	gtk_about_dialog_get_authors (an_about: POINTER): POINTER is
 		-- gtk_about_dialog_get_authors (node at line 15237)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_get_authors"
		}"
		end

	gtk_about_dialog_set_documenters (an_about: POINTER; a_documenters: POINTER) is
 		-- gtk_about_dialog_set_documenters (node at line 15316)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_set_documenters"
		}"
		end

	gtk_about_dialog_set_website_label (an_about: POINTER; a_website_label: POINTER) is
 		-- gtk_about_dialog_set_website_label (node at line 16805)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_set_website_label"
		}"
		end

	gtk_about_dialog_get_artists (an_about: POINTER): POINTER is
 		-- gtk_about_dialog_get_artists (node at line 16866)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_get_artists"
		}"
		end

	gtk_about_dialog_get_name (an_about: POINTER): POINTER is
 		-- gtk_about_dialog_get_name (node at line 17964)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_get_name"
		}"
		end

	gtk_about_dialog_set_copyright (an_about: POINTER; a_copyright: POINTER) is
 		-- gtk_about_dialog_set_copyright (node at line 18616)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_set_copyright"
		}"
		end

	gtk_about_dialog_get_version (an_about: POINTER): POINTER is
 		-- gtk_about_dialog_get_version (node at line 18792)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_get_version"
		}"
		end

	gtk_about_dialog_set_email_hook (a_func: POINTER; a_data: POINTER; a_destroy: POINTER): POINTER is
 		-- gtk_about_dialog_set_email_hook (node at line 19210)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_set_email_hook"
		}"
		end

	gtk_about_dialog_get_logo (an_about: POINTER): POINTER is
 		-- gtk_about_dialog_get_logo (node at line 20916)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_get_logo"
		}"
		end

	gtk_about_dialog_set_authors (an_about: POINTER; an_authors: POINTER) is
 		-- gtk_about_dialog_set_authors (node at line 21275)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_set_authors"
		}"
		end

	gtk_about_dialog_set_program_name (an_about: POINTER; a_name: POINTER) is
 		-- gtk_about_dialog_set_program_name (node at line 22735)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_set_program_name"
		}"
		end

	gtk_about_dialog_set_artists (an_about: POINTER; an_artists: POINTER) is
 		-- gtk_about_dialog_set_artists (node at line 22747)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_set_artists"
		}"
		end

	gtk_about_dialog_get_website (an_about: POINTER): POINTER is
 		-- gtk_about_dialog_get_website (node at line 22835)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_get_website"
		}"
		end

	gtk_about_dialog_set_wrap_license (an_about: POINTER; a_wrap_license: INTEGER_32) is
 		-- gtk_about_dialog_set_wrap_license (node at line 26998)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_set_wrap_license"
		}"
		end

	gtk_about_dialog_get_program_name (an_about: POINTER): POINTER is
 		-- gtk_about_dialog_get_program_name (node at line 27069)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_get_program_name"
		}"
		end

	gtk_about_dialog_get_documenters (an_about: POINTER): POINTER is
 		-- gtk_about_dialog_get_documenters (node at line 27964)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_get_documenters"
		}"
		end

	gtk_about_dialog_set_website (an_about: POINTER; a_website: POINTER) is
 		-- gtk_about_dialog_set_website (node at line 29003)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_set_website"
		}"
		end

	gtk_show_about_dialog (a_parent: POINTER; a_first_property_name: POINTER) is
 		-- gtk_show_about_dialog (variadic call)  (node at line 30119)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_show_about_dialog"
		}"
		end

	gtk_about_dialog_get_wrap_license (an_about: POINTER): INTEGER_32 is
 		-- gtk_about_dialog_get_wrap_license (node at line 31378)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_get_wrap_license"
		}"
		end

	gtk_about_dialog_get_type: NATURAL_32 is
 		-- gtk_about_dialog_get_type (node at line 35541)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_get_type()"
		}"
		end

	gtk_about_dialog_set_logo (an_about: POINTER; a_logo: POINTER) is
 		-- gtk_about_dialog_set_logo (node at line 37048)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_set_logo"
		}"
		end

	gtk_about_dialog_get_logo_icon_name (an_about: POINTER): POINTER is
 		-- gtk_about_dialog_get_logo_icon_name (node at line 37324)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_about_dialog_get_logo_icon_name"
		}"
		end


end -- class GTKABOUTDIALOG_EXTERNALS
