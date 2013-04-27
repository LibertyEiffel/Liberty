-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_PRINT_QUALITY_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_print_quality_draft_low_level)  or else
				(a_value = gtk_print_quality_high_low_level)  or else
				(a_value = gtk_print_quality_low_low_level)  or else
				(a_value = gtk_print_quality_normal_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_print_quality_draft is
		do
			value := gtk_print_quality_draft_low_level
		end

	set_gtk_print_quality_high is
		do
			value := gtk_print_quality_high_low_level
		end

	set_gtk_print_quality_low is
		do
			value := gtk_print_quality_low_low_level
		end

	set_gtk_print_quality_normal is
		do
			value := gtk_print_quality_normal_low_level
		end

feature -- Queries
	is_gtk_print_quality_draft: BOOLEAN is
		do
			Result := (value=gtk_print_quality_draft_low_level)
		end

	is_gtk_print_quality_high: BOOLEAN is
		do
			Result := (value=gtk_print_quality_high_low_level)
		end

	is_gtk_print_quality_low: BOOLEAN is
		do
			Result := (value=gtk_print_quality_low_low_level)
		end

	is_gtk_print_quality_normal: BOOLEAN is
		do
			Result := (value=gtk_print_quality_normal_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_print_quality_draft_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_QUALITY_DRAFT"
 			}"
 		end

	gtk_print_quality_high_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_QUALITY_HIGH"
 			}"
 		end

	gtk_print_quality_low_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_QUALITY_LOW"
 			}"
 		end

	gtk_print_quality_normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_QUALITY_NORMAL"
 			}"
 		end


end -- class GTK_PRINT_QUALITY_ENUM
