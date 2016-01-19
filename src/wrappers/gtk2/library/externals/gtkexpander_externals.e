-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKEXPANDER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_expander_get_expanded (an_expander: POINTER): INTEGER is
 		-- gtk_expander_get_expanded
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_get_expanded"
		}"
		end

	gtk_expander_get_label (an_expander: POINTER): POINTER is
 		-- gtk_expander_get_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_get_label"
		}"
		end

	gtk_expander_get_label_fill (an_expander: POINTER): INTEGER is
 		-- gtk_expander_get_label_fill
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_get_label_fill"
		}"
		end

	gtk_expander_get_label_widget (an_expander: POINTER): POINTER is
 		-- gtk_expander_get_label_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_get_label_widget"
		}"
		end

	gtk_expander_get_spacing (an_expander: POINTER): INTEGER is
 		-- gtk_expander_get_spacing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_get_spacing"
		}"
		end

	gtk_expander_get_type: like long_unsigned is
 		-- gtk_expander_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_get_type()"
		}"
		end

	gtk_expander_get_use_markup (an_expander: POINTER): INTEGER is
 		-- gtk_expander_get_use_markup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_get_use_markup"
		}"
		end

	gtk_expander_get_use_underline (an_expander: POINTER): INTEGER is
 		-- gtk_expander_get_use_underline
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_get_use_underline"
		}"
		end

	gtk_expander_new (a_label: POINTER): POINTER is
 		-- gtk_expander_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_new"
		}"
		end

	gtk_expander_new_with_mnemonic (a_label: POINTER): POINTER is
 		-- gtk_expander_new_with_mnemonic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_new_with_mnemonic"
		}"
		end

	gtk_expander_set_expanded (an_expander: POINTER; an_expanded_external: INTEGER) is
 		-- gtk_expander_set_expanded
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_set_expanded"
		}"
		end

	gtk_expander_set_label (an_expander: POINTER; a_label: POINTER) is
 		-- gtk_expander_set_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_set_label"
		}"
		end

	gtk_expander_set_label_fill (an_expander: POINTER; a_label_fill: INTEGER) is
 		-- gtk_expander_set_label_fill
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_set_label_fill"
		}"
		end

	gtk_expander_set_label_widget (an_expander: POINTER; a_label_widget: POINTER) is
 		-- gtk_expander_set_label_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_set_label_widget"
		}"
		end

	gtk_expander_set_spacing (an_expander: POINTER; a_spacing: INTEGER) is
 		-- gtk_expander_set_spacing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_set_spacing"
		}"
		end

	gtk_expander_set_use_markup (an_expander: POINTER; an_use_markup: INTEGER) is
 		-- gtk_expander_set_use_markup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_set_use_markup"
		}"
		end

	gtk_expander_set_use_underline (an_expander: POINTER; an_use_underline: INTEGER) is
 		-- gtk_expander_set_use_underline
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_expander_set_use_underline"
		}"
		end


end -- class GTKEXPANDER_EXTERNALS
