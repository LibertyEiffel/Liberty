-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_JUSTIFICATION_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_justify_center_low_level)  or else
				(a_value = gtk_justify_fill_low_level)  or else
				(a_value = gtk_justify_left_low_level)  or else
				(a_value = gtk_justify_right_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_justify_center is
		do
			value := gtk_justify_center_low_level
		end

	set_gtk_justify_fill is
		do
			value := gtk_justify_fill_low_level
		end

	set_gtk_justify_left is
		do
			value := gtk_justify_left_low_level
		end

	set_gtk_justify_right is
		do
			value := gtk_justify_right_low_level
		end

feature -- Queries
	is_gtk_justify_center: BOOLEAN is
		do
			Result := (value=gtk_justify_center_low_level)
		end

	is_gtk_justify_fill: BOOLEAN is
		do
			Result := (value=gtk_justify_fill_low_level)
		end

	is_gtk_justify_left: BOOLEAN is
		do
			Result := (value=gtk_justify_left_low_level)
		end

	is_gtk_justify_right: BOOLEAN is
		do
			Result := (value=gtk_justify_right_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_justify_center_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_JUSTIFY_CENTER"
 			}"
 		end

	gtk_justify_fill_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_JUSTIFY_FILL"
 			}"
 		end

	gtk_justify_left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_JUSTIFY_LEFT"
 			}"
 		end

	gtk_justify_right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_JUSTIFY_RIGHT"
 			}"
 		end


end -- class GTK_JUSTIFICATION_ENUM
