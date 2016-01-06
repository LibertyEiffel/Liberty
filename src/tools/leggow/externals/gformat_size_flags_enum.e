-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GFORMAT_SIZE_FLAGS_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = default_external_low_level)  or else
				(a_value = iec_units_low_level)  or else
				(a_value = long_format_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_default_external
               do
                       value := default_external_low_level
               end

	set_iec_units
               do
                       value := iec_units_low_level
               end

	set_long_format
               do
                       value := long_format_low_level
               end

feature {ANY} -- Queries
       is_default_external: BOOLEAN
               do
                       Result := (value=default_external_low_level)
               end

       is_iec_units: BOOLEAN
               do
                       Result := (value=iec_units_low_level)
               end

       is_long_format: BOOLEAN
               do
                       Result := (value=long_format_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     default_external_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FORMAT_SIZE_DEFAULT"
                       }"
               end

     iec_units_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FORMAT_SIZE_IEC_UNITS"
                       }"
               end

     long_format_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FORMAT_SIZE_LONG_FORMAT"
                       }"
               end


end -- class GFORMAT_SIZE_FLAGS_ENUM
