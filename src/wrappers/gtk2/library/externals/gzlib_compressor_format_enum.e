-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GZLIB_COMPRESSOR_FORMAT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = zlib_low_level)  or else
				(a_value = gzip_low_level)  or else
				(a_value = raw_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_zlib is
		do
			value := zlib_low_level
		end

	set_gzip is
		do
			value := gzip_low_level
		end

	set_raw is
		do
			value := raw_low_level
		end

feature {ANY} -- Queries
	zlib: BOOLEAN is
		do
			Result := (value=zlib_low_level)
		end

	gzip: BOOLEAN is
		do
			Result := (value=gzip_low_level)
		end

	raw: BOOLEAN is
		do
			Result := (value=raw_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	zlib_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ZLIB_COMPRESSOR_FORMAT_ZLIB"
 			}"
 		end

	gzip_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ZLIB_COMPRESSOR_FORMAT_GZIP"
 			}"
 		end

	raw_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ZLIB_COMPRESSOR_FORMAT_RAW"
 			}"
 		end


end -- class GZLIB_COMPRESSOR_FORMAT_ENUM
