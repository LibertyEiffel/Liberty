-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class UCONVERTER_UNICODE_SET_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = roundtrip_and_fallback_set_low_level)  or else
				(a_value = roundtrip_set_low_level)  or else
				(a_value = set_count_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_roundtrip_and_fallback_set
               do
                       value := roundtrip_and_fallback_set_low_level
               end

	set_roundtrip_set
               do
                       value := roundtrip_set_low_level
               end

	set_set_count
               do
                       value := set_count_low_level
               end

feature {ANY} -- Queries
       is_roundtrip_and_fallback_set: BOOLEAN
               do
                       Result := (value=roundtrip_and_fallback_set_low_level)
               end

       is_roundtrip_set: BOOLEAN
               do
                       Result := (value=roundtrip_set_low_level)
               end

       is_set_count: BOOLEAN
               do
                       Result := (value=set_count_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     roundtrip_and_fallback_set_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_ROUNDTRIP_AND_FALLBACK_SET"
                       }"
               end

     roundtrip_set_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_ROUNDTRIP_SET"
                       }"
               end

     set_count_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_SET_COUNT"
                       }"
               end


end -- class UCONVERTER_UNICODE_SET_ENUM
