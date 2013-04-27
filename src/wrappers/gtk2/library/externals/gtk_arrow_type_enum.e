-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_ARROW_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_arrow_down_low_level)  or else
				(a_value = gtk_arrow_left_low_level)  or else
				(a_value = gtk_arrow_none_low_level)  or else
				(a_value = gtk_arrow_right_low_level)  or else
				(a_value = gtk_arrow_up_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_arrow_down is
		do
			value := gtk_arrow_down_low_level
		end

	set_gtk_arrow_left is
		do
			value := gtk_arrow_left_low_level
		end

	set_gtk_arrow_none is
		do
			value := gtk_arrow_none_low_level
		end

	set_gtk_arrow_right is
		do
			value := gtk_arrow_right_low_level
		end

	set_gtk_arrow_up is
		do
			value := gtk_arrow_up_low_level
		end

feature -- Queries
	is_gtk_arrow_down: BOOLEAN is
		do
			Result := (value=gtk_arrow_down_low_level)
		end

	is_gtk_arrow_left: BOOLEAN is
		do
			Result := (value=gtk_arrow_left_low_level)
		end

	is_gtk_arrow_none: BOOLEAN is
		do
			Result := (value=gtk_arrow_none_low_level)
		end

	is_gtk_arrow_right: BOOLEAN is
		do
			Result := (value=gtk_arrow_right_low_level)
		end

	is_gtk_arrow_up: BOOLEAN is
		do
			Result := (value=gtk_arrow_up_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_arrow_down_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ARROW_DOWN"
 			}"
 		end

	gtk_arrow_left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ARROW_LEFT"
 			}"
 		end

	gtk_arrow_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ARROW_NONE"
 			}"
 		end

	gtk_arrow_right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ARROW_RIGHT"
 			}"
 		end

	gtk_arrow_up_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ARROW_UP"
 			}"
 		end


end -- class GTK_ARROW_TYPE_ENUM
