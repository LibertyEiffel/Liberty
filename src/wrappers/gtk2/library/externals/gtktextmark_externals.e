-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTEXTMARK_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_text_mark_get_type: NATURAL_64 is
 		-- gtk_text_mark_get_type (node at line 25)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_mark_get_type()"
		}"
		end

	gtk_text_mark_new (a_name: POINTER; a_left_gravity: INTEGER_32): POINTER is
 		-- gtk_text_mark_new (node at line 2459)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_mark_new"
		}"
		end

	gtk_text_mark_get_left_gravity (a_mark: POINTER): INTEGER_32 is
 		-- gtk_text_mark_get_left_gravity (node at line 7571)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_mark_get_left_gravity"
		}"
		end

	gtk_text_mark_get_visible (a_mark: POINTER): INTEGER_32 is
 		-- gtk_text_mark_get_visible (node at line 12121)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_mark_get_visible"
		}"
		end

	gtk_text_mark_get_name (a_mark: POINTER): POINTER is
 		-- gtk_text_mark_get_name (node at line 30979)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_mark_get_name"
		}"
		end

	gtk_text_mark_set_visible (a_mark: POINTER; a_setting: INTEGER_32) is
 		-- gtk_text_mark_set_visible (node at line 34476)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_mark_set_visible"
		}"
		end

	gtk_text_mark_get_buffer (a_mark: POINTER): POINTER is
 		-- gtk_text_mark_get_buffer (node at line 39359)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_mark_get_buffer"
		}"
		end

	gtk_text_mark_get_deleted (a_mark: POINTER): INTEGER_32 is
 		-- gtk_text_mark_get_deleted (node at line 40132)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_mark_get_deleted"
		}"
		end


end -- class GTKTEXTMARK_EXTERNALS
