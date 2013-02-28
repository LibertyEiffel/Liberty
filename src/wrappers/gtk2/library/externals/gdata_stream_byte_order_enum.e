-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDATA_STREAM_BYTE_ORDER_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = big_endian_low_level)  or else
				(a_value = little_endian_low_level)  or else
				(a_value = host_endian_low_level) )
		end

feature -- Setters
	default_create,
	set_big_endian is
		do
			value := big_endian_low_level
		end

	set_little_endian is
		do
			value := little_endian_low_level
		end

	set_host_endian is
		do
			value := host_endian_low_level
		end

feature -- Queries
	big_endian: BOOLEAN is
		do
			Result := (value=big_endian_low_level)
		end

	little_endian: BOOLEAN is
		do
			Result := (value=little_endian_low_level)
		end

	host_endian: BOOLEAN is
		do
			Result := (value=host_endian_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	big_endian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATA_STREAM_BYTE_ORDER_BIG_ENDIAN"
 			}"
 		end

	little_endian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATA_STREAM_BYTE_ORDER_LITTLE_ENDIAN"
 			}"
 		end

	host_endian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATA_STREAM_BYTE_ORDER_HOST_ENDIAN"
 			}"
 		end


end -- class GDATA_STREAM_BYTE_ORDER_ENUM
