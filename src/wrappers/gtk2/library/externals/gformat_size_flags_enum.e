-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GFORMAT_SIZE_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = default_external_low_level)  or else
				(a_value = long_format_low_level)  or else
				(a_value = iec_units_low_level) )
		end

feature -- Setters
	default_create,
	set_default_external is
		do
			value := default_external_low_level
		end

	set_long_format is
		do
			value := long_format_low_level
		end

	set_iec_units is
		do
			value := iec_units_low_level
		end

feature -- Queries
	default_external: BOOLEAN is
		do
			Result := (value=default_external_low_level)
		end

	long_format: BOOLEAN is
		do
			Result := (value=long_format_low_level)
		end

	iec_units: BOOLEAN is
		do
			Result := (value=iec_units_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	default_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FORMAT_SIZE_DEFAULT"
 			}"
 		end

	long_format_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FORMAT_SIZE_LONG_FORMAT"
 			}"
 		end

	iec_units_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FORMAT_SIZE_IEC_UNITS"
 			}"
 		end


end -- class GFORMAT_SIZE_FLAGS_ENUM
