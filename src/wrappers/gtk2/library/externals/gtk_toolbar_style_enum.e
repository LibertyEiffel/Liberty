-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_TOOLBAR_STYLE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_toolbar_both_low_level)  or else
				(a_value = gtk_toolbar_both_horiz_low_level)  or else
				(a_value = gtk_toolbar_icons_low_level)  or else
				(a_value = gtk_toolbar_text_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_toolbar_both is
		do
			value := gtk_toolbar_both_low_level
		end

	set_gtk_toolbar_both_horiz is
		do
			value := gtk_toolbar_both_horiz_low_level
		end

	set_gtk_toolbar_icons is
		do
			value := gtk_toolbar_icons_low_level
		end

	set_gtk_toolbar_text is
		do
			value := gtk_toolbar_text_low_level
		end

feature -- Queries
	is_gtk_toolbar_both: BOOLEAN is
		do
			Result := (value=gtk_toolbar_both_low_level)
		end

	is_gtk_toolbar_both_horiz: BOOLEAN is
		do
			Result := (value=gtk_toolbar_both_horiz_low_level)
		end

	is_gtk_toolbar_icons: BOOLEAN is
		do
			Result := (value=gtk_toolbar_icons_low_level)
		end

	is_gtk_toolbar_text: BOOLEAN is
		do
			Result := (value=gtk_toolbar_text_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_toolbar_both_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TOOLBAR_BOTH"
 			}"
 		end

	gtk_toolbar_both_horiz_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TOOLBAR_BOTH_HORIZ"
 			}"
 		end

	gtk_toolbar_icons_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TOOLBAR_ICONS"
 			}"
 		end

	gtk_toolbar_text_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TOOLBAR_TEXT"
 			}"
 		end


end -- class GTK_TOOLBAR_STYLE_ENUM
