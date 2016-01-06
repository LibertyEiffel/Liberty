-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GREGEX_COMPILE_FLAGS_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = anchored_low_level)  or else
				(a_value = bsr_anycrlf_low_level)  or else
				(a_value = caseless_low_level)  or else
				(a_value = dollar_endonly_low_level)  or else
				(a_value = dotall_low_level)  or else
				(a_value = dupnames_low_level)  or else
				(a_value = extended_low_level)  or else
				(a_value = firstline_low_level)  or else
				(a_value = javascript_compat_low_level)  or else
				(a_value = multiline_low_level)  or else
				(a_value = newline_anycrlf_low_level)  or else
				(a_value = newline_cr_low_level)  or else
				(a_value = newline_crlf_low_level)  or else
				(a_value = newline_lf_low_level)  or else
				(a_value = no_auto_capture_low_level)  or else
				(a_value = optimize_low_level)  or else
				(a_value = raw_low_level)  or else
				(a_value = ungreedy_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_anchored
               do
                       value := anchored_low_level
               end

	set_bsr_anycrlf
               do
                       value := bsr_anycrlf_low_level
               end

	set_caseless
               do
                       value := caseless_low_level
               end

	set_dollar_endonly
               do
                       value := dollar_endonly_low_level
               end

	set_dotall
               do
                       value := dotall_low_level
               end

	set_dupnames
               do
                       value := dupnames_low_level
               end

	set_extended
               do
                       value := extended_low_level
               end

	set_firstline
               do
                       value := firstline_low_level
               end

	set_javascript_compat
               do
                       value := javascript_compat_low_level
               end

	set_multiline
               do
                       value := multiline_low_level
               end

	set_newline_anycrlf
               do
                       value := newline_anycrlf_low_level
               end

	set_newline_cr
               do
                       value := newline_cr_low_level
               end

	set_newline_crlf
               do
                       value := newline_crlf_low_level
               end

	set_newline_lf
               do
                       value := newline_lf_low_level
               end

	set_no_auto_capture
               do
                       value := no_auto_capture_low_level
               end

	set_optimize
               do
                       value := optimize_low_level
               end

	set_raw
               do
                       value := raw_low_level
               end

	set_ungreedy
               do
                       value := ungreedy_low_level
               end

feature {ANY} -- Queries
       is_anchored: BOOLEAN
               do
                       Result := (value=anchored_low_level)
               end

       is_bsr_anycrlf: BOOLEAN
               do
                       Result := (value=bsr_anycrlf_low_level)
               end

       is_caseless: BOOLEAN
               do
                       Result := (value=caseless_low_level)
               end

       is_dollar_endonly: BOOLEAN
               do
                       Result := (value=dollar_endonly_low_level)
               end

       is_dotall: BOOLEAN
               do
                       Result := (value=dotall_low_level)
               end

       is_dupnames: BOOLEAN
               do
                       Result := (value=dupnames_low_level)
               end

       is_extended: BOOLEAN
               do
                       Result := (value=extended_low_level)
               end

       is_firstline: BOOLEAN
               do
                       Result := (value=firstline_low_level)
               end

       is_javascript_compat: BOOLEAN
               do
                       Result := (value=javascript_compat_low_level)
               end

       is_multiline: BOOLEAN
               do
                       Result := (value=multiline_low_level)
               end

       is_newline_anycrlf: BOOLEAN
               do
                       Result := (value=newline_anycrlf_low_level)
               end

       is_newline_cr: BOOLEAN
               do
                       Result := (value=newline_cr_low_level)
               end

       is_newline_crlf: BOOLEAN
               do
                       Result := (value=newline_crlf_low_level)
               end

       is_newline_lf: BOOLEAN
               do
                       Result := (value=newline_lf_low_level)
               end

       is_no_auto_capture: BOOLEAN
               do
                       Result := (value=no_auto_capture_low_level)
               end

       is_optimize: BOOLEAN
               do
                       Result := (value=optimize_low_level)
               end

       is_raw: BOOLEAN
               do
                       Result := (value=raw_low_level)
               end

       is_ungreedy: BOOLEAN
               do
                       Result := (value=ungreedy_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     anchored_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_ANCHORED"
                       }"
               end

     bsr_anycrlf_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_BSR_ANYCRLF"
                       }"
               end

     caseless_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_CASELESS"
                       }"
               end

     dollar_endonly_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_DOLLAR_ENDONLY"
                       }"
               end

     dotall_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_DOTALL"
                       }"
               end

     dupnames_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_DUPNAMES"
                       }"
               end

     extended_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_EXTENDED"
                       }"
               end

     firstline_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_FIRSTLINE"
                       }"
               end

     javascript_compat_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_JAVASCRIPT_COMPAT"
                       }"
               end

     multiline_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_MULTILINE"
                       }"
               end

     newline_anycrlf_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_NEWLINE_ANYCRLF"
                       }"
               end

     newline_cr_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_NEWLINE_CR"
                       }"
               end

     newline_crlf_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_NEWLINE_CRLF"
                       }"
               end

     newline_lf_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_NEWLINE_LF"
                       }"
               end

     no_auto_capture_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_NO_AUTO_CAPTURE"
                       }"
               end

     optimize_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_OPTIMIZE"
                       }"
               end

     raw_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_RAW"
                       }"
               end

     ungreedy_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_UNGREEDY"
                       }"
               end


end -- class GREGEX_COMPILE_FLAGS_ENUM
