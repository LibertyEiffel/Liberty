-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_VISIBILITY_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_visibility_full_low_level)  or else
				(a_value = gtk_visibility_none_low_level)  or else
				(a_value = gtk_visibility_partial_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_visibility_full is
		do
			value := gtk_visibility_full_low_level
		end

	set_gtk_visibility_none is
		do
			value := gtk_visibility_none_low_level
		end

	set_gtk_visibility_partial is
		do
			value := gtk_visibility_partial_low_level
		end

feature -- Queries
	is_gtk_visibility_full: BOOLEAN is
		do
			Result := (value=gtk_visibility_full_low_level)
		end

	is_gtk_visibility_none: BOOLEAN is
		do
			Result := (value=gtk_visibility_none_low_level)
		end

	is_gtk_visibility_partial: BOOLEAN is
		do
			Result := (value=gtk_visibility_partial_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_visibility_full_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_VISIBILITY_FULL"
 			}"
 		end

	gtk_visibility_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_VISIBILITY_NONE"
 			}"
 		end

	gtk_visibility_partial_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_VISIBILITY_PARTIAL"
 			}"
 		end


end -- class GTK_VISIBILITY_ENUM
