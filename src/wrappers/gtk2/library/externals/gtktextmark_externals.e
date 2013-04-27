-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTEXTMARK_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_text_mark_get_buffer (a_mark: POINTER): POINTER is
 		-- gtk_text_mark_get_buffer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_mark_get_buffer"
		}"
		end

	gtk_text_mark_get_deleted (a_mark: POINTER): INTEGER is
 		-- gtk_text_mark_get_deleted
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_mark_get_deleted"
		}"
		end

	gtk_text_mark_get_left_gravity (a_mark: POINTER): INTEGER is
 		-- gtk_text_mark_get_left_gravity
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_mark_get_left_gravity"
		}"
		end

	gtk_text_mark_get_name (a_mark: POINTER): POINTER is
 		-- gtk_text_mark_get_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_mark_get_name"
		}"
		end

	gtk_text_mark_get_type: like long_unsigned is
 		-- gtk_text_mark_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_mark_get_type()"
		}"
		end

	gtk_text_mark_get_visible (a_mark: POINTER): INTEGER is
 		-- gtk_text_mark_get_visible
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_mark_get_visible"
		}"
		end

	gtk_text_mark_new (a_name: POINTER; a_left_gravity: INTEGER): POINTER is
 		-- gtk_text_mark_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_mark_new"
		}"
		end

	gtk_text_mark_set_visible (a_mark: POINTER; a_setting: INTEGER) is
 		-- gtk_text_mark_set_visible
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_mark_set_visible"
		}"
		end


end -- class GTKTEXTMARK_EXTERNALS
