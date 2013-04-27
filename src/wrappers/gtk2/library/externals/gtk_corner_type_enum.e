-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_CORNER_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_corner_bottom_left_low_level)  or else
				(a_value = gtk_corner_bottom_right_low_level)  or else
				(a_value = gtk_corner_top_left_low_level)  or else
				(a_value = gtk_corner_top_right_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_corner_bottom_left is
		do
			value := gtk_corner_bottom_left_low_level
		end

	set_gtk_corner_bottom_right is
		do
			value := gtk_corner_bottom_right_low_level
		end

	set_gtk_corner_top_left is
		do
			value := gtk_corner_top_left_low_level
		end

	set_gtk_corner_top_right is
		do
			value := gtk_corner_top_right_low_level
		end

feature -- Queries
	is_gtk_corner_bottom_left: BOOLEAN is
		do
			Result := (value=gtk_corner_bottom_left_low_level)
		end

	is_gtk_corner_bottom_right: BOOLEAN is
		do
			Result := (value=gtk_corner_bottom_right_low_level)
		end

	is_gtk_corner_top_left: BOOLEAN is
		do
			Result := (value=gtk_corner_top_left_low_level)
		end

	is_gtk_corner_top_right: BOOLEAN is
		do
			Result := (value=gtk_corner_top_right_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_corner_bottom_left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CORNER_BOTTOM_LEFT"
 			}"
 		end

	gtk_corner_bottom_right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CORNER_BOTTOM_RIGHT"
 			}"
 		end

	gtk_corner_top_left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CORNER_TOP_LEFT"
 			}"
 		end

	gtk_corner_top_right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CORNER_TOP_RIGHT"
 			}"
 		end


end -- class GTK_CORNER_TYPE_ENUM
