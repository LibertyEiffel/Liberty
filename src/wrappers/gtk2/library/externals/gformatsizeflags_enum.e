-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GFORMATSIZEFLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_format_size_default_low_level)  or else
				(a_value = g_format_size_iec_units_low_level)  or else
				(a_value = g_format_size_long_format_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_format_size_default is
		do
			value := g_format_size_default_low_level
		end

	set_g_format_size_iec_units is
		do
			value := g_format_size_iec_units_low_level
		end

	set_g_format_size_long_format is
		do
			value := g_format_size_long_format_low_level
		end

feature {ANY} -- Queries
	is_g_format_size_default: BOOLEAN is
		do
			Result := (value=g_format_size_default_low_level)
		end

	is_g_format_size_iec_units: BOOLEAN is
		do
			Result := (value=g_format_size_iec_units_low_level)
		end

	is_g_format_size_long_format: BOOLEAN is
		do
			Result := (value=g_format_size_long_format_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_format_size_default_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FORMAT_SIZE_DEFAULT"
 			}"
 		end

	g_format_size_iec_units_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FORMAT_SIZE_IEC_UNITS"
 			}"
 		end

	g_format_size_long_format_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FORMAT_SIZE_LONG_FORMAT"
 			}"
 		end


end -- class GFORMATSIZEFLAGS_ENUM
