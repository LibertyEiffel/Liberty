-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_RECENT_SORT_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_recent_sort_custom_low_level)  or else
				(a_value = gtk_recent_sort_lru_low_level)  or else
				(a_value = gtk_recent_sort_mru_low_level)  or else
				(a_value = gtk_recent_sort_none_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_recent_sort_custom is
		do
			value := gtk_recent_sort_custom_low_level
		end

	set_gtk_recent_sort_lru is
		do
			value := gtk_recent_sort_lru_low_level
		end

	set_gtk_recent_sort_mru is
		do
			value := gtk_recent_sort_mru_low_level
		end

	set_gtk_recent_sort_none is
		do
			value := gtk_recent_sort_none_low_level
		end

feature -- Queries
	is_gtk_recent_sort_custom: BOOLEAN is
		do
			Result := (value=gtk_recent_sort_custom_low_level)
		end

	is_gtk_recent_sort_lru: BOOLEAN is
		do
			Result := (value=gtk_recent_sort_lru_low_level)
		end

	is_gtk_recent_sort_mru: BOOLEAN is
		do
			Result := (value=gtk_recent_sort_mru_low_level)
		end

	is_gtk_recent_sort_none: BOOLEAN is
		do
			Result := (value=gtk_recent_sort_none_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_recent_sort_custom_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RECENT_SORT_CUSTOM"
 			}"
 		end

	gtk_recent_sort_lru_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RECENT_SORT_LRU"
 			}"
 		end

	gtk_recent_sort_mru_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RECENT_SORT_MRU"
 			}"
 		end

	gtk_recent_sort_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RECENT_SORT_NONE"
 			}"
 		end


end -- class GTK_RECENT_SORT_TYPE_ENUM
