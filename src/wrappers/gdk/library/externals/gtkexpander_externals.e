-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKEXPANDER_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_expander_new_with_mnemonic (a_label: POINTER): POINTER is
 		-- gtk_expander_new_with_mnemonic (node at line 3671)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_new_with_mnemonic"
		}"
		end

	gtk_expander_get_use_markup (an_expander: POINTER): INTEGER_32 is
 		-- gtk_expander_get_use_markup (node at line 4442)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_get_use_markup"
		}"
		end

	gtk_expander_set_use_markup (an_expander: POINTER; an_use_markup: INTEGER_32) is
 		-- gtk_expander_set_use_markup (node at line 7306)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_set_use_markup"
		}"
		end

	gtk_expander_get_use_underline (an_expander: POINTER): INTEGER_32 is
 		-- gtk_expander_get_use_underline (node at line 9019)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_get_use_underline"
		}"
		end

	gtk_expander_set_expanded (an_expander: POINTER; an_expanded_external: INTEGER_32) is
 		-- gtk_expander_set_expanded (node at line 11037)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_set_expanded"
		}"
		end

	gtk_expander_get_expanded (an_expander: POINTER): INTEGER_32 is
 		-- gtk_expander_get_expanded (node at line 12149)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_get_expanded"
		}"
		end

	gtk_expander_set_label_widget (an_expander: POINTER; a_label_widget: POINTER) is
 		-- gtk_expander_set_label_widget (node at line 14461)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_set_label_widget"
		}"
		end

	gtk_expander_new (a_label: POINTER): POINTER is
 		-- gtk_expander_new (node at line 15113)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_new"
		}"
		end

	gtk_expander_set_use_underline (an_expander: POINTER; an_use_underline: INTEGER_32) is
 		-- gtk_expander_set_use_underline (node at line 15149)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_set_use_underline"
		}"
		end

	gtk_expander_get_label_widget (an_expander: POINTER): POINTER is
 		-- gtk_expander_get_label_widget (node at line 18809)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_get_label_widget"
		}"
		end

	gtk_expander_get_spacing (an_expander: POINTER): INTEGER_32 is
 		-- gtk_expander_get_spacing (node at line 19728)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_get_spacing"
		}"
		end

	gtk_expander_get_label (an_expander: POINTER): POINTER is
 		-- gtk_expander_get_label (node at line 25150)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_get_label"
		}"
		end

	gtk_expander_get_type: NATURAL_32 is
 		-- gtk_expander_get_type (node at line 32921)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_get_type()"
		}"
		end

	gtk_expander_set_label (an_expander: POINTER; a_label: POINTER) is
 		-- gtk_expander_set_label (node at line 33737)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_set_label"
		}"
		end

	gtk_expander_set_spacing (an_expander: POINTER; a_spacing: INTEGER_32) is
 		-- gtk_expander_set_spacing (node at line 33945)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_set_spacing"
		}"
		end


end -- class GTKEXPANDER_EXTERNALS
