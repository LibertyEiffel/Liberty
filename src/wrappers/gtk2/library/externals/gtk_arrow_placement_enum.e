-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_ARROW_PLACEMENT_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_arrows_both_low_level)  or else
				(a_value = gtk_arrows_end_low_level)  or else
				(a_value = gtk_arrows_start_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_arrows_both is
		do
			value := gtk_arrows_both_low_level
		end

	set_gtk_arrows_end is
		do
			value := gtk_arrows_end_low_level
		end

	set_gtk_arrows_start is
		do
			value := gtk_arrows_start_low_level
		end

feature -- Queries
	is_gtk_arrows_both: BOOLEAN is
		do
			Result := (value=gtk_arrows_both_low_level)
		end

	is_gtk_arrows_end: BOOLEAN is
		do
			Result := (value=gtk_arrows_end_low_level)
		end

	is_gtk_arrows_start: BOOLEAN is
		do
			Result := (value=gtk_arrows_start_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_arrows_both_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ARROWS_BOTH"
 			}"
 		end

	gtk_arrows_end_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ARROWS_END"
 			}"
 		end

	gtk_arrows_start_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ARROWS_START"
 			}"
 		end


end -- class GTK_ARROW_PLACEMENT_ENUM
