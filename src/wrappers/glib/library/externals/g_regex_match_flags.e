-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class G_REGEX_MATCH_FLAGS

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN is
		do
			Result := (some_flags & (g_regex_match_anchored | 
				g_regex_match_notbol | 
				g_regex_match_noteol | 
				g_regex_match_notempty | 
				g_regex_match_partial | 
				g_regex_match_newline_cr | 
				g_regex_match_newline_lf | 
				g_regex_match_newline_crlf | 
				g_regex_match_newline_any)).to_boolean
		end

feature -- Setters
	default_create is
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_anchored is
		
	do
		value := value.bit_or(g_regex_match_anchored)
	end

	unset_anchored is
		
	do
		value := value.bit_xor(g_regex_match_anchored)
	end

	set_notbol is
		
	do
		value := value.bit_or(g_regex_match_notbol)
	end

	unset_notbol is
		
	do
		value := value.bit_xor(g_regex_match_notbol)
	end

	set_noteol is
		
	do
		value := value.bit_or(g_regex_match_noteol)
	end

	unset_noteol is
		
	do
		value := value.bit_xor(g_regex_match_noteol)
	end

	set_notempty is
		
	do
		value := value.bit_or(g_regex_match_notempty)
	end

	unset_notempty is
		
	do
		value := value.bit_xor(g_regex_match_notempty)
	end

	set_partial is
		
	do
		value := value.bit_or(g_regex_match_partial)
	end

	unset_partial is
		
	do
		value := value.bit_xor(g_regex_match_partial)
	end

	set_newline_cr is
		
	do
		value := value.bit_or(g_regex_match_newline_cr)
	end

	unset_newline_cr is
		
	do
		value := value.bit_xor(g_regex_match_newline_cr)
	end

	set_newline_lf is
		
	do
		value := value.bit_or(g_regex_match_newline_lf)
	end

	unset_newline_lf is
		
	do
		value := value.bit_xor(g_regex_match_newline_lf)
	end

	set_newline_crlf is
		
	do
		value := value.bit_or(g_regex_match_newline_crlf)
	end

	unset_newline_crlf is
		
	do
		value := value.bit_xor(g_regex_match_newline_crlf)
	end

	set_newline_any is
		
	do
		value := value.bit_or(g_regex_match_newline_any)
	end

	unset_newline_any is
		
	do
		value := value.bit_xor(g_regex_match_newline_any)
	end

feature -- Queries
	is_anchored: BOOLEAN is
		
	do
		Result := (value & g_regex_match_anchored).to_boolean
	end

	is_notbol: BOOLEAN is
		
	do
		Result := (value & g_regex_match_notbol).to_boolean
	end

	is_noteol: BOOLEAN is
		
	do
		Result := (value & g_regex_match_noteol).to_boolean
	end

	is_notempty: BOOLEAN is
		
	do
		Result := (value & g_regex_match_notempty).to_boolean
	end

	is_partial: BOOLEAN is
		
	do
		Result := (value & g_regex_match_partial).to_boolean
	end

	is_newline_cr: BOOLEAN is
		
	do
		Result := (value & g_regex_match_newline_cr).to_boolean
	end

	is_newline_lf: BOOLEAN is
		
	do
		Result := (value & g_regex_match_newline_lf).to_boolean
	end

	is_newline_crlf: BOOLEAN is
		
	do
		Result := (value & g_regex_match_newline_crlf).to_boolean
	end

	is_newline_any: BOOLEAN is
		
	do
		Result := (value & g_regex_match_newline_any).to_boolean
	end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_regex_match_anchored: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_REGEX_MATCH_ANCHORED"
 			}"
 		end

	g_regex_match_notbol: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_REGEX_MATCH_NOTBOL"
 			}"
 		end

	g_regex_match_noteol: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_REGEX_MATCH_NOTEOL"
 			}"
 		end

	g_regex_match_notempty: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_REGEX_MATCH_NOTEMPTY"
 			}"
 		end

	g_regex_match_partial: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_REGEX_MATCH_PARTIAL"
 			}"
 		end

	g_regex_match_newline_cr: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_REGEX_MATCH_NEWLINE_CR"
 			}"
 		end

	g_regex_match_newline_lf: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_REGEX_MATCH_NEWLINE_LF"
 			}"
 		end

	g_regex_match_newline_crlf: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_REGEX_MATCH_NEWLINE_CRLF"
 			}"
 		end

	g_regex_match_newline_any: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_REGEX_MATCH_NEWLINE_ANY"
 			}"
 		end

end

