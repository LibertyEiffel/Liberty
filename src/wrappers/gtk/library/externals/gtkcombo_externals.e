-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCOMBO_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_combo_set_use_arrows_always (a_combo: POINTER; a_val: INTEGER_32) is
 		-- gtk_combo_set_use_arrows_always (node at line 7407)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_set_use_arrows_always"
		}"
		end

	gtk_combo_new: POINTER is
 		-- gtk_combo_new (node at line 15168)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_new()"
		}"
		end

	gtk_combo_disable_activate (a_combo: POINTER) is
 		-- gtk_combo_disable_activate (node at line 18309)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_disable_activate"
		}"
		end

	gtk_combo_get_type: NATURAL_32 is
 		-- gtk_combo_get_type (node at line 18909)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_get_type()"
		}"
		end

	gtk_combo_set_case_sensitive (a_combo: POINTER; a_val: INTEGER_32) is
 		-- gtk_combo_set_case_sensitive (node at line 21696)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_set_case_sensitive"
		}"
		end

	gtk_combo_set_item_string (a_combo: POINTER; an_item: POINTER; an_item_value: POINTER) is
 		-- gtk_combo_set_item_string (node at line 23183)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_set_item_string"
		}"
		end

	gtk_combo_set_value_in_list (a_combo: POINTER; a_val: INTEGER_32; an_ok_if_empty: INTEGER_32) is
 		-- gtk_combo_set_value_in_list (node at line 24359)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_set_value_in_list"
		}"
		end

	gtk_combo_set_popdown_strings (a_combo: POINTER; a_strings: POINTER) is
 		-- gtk_combo_set_popdown_strings (node at line 29582)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_set_popdown_strings"
		}"
		end

	gtk_combo_set_use_arrows (a_combo: POINTER; a_val: INTEGER_32) is
 		-- gtk_combo_set_use_arrows (node at line 36903)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_combo_set_use_arrows"
		}"
		end


end -- class GTKCOMBO_EXTERNALS
