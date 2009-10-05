-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class NODE_KIND_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = null_kind_low_level)  or else
				(a_value = twine_kind_low_level)  or else
				(a_value = cstring_kind_low_level)  or else
				(a_value = std_string_kind_low_level)  or else
				(a_value = string_ref_kind_low_level)  or else
				(a_value = dec_uikind_low_level)  or else
				(a_value = dec_ikind_low_level)  or else
				(a_value = dec_ulkind_low_level)  or else
				(a_value = dec_lkind_low_level)  or else
				(a_value = dec_ullkind_low_level)  or else
				(a_value = dec_llkind_low_level)  or else
				(a_value = uhex_kind_low_level) )
		end

feature -- Setters
	default_create,
	set_null_kind is
		do
			value := null_kind_low_level
		end

	set_twine_kind is
		do
			value := twine_kind_low_level
		end

	set_cstring_kind is
		do
			value := cstring_kind_low_level
		end

	set_std_string_kind is
		do
			value := std_string_kind_low_level
		end

	set_string_ref_kind is
		do
			value := string_ref_kind_low_level
		end

	set_dec_uikind is
		do
			value := dec_uikind_low_level
		end

	set_dec_ikind is
		do
			value := dec_ikind_low_level
		end

	set_dec_ulkind is
		do
			value := dec_ulkind_low_level
		end

	set_dec_lkind is
		do
			value := dec_lkind_low_level
		end

	set_dec_ullkind is
		do
			value := dec_ullkind_low_level
		end

	set_dec_llkind is
		do
			value := dec_llkind_low_level
		end

	set_uhex_kind is
		do
			value := uhex_kind_low_level
		end

feature -- Queries
	is_null_kind: BOOLEAN is
		do
			Result := (value=null_kind_low_level)
		end

	is_twine_kind: BOOLEAN is
		do
			Result := (value=twine_kind_low_level)
		end

	is_cstring_kind: BOOLEAN is
		do
			Result := (value=cstring_kind_low_level)
		end

	is_std_string_kind: BOOLEAN is
		do
			Result := (value=std_string_kind_low_level)
		end

	is_string_ref_kind: BOOLEAN is
		do
			Result := (value=string_ref_kind_low_level)
		end

	is_dec_uikind: BOOLEAN is
		do
			Result := (value=dec_uikind_low_level)
		end

	is_dec_ikind: BOOLEAN is
		do
			Result := (value=dec_ikind_low_level)
		end

	is_dec_ulkind: BOOLEAN is
		do
			Result := (value=dec_ulkind_low_level)
		end

	is_dec_lkind: BOOLEAN is
		do
			Result := (value=dec_lkind_low_level)
		end

	is_dec_ullkind: BOOLEAN is
		do
			Result := (value=dec_ullkind_low_level)
		end

	is_dec_llkind: BOOLEAN is
		do
			Result := (value=dec_llkind_low_level)
		end

	is_uhex_kind: BOOLEAN is
		do
			Result := (value=uhex_kind_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	null_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "NullKind"
 			}"
 		end

	twine_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "TwineKind"
 			}"
 		end

	cstring_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "CStringKind"
 			}"
 		end

	std_string_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "StdStringKind"
 			}"
 		end

	string_ref_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "StringRefKind"
 			}"
 		end

	dec_uikind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "DecUIKind"
 			}"
 		end

	dec_ikind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "DecIKind"
 			}"
 		end

	dec_ulkind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "DecULKind"
 			}"
 		end

	dec_lkind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "DecLKind"
 			}"
 		end

	dec_ullkind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "DecULLKind"
 			}"
 		end

	dec_llkind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "DecLLKind"
 			}"
 		end

	uhex_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "UHexKind"
 			}"
 		end


end -- class NODE_KIND_ENUM
