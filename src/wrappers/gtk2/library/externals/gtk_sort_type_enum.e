-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_SORT_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_sort_ascending_low_level)  or else
				(a_value = gtk_sort_descending_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_sort_ascending is
		do
			value := gtk_sort_ascending_low_level
		end

	set_gtk_sort_descending is
		do
			value := gtk_sort_descending_low_level
		end

feature -- Queries
	is_gtk_sort_ascending: BOOLEAN is
		do
			Result := (value=gtk_sort_ascending_low_level)
		end

	is_gtk_sort_descending: BOOLEAN is
		do
			Result := (value=gtk_sort_descending_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_sort_ascending_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SORT_ASCENDING"
 			}"
 		end

	gtk_sort_descending_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SORT_DESCENDING"
 			}"
 		end


end -- class GTK_SORT_TYPE_ENUM
