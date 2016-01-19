-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTOOLSHELL_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tool_shell_get_ellipsize_mode (a_shell: POINTER): INTEGER is
 		-- gtk_tool_shell_get_ellipsize_mode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_shell_get_ellipsize_mode"
		}"
		end

	gtk_tool_shell_get_icon_size (a_shell: POINTER): INTEGER is
 		-- gtk_tool_shell_get_icon_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_shell_get_icon_size"
		}"
		end

	gtk_tool_shell_get_orientation (a_shell: POINTER): INTEGER is
 		-- gtk_tool_shell_get_orientation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_shell_get_orientation"
		}"
		end

	gtk_tool_shell_get_relief_style (a_shell: POINTER): INTEGER is
 		-- gtk_tool_shell_get_relief_style
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_shell_get_relief_style"
		}"
		end

	gtk_tool_shell_get_style (a_shell: POINTER): INTEGER is
 		-- gtk_tool_shell_get_style
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_shell_get_style"
		}"
		end

	gtk_tool_shell_get_text_alignment (a_shell: POINTER): REAL_32 is
 		-- gtk_tool_shell_get_text_alignment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_shell_get_text_alignment"
		}"
		end

	gtk_tool_shell_get_text_orientation (a_shell: POINTER): INTEGER is
 		-- gtk_tool_shell_get_text_orientation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_shell_get_text_orientation"
		}"
		end

	gtk_tool_shell_get_text_size_group (a_shell: POINTER): POINTER is
 		-- gtk_tool_shell_get_text_size_group
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_shell_get_text_size_group"
		}"
		end

	gtk_tool_shell_get_type: like long_unsigned is
 		-- gtk_tool_shell_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_shell_get_type()"
		}"
		end

	gtk_tool_shell_rebuild_menu (a_shell: POINTER) is
 		-- gtk_tool_shell_rebuild_menu
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_shell_rebuild_menu"
		}"
		end


end -- class GTKTOOLSHELL_EXTERNALS
