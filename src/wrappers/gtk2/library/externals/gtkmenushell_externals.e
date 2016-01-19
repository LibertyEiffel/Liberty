-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKMENUSHELL_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	-- `hidden' function _gtk_menu_shell_activate skipped.
	gtk_menu_shell_activate_item (a_menu_shell: POINTER; a_menu_item: POINTER; a_force_deactivate: INTEGER) is
 		-- gtk_menu_shell_activate_item
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_shell_activate_item"
		}"
		end

	-- `hidden' function _gtk_menu_shell_add_mnemonic skipped.
	gtk_menu_shell_append (a_menu_shell: POINTER; a_child: POINTER) is
 		-- gtk_menu_shell_append
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_shell_append"
		}"
		end

	gtk_menu_shell_cancel (a_menu_shell: POINTER) is
 		-- gtk_menu_shell_cancel
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_shell_cancel"
		}"
		end

	gtk_menu_shell_deactivate (a_menu_shell: POINTER) is
 		-- gtk_menu_shell_deactivate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_shell_deactivate"
		}"
		end

	gtk_menu_shell_deselect (a_menu_shell: POINTER) is
 		-- gtk_menu_shell_deselect
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_shell_deselect"
		}"
		end

	-- `hidden' function _gtk_menu_shell_get_keyboard_mode skipped.
	-- `hidden' function _gtk_menu_shell_get_popup_delay skipped.
	gtk_menu_shell_get_take_focus (a_menu_shell: POINTER): INTEGER is
 		-- gtk_menu_shell_get_take_focus
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_shell_get_take_focus"
		}"
		end

	gtk_menu_shell_get_type: like long_unsigned is
 		-- gtk_menu_shell_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_shell_get_type()"
		}"
		end

	gtk_menu_shell_insert (a_menu_shell: POINTER; a_child: POINTER; a_position: INTEGER) is
 		-- gtk_menu_shell_insert
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_shell_insert"
		}"
		end

	gtk_menu_shell_prepend (a_menu_shell: POINTER; a_child: POINTER) is
 		-- gtk_menu_shell_prepend
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_shell_prepend"
		}"
		end

	-- `hidden' function _gtk_menu_shell_remove_mnemonic skipped.
	gtk_menu_shell_select_first (a_menu_shell: POINTER; a_search_sensitive: INTEGER) is
 		-- gtk_menu_shell_select_first
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_shell_select_first"
		}"
		end

	gtk_menu_shell_select_item (a_menu_shell: POINTER; a_menu_item: POINTER) is
 		-- gtk_menu_shell_select_item
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_shell_select_item"
		}"
		end

	-- `hidden' function _gtk_menu_shell_select_last skipped.
	-- `hidden' function _gtk_menu_shell_set_keyboard_mode skipped.
	gtk_menu_shell_set_take_focus (a_menu_shell: POINTER; a_take_focus: INTEGER) is
 		-- gtk_menu_shell_set_take_focus
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_shell_set_take_focus"
		}"
		end

	-- `hidden' function _gtk_menu_shell_update_mnemonics skipped.

end -- class GTKMENUSHELL_EXTERNALS
