-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GREGEX_COMPILE_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = caseless_low_level)  or else
				(a_value = multiline_low_level)  or else
				(a_value = dotall_low_level)  or else
				(a_value = extended_low_level)  or else
				(a_value = anchored_low_level)  or else
				(a_value = dollar_endonly_low_level)  or else
				(a_value = ungreedy_low_level)  or else
				(a_value = raw_low_level)  or else
				(a_value = no_auto_capture_low_level)  or else
				(a_value = optimize_low_level)  or else
				(a_value = dupnames_low_level)  or else
				(a_value = newline_cr_low_level)  or else
				(a_value = newline_lf_low_level)  or else
				(a_value = newline_crlf_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_caseless is
		do
			value := caseless_low_level
		end

	set_multiline is
		do
			value := multiline_low_level
		end

	set_dotall is
		do
			value := dotall_low_level
		end

	set_extended is
		do
			value := extended_low_level
		end

	set_anchored is
		do
			value := anchored_low_level
		end

	set_dollar_endonly is
		do
			value := dollar_endonly_low_level
		end

	set_ungreedy is
		do
			value := ungreedy_low_level
		end

	set_raw is
		do
			value := raw_low_level
		end

	set_no_auto_capture is
		do
			value := no_auto_capture_low_level
		end

	set_optimize is
		do
			value := optimize_low_level
		end

	set_dupnames is
		do
			value := dupnames_low_level
		end

	set_newline_cr is
		do
			value := newline_cr_low_level
		end

	set_newline_lf is
		do
			value := newline_lf_low_level
		end

	set_newline_crlf is
		do
			value := newline_crlf_low_level
		end

feature {ANY} -- Queries
	is_caseless: BOOLEAN is
		do
			Result := (value=caseless_low_level)
		end

	is_multiline: BOOLEAN is
		do
			Result := (value=multiline_low_level)
		end

	is_dotall: BOOLEAN is
		do
			Result := (value=dotall_low_level)
		end

	is_extended: BOOLEAN is
		do
			Result := (value=extended_low_level)
		end

	is_anchored: BOOLEAN is
		do
			Result := (value=anchored_low_level)
		end

	is_dollar_endonly: BOOLEAN is
		do
			Result := (value=dollar_endonly_low_level)
		end

	is_ungreedy: BOOLEAN is
		do
			Result := (value=ungreedy_low_level)
		end

	is_raw: BOOLEAN is
		do
			Result := (value=raw_low_level)
		end

	is_no_auto_capture: BOOLEAN is
		do
			Result := (value=no_auto_capture_low_level)
		end

	is_optimize: BOOLEAN is
		do
			Result := (value=optimize_low_level)
		end

	is_dupnames: BOOLEAN is
		do
			Result := (value=dupnames_low_level)
		end

	is_newline_cr: BOOLEAN is
		do
			Result := (value=newline_cr_low_level)
		end

	is_newline_lf: BOOLEAN is
		do
			Result := (value=newline_lf_low_level)
		end

	is_newline_crlf: BOOLEAN is
		do
			Result := (value=newline_crlf_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	caseless_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_CASELESS"
 			}"
 		end

	multiline_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MULTILINE"
 			}"
 		end

	dotall_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_DOTALL"
 			}"
 		end

	extended_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_EXTENDED"
 			}"
 		end

	anchored_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ANCHORED"
 			}"
 		end

	dollar_endonly_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_DOLLAR_ENDONLY"
 			}"
 		end

	ungreedy_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_UNGREEDY"
 			}"
 		end

	raw_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_RAW"
 			}"
 		end

	no_auto_capture_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_NO_AUTO_CAPTURE"
 			}"
 		end

	optimize_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_OPTIMIZE"
 			}"
 		end

	dupnames_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_DUPNAMES"
 			}"
 		end

	newline_cr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_NEWLINE_CR"
 			}"
 		end

	newline_lf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_NEWLINE_LF"
 			}"
 		end

	newline_crlf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_NEWLINE_CRLF"
 			}"
 		end


end -- class GREGEX_COMPILE_FLAGS_ENUM
