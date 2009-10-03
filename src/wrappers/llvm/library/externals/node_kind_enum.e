-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class NODE_KIND_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = nullkind_low_level)  or else
				(a_value = twinekind_low_level)  or else
				(a_value = cstringkind_low_level)  or else
				(a_value = stdstringkind_low_level)  or else
				(a_value = stringrefkind_low_level)  or else
				(a_value = decuikind_low_level)  or else
				(a_value = decikind_low_level)  or else
				(a_value = deculkind_low_level)  or else
				(a_value = declkind_low_level)  or else
				(a_value = decullkind_low_level)  or else
				(a_value = decllkind_low_level)  or else
				(a_value = uhexkind_low_level) )
		end

feature -- Setters
	default_create,
	set_nullkind is
		do
			value := nullkind_low_level
		end

	set_twinekind is
		do
			value := twinekind_low_level
		end

	set_cstringkind is
		do
			value := cstringkind_low_level
		end

	set_stdstringkind is
		do
			value := stdstringkind_low_level
		end

	set_stringrefkind is
		do
			value := stringrefkind_low_level
		end

	set_decuikind is
		do
			value := decuikind_low_level
		end

	set_decikind is
		do
			value := decikind_low_level
		end

	set_deculkind is
		do
			value := deculkind_low_level
		end

	set_declkind is
		do
			value := declkind_low_level
		end

	set_decullkind is
		do
			value := decullkind_low_level
		end

	set_decllkind is
		do
			value := decllkind_low_level
		end

	set_uhexkind is
		do
			value := uhexkind_low_level
		end

feature -- Queries
	is_nullkind: BOOLEAN is
		do
			Result := (value=nullkind_low_level)
		end

	is_twinekind: BOOLEAN is
		do
			Result := (value=twinekind_low_level)
		end

	is_cstringkind: BOOLEAN is
		do
			Result := (value=cstringkind_low_level)
		end

	is_stdstringkind: BOOLEAN is
		do
			Result := (value=stdstringkind_low_level)
		end

	is_stringrefkind: BOOLEAN is
		do
			Result := (value=stringrefkind_low_level)
		end

	is_decuikind: BOOLEAN is
		do
			Result := (value=decuikind_low_level)
		end

	is_decikind: BOOLEAN is
		do
			Result := (value=decikind_low_level)
		end

	is_deculkind: BOOLEAN is
		do
			Result := (value=deculkind_low_level)
		end

	is_declkind: BOOLEAN is
		do
			Result := (value=declkind_low_level)
		end

	is_decullkind: BOOLEAN is
		do
			Result := (value=decullkind_low_level)
		end

	is_decllkind: BOOLEAN is
		do
			Result := (value=decllkind_low_level)
		end

	is_uhexkind: BOOLEAN is
		do
			Result := (value=uhexkind_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	nullkind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "NullKind"
 			}"
 		end

	twinekind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "TwineKind"
 			}"
 		end

	cstringkind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "CStringKind"
 			}"
 		end

	stdstringkind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "StdStringKind"
 			}"
 		end

	stringrefkind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "StringRefKind"
 			}"
 		end

	decuikind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "DecUIKind"
 			}"
 		end

	decikind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "DecIKind"
 			}"
 		end

	deculkind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "DecULKind"
 			}"
 		end

	declkind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "DecLKind"
 			}"
 		end

	decullkind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "DecULLKind"
 			}"
 		end

	decllkind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "DecLLKind"
 			}"
 		end

	uhexkind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "UHexKind"
 			}"
 		end


end -- class NODE_KIND_ENUM
