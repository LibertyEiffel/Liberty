-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_EXPANDER_STYLE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_expander_collapsed_low_level)  or else
				(a_value = gtk_expander_expanded_low_level)  or else
				(a_value = gtk_expander_semi_collapsed_low_level)  or else
				(a_value = gtk_expander_semi_expanded_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_expander_collapsed is
		do
			value := gtk_expander_collapsed_low_level
		end

	set_gtk_expander_expanded is
		do
			value := gtk_expander_expanded_low_level
		end

	set_gtk_expander_semi_collapsed is
		do
			value := gtk_expander_semi_collapsed_low_level
		end

	set_gtk_expander_semi_expanded is
		do
			value := gtk_expander_semi_expanded_low_level
		end

feature -- Queries
	is_gtk_expander_collapsed: BOOLEAN is
		do
			Result := (value=gtk_expander_collapsed_low_level)
		end

	is_gtk_expander_expanded: BOOLEAN is
		do
			Result := (value=gtk_expander_expanded_low_level)
		end

	is_gtk_expander_semi_collapsed: BOOLEAN is
		do
			Result := (value=gtk_expander_semi_collapsed_low_level)
		end

	is_gtk_expander_semi_expanded: BOOLEAN is
		do
			Result := (value=gtk_expander_semi_expanded_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_expander_collapsed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_EXPANDER_COLLAPSED"
 			}"
 		end

	gtk_expander_expanded_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_EXPANDER_EXPANDED"
 			}"
 		end

	gtk_expander_semi_collapsed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_EXPANDER_SEMI_COLLAPSED"
 			}"
 		end

	gtk_expander_semi_expanded_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_EXPANDER_SEMI_EXPANDED"
 			}"
 		end


end -- class GTK_EXPANDER_STYLE_ENUM
