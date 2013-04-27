-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKSHADOWTYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_shadow_etched_in_low_level)  or else
				(a_value = gtk_shadow_etched_out_low_level)  or else
				(a_value = gtk_shadow_in_low_level)  or else
				(a_value = gtk_shadow_none_low_level)  or else
				(a_value = gtk_shadow_out_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_shadow_etched_in is
		do
			value := gtk_shadow_etched_in_low_level
		end

	set_gtk_shadow_etched_out is
		do
			value := gtk_shadow_etched_out_low_level
		end

	set_gtk_shadow_in is
		do
			value := gtk_shadow_in_low_level
		end

	set_gtk_shadow_none is
		do
			value := gtk_shadow_none_low_level
		end

	set_gtk_shadow_out is
		do
			value := gtk_shadow_out_low_level
		end

feature {ANY} -- Queries
	is_gtk_shadow_etched_in: BOOLEAN is
		do
			Result := (value=gtk_shadow_etched_in_low_level)
		end

	is_gtk_shadow_etched_out: BOOLEAN is
		do
			Result := (value=gtk_shadow_etched_out_low_level)
		end

	is_gtk_shadow_in: BOOLEAN is
		do
			Result := (value=gtk_shadow_in_low_level)
		end

	is_gtk_shadow_none: BOOLEAN is
		do
			Result := (value=gtk_shadow_none_low_level)
		end

	is_gtk_shadow_out: BOOLEAN is
		do
			Result := (value=gtk_shadow_out_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_shadow_etched_in_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SHADOW_ETCHED_IN"
 			}"
 		end

	gtk_shadow_etched_out_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SHADOW_ETCHED_OUT"
 			}"
 		end

	gtk_shadow_in_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SHADOW_IN"
 			}"
 		end

	gtk_shadow_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SHADOW_NONE"
 			}"
 		end

	gtk_shadow_out_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SHADOW_OUT"
 			}"
 		end


end -- class GTKSHADOWTYPE_ENUM
