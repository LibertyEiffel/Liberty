-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_ORIENTATION_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_orientation_horizontal_low_level)  or else
				(a_value = gtk_orientation_vertical_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_orientation_horizontal is
		do
			value := gtk_orientation_horizontal_low_level
		end

	set_gtk_orientation_vertical is
		do
			value := gtk_orientation_vertical_low_level
		end

feature -- Queries
	is_gtk_orientation_horizontal: BOOLEAN is
		do
			Result := (value=gtk_orientation_horizontal_low_level)
		end

	is_gtk_orientation_vertical: BOOLEAN is
		do
			Result := (value=gtk_orientation_vertical_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_orientation_horizontal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ORIENTATION_HORIZONTAL"
 			}"
 		end

	gtk_orientation_vertical_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ORIENTATION_VERTICAL"
 			}"
 		end


end -- class GTK_ORIENTATION_ENUM
