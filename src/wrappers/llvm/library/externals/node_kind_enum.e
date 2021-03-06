-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class NODE_KIND_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = char_kind_low_level)  or else
				(a_value = cstring_kind_low_level)  or else
				(a_value = dec_ikind_low_level)  or else
				(a_value = dec_lkind_low_level)  or else
				(a_value = dec_llkind_low_level)  or else
				(a_value = dec_uikind_low_level)  or else
				(a_value = dec_ulkind_low_level)  or else
				(a_value = dec_ullkind_low_level)  or else
				(a_value = empty_kind_low_level)  or else
				(a_value = null_kind_low_level)  or else
				(a_value = std_string_kind_low_level)  or else
				(a_value = string_ref_kind_low_level)  or else
				(a_value = twine_kind_low_level)  or else
				(a_value = uhex_kind_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_char_kind
		do
			value := char_kind_low_level
		end

	set_cstring_kind
		do
			value := cstring_kind_low_level
		end

	set_dec_ikind
		do
			value := dec_ikind_low_level
		end

	set_dec_lkind
		do
			value := dec_lkind_low_level
		end

	set_dec_llkind
		do
			value := dec_llkind_low_level
		end

	set_dec_uikind
		do
			value := dec_uikind_low_level
		end

	set_dec_ulkind
		do
			value := dec_ulkind_low_level
		end

	set_dec_ullkind
		do
			value := dec_ullkind_low_level
		end

	set_empty_kind
		do
			value := empty_kind_low_level
		end

	set_null_kind
		do
			value := null_kind_low_level
		end

	set_std_string_kind
		do
			value := std_string_kind_low_level
		end

	set_string_ref_kind
		do
			value := string_ref_kind_low_level
		end

	set_twine_kind
		do
			value := twine_kind_low_level
		end

	set_uhex_kind
		do
			value := uhex_kind_low_level
		end

feature {ANY} -- Queries
	is_char_kind: BOOLEAN
		do
			Result := (value=char_kind_low_level)
		end

	is_cstring_kind: BOOLEAN
		do
			Result := (value=cstring_kind_low_level)
		end

	is_dec_ikind: BOOLEAN
		do
			Result := (value=dec_ikind_low_level)
		end

	is_dec_lkind: BOOLEAN
		do
			Result := (value=dec_lkind_low_level)
		end

	is_dec_llkind: BOOLEAN
		do
			Result := (value=dec_llkind_low_level)
		end

	is_dec_uikind: BOOLEAN
		do
			Result := (value=dec_uikind_low_level)
		end

	is_dec_ulkind: BOOLEAN
		do
			Result := (value=dec_ulkind_low_level)
		end

	is_dec_ullkind: BOOLEAN
		do
			Result := (value=dec_ullkind_low_level)
		end

	is_empty_kind: BOOLEAN
		do
			Result := (value=empty_kind_low_level)
		end

	is_null_kind: BOOLEAN
		do
			Result := (value=null_kind_low_level)
		end

	is_std_string_kind: BOOLEAN
		do
			Result := (value=std_string_kind_low_level)
		end

	is_string_ref_kind: BOOLEAN
		do
			Result := (value=string_ref_kind_low_level)
		end

	is_twine_kind: BOOLEAN
		do
			Result := (value=twine_kind_low_level)
		end

	is_uhex_kind: BOOLEAN
		do
			Result := (value=uhex_kind_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	char_kind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "CharKind"
 			}"
 		end

	cstring_kind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "CStringKind"
 			}"
 		end

	dec_ikind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "DecIKind"
 			}"
 		end

	dec_lkind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "DecLKind"
 			}"
 		end

	dec_llkind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "DecLLKind"
 			}"
 		end

	dec_uikind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "DecUIKind"
 			}"
 		end

	dec_ulkind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "DecULKind"
 			}"
 		end

	dec_ullkind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "DecULLKind"
 			}"
 		end

	empty_kind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "EmptyKind"
 			}"
 		end

	null_kind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "NullKind"
 			}"
 		end

	std_string_kind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "StdStringKind"
 			}"
 		end

	string_ref_kind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "StringRefKind"
 			}"
 		end

	twine_kind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "TwineKind"
 			}"
 		end

	uhex_kind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "UHexKind"
 			}"
 		end


end -- class NODE_KIND_ENUM
