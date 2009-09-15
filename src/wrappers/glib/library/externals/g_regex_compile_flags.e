-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class G_REGEX_COMPILE_FLAGS

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN is
		do
			Result := (some_flags & (g_regex_caseless | 
				g_regex_multiline | 
				g_regex_dotall | 
				g_regex_extended | 
				g_regex_anchored | 
				g_regex_dollar_endonly | 
				g_regex_ungreedy | 
				g_regex_raw | 
				g_regex_no_auto_capture | 
				g_regex_optimize | 
				g_regex_dupnames | 
				g_regex_newline_cr | 
				g_regex_newline_lf | 
				g_regex_newline_crlf)).to_boolean
		end

feature -- Setters
	default_create is
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_caseless is
		
	do
		value := value.bit_or(g_regex_caseless)
	end

	unset_caseless is
		
	do
		value := value.bit_xor(g_regex_caseless)
	end

	set_multiline is
		
	do
		value := value.bit_or(g_regex_multiline)
	end

	unset_multiline is
		
	do
		value := value.bit_xor(g_regex_multiline)
	end

	set_dotall is
		
	do
		value := value.bit_or(g_regex_dotall)
	end

	unset_dotall is
		
	do
		value := value.bit_xor(g_regex_dotall)
	end

	set_extended is
		
	do
		value := value.bit_or(g_regex_extended)
	end

	unset_extended is
		
	do
		value := value.bit_xor(g_regex_extended)
	end

	set_anchored is
		
	do
		value := value.bit_or(g_regex_anchored)
	end

	unset_anchored is
		
	do
		value := value.bit_xor(g_regex_anchored)
	end

	set_dollar_endonly is
		
	do
		value := value.bit_or(g_regex_dollar_endonly)
	end

	unset_dollar_endonly is
		
	do
		value := value.bit_xor(g_regex_dollar_endonly)
	end

	set_ungreedy is
		
	do
		value := value.bit_or(g_regex_ungreedy)
	end

	unset_ungreedy is
		
	do
		value := value.bit_xor(g_regex_ungreedy)
	end

	set_raw is
		
	do
		value := value.bit_or(g_regex_raw)
	end

	unset_raw is
		
	do
		value := value.bit_xor(g_regex_raw)
	end

	set_no_auto_capture is
		
	do
		value := value.bit_or(g_regex_no_auto_capture)
	end

	unset_no_auto_capture is
		
	do
		value := value.bit_xor(g_regex_no_auto_capture)
	end

	set_optimize is
		
	do
		value := value.bit_or(g_regex_optimize)
	end

	unset_optimize is
		
	do
		value := value.bit_xor(g_regex_optimize)
	end

	set_dupnames is
		
	do
		value := value.bit_or(g_regex_dupnames)
	end

	unset_dupnames is
		
	do
		value := value.bit_xor(g_regex_dupnames)
	end

	set_newline_cr is
		
	do
		value := value.bit_or(g_regex_newline_cr)
	end

	unset_newline_cr is
		
	do
		value := value.bit_xor(g_regex_newline_cr)
	end

	set_newline_lf is
		
	do
		value := value.bit_or(g_regex_newline_lf)
	end

	unset_newline_lf is
		
	do
		value := value.bit_xor(g_regex_newline_lf)
	end

	set_newline_crlf is
		
	do
		value := value.bit_or(g_regex_newline_crlf)
	end

	unset_newline_crlf is
		
	do
		value := value.bit_xor(g_regex_newline_crlf)
	end

feature -- Queries
	is_caseless: BOOLEAN is
		
	do
		Result := (value & g_regex_caseless).to_boolean
	end

	is_multiline: BOOLEAN is
		
	do
		Result := (value & g_regex_multiline).to_boolean
	end

	is_dotall: BOOLEAN is
		
	do
		Result := (value & g_regex_dotall).to_boolean
	end

	is_extended: BOOLEAN is
		
	do
		Result := (value & g_regex_extended).to_boolean
	end

	is_anchored: BOOLEAN is
		
	do
		Result := (value & g_regex_anchored).to_boolean
	end

	is_dollar_endonly: BOOLEAN is
		
	do
		Result := (value & g_regex_dollar_endonly).to_boolean
	end

	is_ungreedy: BOOLEAN is
		
	do
		Result := (value & g_regex_ungreedy).to_boolean
	end

	is_raw: BOOLEAN is
		
	do
		Result := (value & g_regex_raw).to_boolean
	end

	is_no_auto_capture: BOOLEAN is
		
	do
		Result := (value & g_regex_no_auto_capture).to_boolean
	end

	is_optimize: BOOLEAN is
		
	do
		Result := (value & g_regex_optimize).to_boolean
	end

	is_dupnames: BOOLEAN is
		
	do
		Result := (value & g_regex_dupnames).to_boolean
	end

	is_newline_cr: BOOLEAN is
		
	do
		Result := (value & g_regex_newline_cr).to_boolean
	end

	is_newline_lf: BOOLEAN is
		
	do
		Result := (value & g_regex_newline_lf).to_boolean
	end

	is_newline_crlf: BOOLEAN is
		
	do
		Result := (value & g_regex_newline_crlf).to_boolean
	end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_regex_caseless: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_REGEX_CASELESS"
 			}"
 		end

	g_regex_multiline: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_REGEX_MULTILINE"
 			}"
 		end

	g_regex_dotall: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_REGEX_DOTALL"
 			}"
 		end

	g_regex_extended: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_REGEX_EXTENDED"
 			}"
 		end

	g_regex_anchored: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_REGEX_ANCHORED"
 			}"
 		end

	g_regex_dollar_endonly: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_REGEX_DOLLAR_ENDONLY"
 			}"
 		end

	g_regex_ungreedy: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_REGEX_UNGREEDY"
 			}"
 		end

	g_regex_raw: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_REGEX_RAW"
 			}"
 		end

	g_regex_no_auto_capture: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_REGEX_NO_AUTO_CAPTURE"
 			}"
 		end

	g_regex_optimize: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_REGEX_OPTIMIZE"
 			}"
 		end

	g_regex_dupnames: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_REGEX_DUPNAMES"
 			}"
 		end

	g_regex_newline_cr: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_REGEX_NEWLINE_CR"
 			}"
 		end

	g_regex_newline_lf: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_REGEX_NEWLINE_LF"
 			}"
 		end

	g_regex_newline_crlf: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_REGEX_NEWLINE_CRLF"
 			}"
 		end

end

