-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_ENTRY_ICON_POSITION_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_entry_icon_primary_low_level)  or else
				(a_value = gtk_entry_icon_secondary_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_entry_icon_primary is
		do
			value := gtk_entry_icon_primary_low_level
		end

	set_gtk_entry_icon_secondary is
		do
			value := gtk_entry_icon_secondary_low_level
		end

feature -- Queries
	is_gtk_entry_icon_primary: BOOLEAN is
		do
			Result := (value=gtk_entry_icon_primary_low_level)
		end

	is_gtk_entry_icon_secondary: BOOLEAN is
		do
			Result := (value=gtk_entry_icon_secondary_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_entry_icon_primary_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ENTRY_ICON_PRIMARY"
 			}"
 		end

	gtk_entry_icon_secondary_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ENTRY_ICON_SECONDARY"
 			}"
 		end


end -- class GTK_ENTRY_ICON_POSITION_ENUM
