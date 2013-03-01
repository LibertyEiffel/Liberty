-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTOOLSHELL_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tool_shell_get_type: NATURAL_64 is
 		-- gtk_tool_shell_get_type (node at line 1087)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_shell_get_type()"
		}"
		end

	gtk_tool_shell_get_relief_style (a_shell: POINTER): INTEGER is
 		-- gtk_tool_shell_get_relief_style (node at line 4015)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_shell_get_relief_style"
		}"
		end

	gtk_tool_shell_rebuild_menu (a_shell: POINTER) is
 		-- gtk_tool_shell_rebuild_menu (node at line 11798)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_shell_rebuild_menu"
		}"
		end

	gtk_tool_shell_get_text_orientation (a_shell: POINTER): INTEGER is
 		-- gtk_tool_shell_get_text_orientation (node at line 12844)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_shell_get_text_orientation"
		}"
		end

	gtk_tool_shell_get_text_size_group (a_shell: POINTER): POINTER is
 		-- gtk_tool_shell_get_text_size_group (node at line 14590)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_shell_get_text_size_group"
		}"
		end

	gtk_tool_shell_get_icon_size (a_shell: POINTER): INTEGER is
 		-- gtk_tool_shell_get_icon_size (node at line 17070)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_shell_get_icon_size"
		}"
		end

	gtk_tool_shell_get_orientation (a_shell: POINTER): INTEGER is
 		-- gtk_tool_shell_get_orientation (node at line 19542)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_shell_get_orientation"
		}"
		end

	gtk_tool_shell_get_ellipsize_mode (a_shell: POINTER): INTEGER is
 		-- gtk_tool_shell_get_ellipsize_mode (node at line 21034)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_shell_get_ellipsize_mode"
		}"
		end

	gtk_tool_shell_get_text_alignment (a_shell: POINTER): REAL_32 is
 		-- gtk_tool_shell_get_text_alignment (node at line 22182)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_shell_get_text_alignment"
		}"
		end

	gtk_tool_shell_get_style (a_shell: POINTER): INTEGER is
 		-- gtk_tool_shell_get_style (node at line 41032)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_shell_get_style"
		}"
		end


end -- class GTKTOOLSHELL_EXTERNALS
