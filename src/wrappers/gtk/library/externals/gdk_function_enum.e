-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_FUNCTION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = copy_external_low_level)  or else
				(a_value = invert_low_level)  or else
				(a_value = xor_low_level)  or else
				(a_value = clear_low_level)  or else
				(a_value = and_low_level)  or else
				(a_value = and_reverse_low_level)  or else
				(a_value = and_invert_low_level)  or else
				(a_value = noop_low_level)  or else
				(a_value = or_low_level)  or else
				(a_value = equiv_low_level)  or else
				(a_value = or_reverse_low_level)  or else
				(a_value = copy_invert_low_level)  or else
				(a_value = or_invert_low_level)  or else
				(a_value = nand_low_level)  or else
				(a_value = nor_low_level)  or else
				(a_value = set_low_level) )
		end

feature -- Setters
	default_create,
	set_copy_external is
		do
			value := copy_external_low_level
		end

	set_invert is
		do
			value := invert_low_level
		end

	set_xor is
		do
			value := xor_low_level
		end

	set_clear is
		do
			value := clear_low_level
		end

	set_and is
		do
			value := and_low_level
		end

	set_and_reverse is
		do
			value := and_reverse_low_level
		end

	set_and_invert is
		do
			value := and_invert_low_level
		end

	set_noop is
		do
			value := noop_low_level
		end

	set_or is
		do
			value := or_low_level
		end

	set_equiv is
		do
			value := equiv_low_level
		end

	set_or_reverse is
		do
			value := or_reverse_low_level
		end

	set_copy_invert is
		do
			value := copy_invert_low_level
		end

	set_or_invert is
		do
			value := or_invert_low_level
		end

	set_nand is
		do
			value := nand_low_level
		end

	set_nor is
		do
			value := nor_low_level
		end

	set_set is
		do
			value := set_low_level
		end

feature -- Queries
	is_copy_external: BOOLEAN is
		do
			Result := (value=copy_external_low_level)
		end

	is_invert: BOOLEAN is
		do
			Result := (value=invert_low_level)
		end

	is_xor: BOOLEAN is
		do
			Result := (value=xor_low_level)
		end

	is_clear: BOOLEAN is
		do
			Result := (value=clear_low_level)
		end

	is_and: BOOLEAN is
		do
			Result := (value=and_low_level)
		end

	is_and_reverse: BOOLEAN is
		do
			Result := (value=and_reverse_low_level)
		end

	is_and_invert: BOOLEAN is
		do
			Result := (value=and_invert_low_level)
		end

	is_noop: BOOLEAN is
		do
			Result := (value=noop_low_level)
		end

	is_or: BOOLEAN is
		do
			Result := (value=or_low_level)
		end

	is_equiv: BOOLEAN is
		do
			Result := (value=equiv_low_level)
		end

	is_or_reverse: BOOLEAN is
		do
			Result := (value=or_reverse_low_level)
		end

	is_copy_invert: BOOLEAN is
		do
			Result := (value=copy_invert_low_level)
		end

	is_or_invert: BOOLEAN is
		do
			Result := (value=or_invert_low_level)
		end

	is_nand: BOOLEAN is
		do
			Result := (value=nand_low_level)
		end

	is_nor: BOOLEAN is
		do
			Result := (value=nor_low_level)
		end

	is_set: BOOLEAN is
		do
			Result := (value=set_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	copy_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_COPY"
 			}"
 		end

	invert_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_INVERT"
 			}"
 		end

	xor_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_XOR"
 			}"
 		end

	clear_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CLEAR"
 			}"
 		end

	and_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_AND"
 			}"
 		end

	and_reverse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_AND_REVERSE"
 			}"
 		end

	and_invert_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_AND_INVERT"
 			}"
 		end

	noop_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_NOOP"
 			}"
 		end

	or_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_OR"
 			}"
 		end

	equiv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_EQUIV"
 			}"
 		end

	or_reverse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_OR_REVERSE"
 			}"
 		end

	copy_invert_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_COPY_INVERT"
 			}"
 		end

	or_invert_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_OR_INVERT"
 			}"
 		end

	nand_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_NAND"
 			}"
 		end

	nor_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_NOR"
 			}"
 		end

	set_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SET"
 			}"
 		end


end -- class GDK_FUNCTION_ENUM
