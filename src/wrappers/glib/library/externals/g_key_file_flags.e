-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class G_KEY_FILE_FLAGS

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN is
		do
			Result := (some_flags & (g_key_file_none | 
				g_key_file_keep_comments | 
				g_key_file_keep_translations)).to_boolean
		end

feature -- Setters
	default_create is
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_g_key_file_none is
		
	do
		value := value.bit_or(g_key_file_none)
	end

	unset_g_key_file_none is
		
	do
		value := value.bit_xor(g_key_file_none)
	end

	set_g_key_file_keep_comments is
		
	do
		value := value.bit_or(g_key_file_keep_comments)
	end

	unset_g_key_file_keep_comments is
		
	do
		value := value.bit_xor(g_key_file_keep_comments)
	end

	set_g_key_file_keep_translations is
		
	do
		value := value.bit_or(g_key_file_keep_translations)
	end

	unset_g_key_file_keep_translations is
		
	do
		value := value.bit_xor(g_key_file_keep_translations)
	end

feature -- Queries
	is_g_key_file_none: BOOLEAN is
		
	do
		Result := (value & g_key_file_none).to_boolean
	end

	is_g_key_file_keep_comments: BOOLEAN is
		
	do
		Result := (value & g_key_file_keep_comments).to_boolean
	end

	is_g_key_file_keep_translations: BOOLEAN is
		
	do
		Result := (value & g_key_file_keep_translations).to_boolean
	end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_key_file_none: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_KEY_FILE_NONE"
 			}"
 		end

	g_key_file_keep_comments: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_KEY_FILE_KEEP_COMMENTS"
 			}"
 		end

	g_key_file_keep_translations: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_KEY_FILE_KEEP_TRANSLATIONS"
 			}"
 		end

end

