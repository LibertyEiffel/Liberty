-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GREGEX_MATCH_FLAGS_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = anchored_low_level)  or else
				(a_value = bsr_any_low_level)  or else
				(a_value = bsr_anycrlf_low_level)  or else
				(a_value = newline_any_low_level)  or else
				(a_value = newline_anycrlf_low_level)  or else
				(a_value = newline_cr_low_level)  or else
				(a_value = newline_crlf_low_level)  or else
				(a_value = newline_lf_low_level)  or else
				(a_value = notbol_low_level)  or else
				(a_value = notempty_low_level)  or else
				(a_value = notempty_atstart_low_level)  or else
				(a_value = noteol_low_level)  or else
				(a_value = partial_low_level)  or else
				(a_value = partial_hard_low_level)  or else
				(a_value = partial_soft_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_anchored
               do
                       value := anchored_low_level
               end

	set_bsr_any
               do
                       value := bsr_any_low_level
               end

	set_bsr_anycrlf
               do
                       value := bsr_anycrlf_low_level
               end

	set_newline_any
               do
                       value := newline_any_low_level
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

	set_notbol
               do
                       value := notbol_low_level
               end

	set_notempty
               do
                       value := notempty_low_level
               end

	set_notempty_atstart
               do
                       value := notempty_atstart_low_level
               end

	set_noteol
               do
                       value := noteol_low_level
               end

	set_partial
               do
                       value := partial_low_level
               end

	set_partial_hard
               do
                       value := partial_hard_low_level
               end

	set_partial_soft
               do
                       value := partial_soft_low_level
               end

feature {ANY} -- Queries
       is_anchored: BOOLEAN
               do
                       Result := (value=anchored_low_level)
               end

       is_bsr_any: BOOLEAN
               do
                       Result := (value=bsr_any_low_level)
               end

       is_bsr_anycrlf: BOOLEAN
               do
                       Result := (value=bsr_anycrlf_low_level)
               end

       is_newline_any: BOOLEAN
               do
                       Result := (value=newline_any_low_level)
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

       is_notbol: BOOLEAN
               do
                       Result := (value=notbol_low_level)
               end

       is_notempty: BOOLEAN
               do
                       Result := (value=notempty_low_level)
               end

       is_notempty_atstart: BOOLEAN
               do
                       Result := (value=notempty_atstart_low_level)
               end

       is_noteol: BOOLEAN
               do
                       Result := (value=noteol_low_level)
               end

       is_partial: BOOLEAN
               do
                       Result := (value=partial_low_level)
               end

       is_partial_hard: BOOLEAN
               do
                       Result := (value=partial_hard_low_level)
               end

       is_partial_soft: BOOLEAN
               do
                       Result := (value=partial_soft_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     anchored_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_MATCH_ANCHORED"
                       }"
               end

     bsr_any_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_MATCH_BSR_ANY"
                       }"
               end

     bsr_anycrlf_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_MATCH_BSR_ANYCRLF"
                       }"
               end

     newline_any_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_MATCH_NEWLINE_ANY"
                       }"
               end

     newline_anycrlf_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_MATCH_NEWLINE_ANYCRLF"
                       }"
               end

     newline_cr_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_MATCH_NEWLINE_CR"
                       }"
               end

     newline_crlf_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_MATCH_NEWLINE_CRLF"
                       }"
               end

     newline_lf_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_MATCH_NEWLINE_LF"
                       }"
               end

     notbol_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_MATCH_NOTBOL"
                       }"
               end

     notempty_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_MATCH_NOTEMPTY"
                       }"
               end

     notempty_atstart_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_MATCH_NOTEMPTY_ATSTART"
                       }"
               end

     noteol_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_MATCH_NOTEOL"
                       }"
               end

     partial_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_MATCH_PARTIAL"
                       }"
               end

     partial_hard_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_MATCH_PARTIAL_HARD"
                       }"
               end

     partial_soft_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_REGEX_MATCH_PARTIAL_SOFT"
                       }"
               end


end -- class GREGEX_MATCH_FLAGS_ENUM
