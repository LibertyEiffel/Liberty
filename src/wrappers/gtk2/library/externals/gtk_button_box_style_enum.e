-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_BUTTON_BOX_STYLE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_buttonbox_center_low_level)  or else
				(a_value = gtk_buttonbox_default_style_low_level)  or else
				(a_value = gtk_buttonbox_edge_low_level)  or else
				(a_value = gtk_buttonbox_end_low_level)  or else
				(a_value = gtk_buttonbox_spread_low_level)  or else
				(a_value = gtk_buttonbox_start_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_buttonbox_center is
		do
			value := gtk_buttonbox_center_low_level
		end

	set_gtk_buttonbox_default_style is
		do
			value := gtk_buttonbox_default_style_low_level
		end

	set_gtk_buttonbox_edge is
		do
			value := gtk_buttonbox_edge_low_level
		end

	set_gtk_buttonbox_end is
		do
			value := gtk_buttonbox_end_low_level
		end

	set_gtk_buttonbox_spread is
		do
			value := gtk_buttonbox_spread_low_level
		end

	set_gtk_buttonbox_start is
		do
			value := gtk_buttonbox_start_low_level
		end

feature -- Queries
	is_gtk_buttonbox_center: BOOLEAN is
		do
			Result := (value=gtk_buttonbox_center_low_level)
		end

	is_gtk_buttonbox_default_style: BOOLEAN is
		do
			Result := (value=gtk_buttonbox_default_style_low_level)
		end

	is_gtk_buttonbox_edge: BOOLEAN is
		do
			Result := (value=gtk_buttonbox_edge_low_level)
		end

	is_gtk_buttonbox_end: BOOLEAN is
		do
			Result := (value=gtk_buttonbox_end_low_level)
		end

	is_gtk_buttonbox_spread: BOOLEAN is
		do
			Result := (value=gtk_buttonbox_spread_low_level)
		end

	is_gtk_buttonbox_start: BOOLEAN is
		do
			Result := (value=gtk_buttonbox_start_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_buttonbox_center_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTONBOX_CENTER"
 			}"
 		end

	gtk_buttonbox_default_style_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTONBOX_DEFAULT_STYLE"
 			}"
 		end

	gtk_buttonbox_edge_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTONBOX_EDGE"
 			}"
 		end

	gtk_buttonbox_end_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTONBOX_END"
 			}"
 		end

	gtk_buttonbox_spread_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTONBOX_SPREAD"
 			}"
 		end

	gtk_buttonbox_start_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTONBOX_START"
 			}"
 		end


end -- class GTK_BUTTON_BOX_STYLE_ENUM
