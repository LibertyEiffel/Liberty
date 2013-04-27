-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GFILE_QUERY_INFO_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_file_query_info_nofollow_symlinks_low_level)  or else
				(a_value = g_file_query_info_none_low_level) )
		end

feature -- Setters
	default_create,
	set_g_file_query_info_nofollow_symlinks is
		do
			value := g_file_query_info_nofollow_symlinks_low_level
		end

	set_g_file_query_info_none is
		do
			value := g_file_query_info_none_low_level
		end

feature -- Queries
	is_g_file_query_info_nofollow_symlinks: BOOLEAN is
		do
			Result := (value=g_file_query_info_nofollow_symlinks_low_level)
		end

	is_g_file_query_info_none: BOOLEAN is
		do
			Result := (value=g_file_query_info_none_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_file_query_info_nofollow_symlinks_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_QUERY_INFO_NOFOLLOW_SYMLINKS"
 			}"
 		end

	g_file_query_info_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_QUERY_INFO_NONE"
 			}"
 		end


end -- class GFILE_QUERY_INFO_FLAGS_ENUM
