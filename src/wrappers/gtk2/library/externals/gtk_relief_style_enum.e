-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_RELIEF_STYLE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_relief_half_low_level)  or else
				(a_value = gtk_relief_none_low_level)  or else
				(a_value = gtk_relief_normal_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_relief_half is
		do
			value := gtk_relief_half_low_level
		end

	set_gtk_relief_none is
		do
			value := gtk_relief_none_low_level
		end

	set_gtk_relief_normal is
		do
			value := gtk_relief_normal_low_level
		end

feature -- Queries
	is_gtk_relief_half: BOOLEAN is
		do
			Result := (value=gtk_relief_half_low_level)
		end

	is_gtk_relief_none: BOOLEAN is
		do
			Result := (value=gtk_relief_none_low_level)
		end

	is_gtk_relief_normal: BOOLEAN is
		do
			Result := (value=gtk_relief_normal_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_relief_half_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RELIEF_HALF"
 			}"
 		end

	gtk_relief_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RELIEF_NONE"
 			}"
 		end

	gtk_relief_normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RELIEF_NORMAL"
 			}"
 		end


end -- class GTK_RELIEF_STYLE_ENUM
