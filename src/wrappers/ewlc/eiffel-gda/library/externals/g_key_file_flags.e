-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_KEY_FILE_FLAGS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = g_key_file_none) or else 
				(a_value = g_key_file_keep_comments) or else 
				(a_value = g_key_file_keep_translations))
		end


feature {ANY} -- Setters
	default_create, set_g_key_file_none is
		do
			value := g_key_file_none
		end

	set_g_key_file_keep_comments is
		do
			value := g_key_file_keep_comments
		end

	set_g_key_file_keep_translations is
		do
			value := g_key_file_keep_translations
		end


feature {ANY} -- Queries
	is_g_key_file_none: BOOLEAN is
		do
			Result := (value=g_key_file_none)
		end

	is_g_key_file_keep_comments: BOOLEAN is
		do
			Result := (value=g_key_file_keep_comments)
		end

	is_g_key_file_keep_translations: BOOLEAN is
		do
			Result := (value=g_key_file_keep_translations)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_key_file_none: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_KEY_FILE_NONE"
		end

	g_key_file_keep_comments: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_KEY_FILE_KEEP_COMMENTS"
		end

	g_key_file_keep_translations: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_KEY_FILE_KEEP_TRANSLATIONS"
		end


end

