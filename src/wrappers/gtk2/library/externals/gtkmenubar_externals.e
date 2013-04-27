-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKMENUBAR_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	-- `hidden' function _gtk_menu_bar_cycle_focus skipped.
	gtk_menu_bar_get_child_pack_direction (a_menubar: POINTER): INTEGER is
 		-- gtk_menu_bar_get_child_pack_direction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_bar_get_child_pack_direction"
		}"
		end

	gtk_menu_bar_get_pack_direction (a_menubar: POINTER): INTEGER is
 		-- gtk_menu_bar_get_pack_direction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_bar_get_pack_direction"
		}"
		end

	gtk_menu_bar_get_type: like long_unsigned is
 		-- gtk_menu_bar_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_bar_get_type()"
		}"
		end

	gtk_menu_bar_new: POINTER is
 		-- gtk_menu_bar_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_bar_new()"
		}"
		end

	gtk_menu_bar_set_child_pack_direction (a_menubar: POINTER; a_child_pack_dir: INTEGER) is
 		-- gtk_menu_bar_set_child_pack_direction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_bar_set_child_pack_direction"
		}"
		end

	gtk_menu_bar_set_pack_direction (a_menubar: POINTER; a_pack_dir: INTEGER) is
 		-- gtk_menu_bar_set_pack_direction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_bar_set_pack_direction"
		}"
		end


end -- class GTKMENUBAR_EXTERNALS
