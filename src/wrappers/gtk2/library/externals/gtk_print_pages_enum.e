-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_PRINT_PAGES_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_print_pages_all_low_level)  or else
				(a_value = gtk_print_pages_current_low_level)  or else
				(a_value = gtk_print_pages_ranges_low_level)  or else
				(a_value = gtk_print_pages_selection_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_print_pages_all is
		do
			value := gtk_print_pages_all_low_level
		end

	set_gtk_print_pages_current is
		do
			value := gtk_print_pages_current_low_level
		end

	set_gtk_print_pages_ranges is
		do
			value := gtk_print_pages_ranges_low_level
		end

	set_gtk_print_pages_selection is
		do
			value := gtk_print_pages_selection_low_level
		end

feature -- Queries
	is_gtk_print_pages_all: BOOLEAN is
		do
			Result := (value=gtk_print_pages_all_low_level)
		end

	is_gtk_print_pages_current: BOOLEAN is
		do
			Result := (value=gtk_print_pages_current_low_level)
		end

	is_gtk_print_pages_ranges: BOOLEAN is
		do
			Result := (value=gtk_print_pages_ranges_low_level)
		end

	is_gtk_print_pages_selection: BOOLEAN is
		do
			Result := (value=gtk_print_pages_selection_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_print_pages_all_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_PAGES_ALL"
 			}"
 		end

	gtk_print_pages_current_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_PAGES_CURRENT"
 			}"
 		end

	gtk_print_pages_ranges_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_PAGES_RANGES"
 			}"
 		end

	gtk_print_pages_selection_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_PAGES_SELECTION"
 			}"
 		end


end -- class GTK_PRINT_PAGES_ENUM
