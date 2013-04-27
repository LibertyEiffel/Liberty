-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GZLIB_COMPRESSOR_FORMAT_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_zlib_compressor_format_gzip_low_level)  or else
				(a_value = g_zlib_compressor_format_raw_low_level)  or else
				(a_value = g_zlib_compressor_format_zlib_low_level) )
		end

feature -- Setters
	default_create,
	set_g_zlib_compressor_format_gzip is
		do
			value := g_zlib_compressor_format_gzip_low_level
		end

	set_g_zlib_compressor_format_raw is
		do
			value := g_zlib_compressor_format_raw_low_level
		end

	set_g_zlib_compressor_format_zlib is
		do
			value := g_zlib_compressor_format_zlib_low_level
		end

feature -- Queries
	is_g_zlib_compressor_format_gzip: BOOLEAN is
		do
			Result := (value=g_zlib_compressor_format_gzip_low_level)
		end

	is_g_zlib_compressor_format_raw: BOOLEAN is
		do
			Result := (value=g_zlib_compressor_format_raw_low_level)
		end

	is_g_zlib_compressor_format_zlib: BOOLEAN is
		do
			Result := (value=g_zlib_compressor_format_zlib_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_zlib_compressor_format_gzip_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ZLIB_COMPRESSOR_FORMAT_GZIP"
 			}"
 		end

	g_zlib_compressor_format_raw_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ZLIB_COMPRESSOR_FORMAT_RAW"
 			}"
 		end

	g_zlib_compressor_format_zlib_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ZLIB_COMPRESSOR_FORMAT_ZLIB"
 			}"
 		end


end -- class GZLIB_COMPRESSOR_FORMAT_ENUM
