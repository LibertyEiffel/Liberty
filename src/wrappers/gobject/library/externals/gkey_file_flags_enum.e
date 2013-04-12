-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GKEY_FILE_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_key_file_keep_comments_low_level)  or else
				(a_value = g_key_file_keep_translations_low_level)  or else
				(a_value = g_key_file_none_low_level) )
		end

feature -- Setters
	default_create,
	set_g_key_file_keep_comments is
		do
			value := g_key_file_keep_comments_low_level
		end

	set_g_key_file_keep_translations is
		do
			value := g_key_file_keep_translations_low_level
		end

	set_g_key_file_none is
		do
			value := g_key_file_none_low_level
		end

feature -- Queries
	is_g_key_file_keep_comments: BOOLEAN is
		do
			Result := (value=g_key_file_keep_comments_low_level)
		end

	is_g_key_file_keep_translations: BOOLEAN is
		do
			Result := (value=g_key_file_keep_translations_low_level)
		end

	is_g_key_file_none: BOOLEAN is
		do
			Result := (value=g_key_file_none_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_key_file_keep_comments_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_KEY_FILE_KEEP_COMMENTS"
 			}"
 		end

	g_key_file_keep_translations_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_KEY_FILE_KEEP_TRANSLATIONS"
 			}"
 		end

	g_key_file_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_KEY_FILE_NONE"
 			}"
 		end


end -- class GKEY_FILE_FLAGS_ENUM
