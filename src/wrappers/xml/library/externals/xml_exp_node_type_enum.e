-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_EXP_NODE_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = empty_low_level)  or else
				(a_value = forbid_low_level)  or else
				(a_value = atom_low_level)  or else
				(a_value = seq_low_level)  or else
				(a_value = or_external_low_level)  or else
				(a_value = count_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_empty is
		do
			value := empty_low_level
		end

	set_forbid is
		do
			value := forbid_low_level
		end

	set_atom is
		do
			value := atom_low_level
		end

	set_seq is
		do
			value := seq_low_level
		end

	set_or_external is
		do
			value := or_external_low_level
		end

	set_count is
		do
			value := count_low_level
		end

feature {ANY} -- Queries
	empty: BOOLEAN is
		do
			Result := (value=empty_low_level)
		end

	forbid: BOOLEAN is
		do
			Result := (value=forbid_low_level)
		end

	atom: BOOLEAN is
		do
			Result := (value=atom_low_level)
		end

	seq: BOOLEAN is
		do
			Result := (value=seq_low_level)
		end

	or_external: BOOLEAN is
		do
			Result := (value=or_external_low_level)
		end

	count: BOOLEAN is
		do
			Result := (value=count_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_EXP_EMPTY"
 			}"
 		end

	forbid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_EXP_FORBID"
 			}"
 		end

	atom_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_EXP_ATOM"
 			}"
 		end

	seq_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_EXP_SEQ"
 			}"
 		end

	or_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_EXP_OR"
 			}"
 		end

	count_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_EXP_COUNT"
 			}"
 		end


end -- class XML_EXP_NODE_TYPE_ENUM
