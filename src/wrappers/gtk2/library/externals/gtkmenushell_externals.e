-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKMENUSHELL_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	-- `hidden' function _gtk_menu_shell_get_popup_delay skipped.
	gtk_menu_shell_get_type: NATURAL_64 is
 		-- gtk_menu_shell_get_type (node at line 1514)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_shell_get_type()"
		}"
		end

	gtk_menu_shell_insert (a_menu_shell: POINTER; a_child: POINTER; a_position: INTEGER_32) is
 		-- gtk_menu_shell_insert (node at line 2081)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_shell_insert"
		}"
		end

	gtk_menu_shell_deactivate (a_menu_shell: POINTER) is
 		-- gtk_menu_shell_deactivate (node at line 2258)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_shell_deactivate"
		}"
		end

	-- `hidden' function _gtk_menu_shell_set_keyboard_mode skipped.
	gtk_menu_shell_set_take_focus (a_menu_shell: POINTER; a_take_focus: INTEGER_32) is
 		-- gtk_menu_shell_set_take_focus (node at line 3466)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_shell_set_take_focus"
		}"
		end

	gtk_menu_shell_select_first (a_menu_shell: POINTER; a_search_sensitive: INTEGER_32) is
 		-- gtk_menu_shell_select_first (node at line 6695)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_shell_select_first"
		}"
		end

	-- `hidden' function _gtk_menu_shell_select_last skipped.
	gtk_menu_shell_cancel (a_menu_shell: POINTER) is
 		-- gtk_menu_shell_cancel (node at line 17030)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_shell_cancel"
		}"
		end

	gtk_menu_shell_append (a_menu_shell: POINTER; a_child: POINTER) is
 		-- gtk_menu_shell_append (node at line 17084)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_shell_append"
		}"
		end

	-- `hidden' function _gtk_menu_shell_activate skipped.
	-- `hidden' function _gtk_menu_shell_update_mnemonics skipped.
	gtk_menu_shell_activate_item (a_menu_shell: POINTER; a_menu_item: POINTER; a_force_deactivate: INTEGER_32) is
 		-- gtk_menu_shell_activate_item (node at line 29296)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_shell_activate_item"
		}"
		end

	gtk_menu_shell_deselect (a_menu_shell: POINTER) is
 		-- gtk_menu_shell_deselect (node at line 29559)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_shell_deselect"
		}"
		end

	gtk_menu_shell_prepend (a_menu_shell: POINTER; a_child: POINTER) is
 		-- gtk_menu_shell_prepend (node at line 32488)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_shell_prepend"
		}"
		end

	gtk_menu_shell_get_take_focus (a_menu_shell: POINTER): INTEGER_32 is
 		-- gtk_menu_shell_get_take_focus (node at line 33823)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_shell_get_take_focus"
		}"
		end

	-- `hidden' function _gtk_menu_shell_add_mnemonic skipped.
	-- `hidden' function _gtk_menu_shell_remove_mnemonic skipped.
	-- `hidden' function _gtk_menu_shell_get_keyboard_mode skipped.
	gtk_menu_shell_select_item (a_menu_shell: POINTER; a_menu_item: POINTER) is
 		-- gtk_menu_shell_select_item (node at line 40392)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_shell_select_item"
		}"
		end


end -- class GTKMENUSHELL_EXTERNALS
