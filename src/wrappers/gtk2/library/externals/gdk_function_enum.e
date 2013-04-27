-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_FUNCTION_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_and_low_level)  or else
				(a_value = gdk_and_invert_low_level)  or else
				(a_value = gdk_and_reverse_low_level)  or else
				(a_value = gdk_clear_low_level)  or else
				(a_value = gdk_copy_low_level)  or else
				(a_value = gdk_copy_invert_low_level)  or else
				(a_value = gdk_equiv_low_level)  or else
				(a_value = gdk_invert_low_level)  or else
				(a_value = gdk_nand_low_level)  or else
				(a_value = gdk_noop_low_level)  or else
				(a_value = gdk_nor_low_level)  or else
				(a_value = gdk_or_low_level)  or else
				(a_value = gdk_or_invert_low_level)  or else
				(a_value = gdk_or_reverse_low_level)  or else
				(a_value = gdk_set_low_level)  or else
				(a_value = gdk_xor_low_level) )
		end

feature -- Setters
	default_create,
	set_gdk_and is
		do
			value := gdk_and_low_level
		end

	set_gdk_and_invert is
		do
			value := gdk_and_invert_low_level
		end

	set_gdk_and_reverse is
		do
			value := gdk_and_reverse_low_level
		end

	set_gdk_clear is
		do
			value := gdk_clear_low_level
		end

	set_gdk_copy is
		do
			value := gdk_copy_low_level
		end

	set_gdk_copy_invert is
		do
			value := gdk_copy_invert_low_level
		end

	set_gdk_equiv is
		do
			value := gdk_equiv_low_level
		end

	set_gdk_invert is
		do
			value := gdk_invert_low_level
		end

	set_gdk_nand is
		do
			value := gdk_nand_low_level
		end

	set_gdk_noop is
		do
			value := gdk_noop_low_level
		end

	set_gdk_nor is
		do
			value := gdk_nor_low_level
		end

	set_gdk_or is
		do
			value := gdk_or_low_level
		end

	set_gdk_or_invert is
		do
			value := gdk_or_invert_low_level
		end

	set_gdk_or_reverse is
		do
			value := gdk_or_reverse_low_level
		end

	set_gdk_set is
		do
			value := gdk_set_low_level
		end

	set_gdk_xor is
		do
			value := gdk_xor_low_level
		end

feature -- Queries
	is_gdk_and: BOOLEAN is
		do
			Result := (value=gdk_and_low_level)
		end

	is_gdk_and_invert: BOOLEAN is
		do
			Result := (value=gdk_and_invert_low_level)
		end

	is_gdk_and_reverse: BOOLEAN is
		do
			Result := (value=gdk_and_reverse_low_level)
		end

	is_gdk_clear: BOOLEAN is
		do
			Result := (value=gdk_clear_low_level)
		end

	is_gdk_copy: BOOLEAN is
		do
			Result := (value=gdk_copy_low_level)
		end

	is_gdk_copy_invert: BOOLEAN is
		do
			Result := (value=gdk_copy_invert_low_level)
		end

	is_gdk_equiv: BOOLEAN is
		do
			Result := (value=gdk_equiv_low_level)
		end

	is_gdk_invert: BOOLEAN is
		do
			Result := (value=gdk_invert_low_level)
		end

	is_gdk_nand: BOOLEAN is
		do
			Result := (value=gdk_nand_low_level)
		end

	is_gdk_noop: BOOLEAN is
		do
			Result := (value=gdk_noop_low_level)
		end

	is_gdk_nor: BOOLEAN is
		do
			Result := (value=gdk_nor_low_level)
		end

	is_gdk_or: BOOLEAN is
		do
			Result := (value=gdk_or_low_level)
		end

	is_gdk_or_invert: BOOLEAN is
		do
			Result := (value=gdk_or_invert_low_level)
		end

	is_gdk_or_reverse: BOOLEAN is
		do
			Result := (value=gdk_or_reverse_low_level)
		end

	is_gdk_set: BOOLEAN is
		do
			Result := (value=gdk_set_low_level)
		end

	is_gdk_xor: BOOLEAN is
		do
			Result := (value=gdk_xor_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_and_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_AND"
 			}"
 		end

	gdk_and_invert_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_AND_INVERT"
 			}"
 		end

	gdk_and_reverse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_AND_REVERSE"
 			}"
 		end

	gdk_clear_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CLEAR"
 			}"
 		end

	gdk_copy_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_COPY"
 			}"
 		end

	gdk_copy_invert_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_COPY_INVERT"
 			}"
 		end

	gdk_equiv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_EQUIV"
 			}"
 		end

	gdk_invert_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_INVERT"
 			}"
 		end

	gdk_nand_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_NAND"
 			}"
 		end

	gdk_noop_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_NOOP"
 			}"
 		end

	gdk_nor_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_NOR"
 			}"
 		end

	gdk_or_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_OR"
 			}"
 		end

	gdk_or_invert_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_OR_INVERT"
 			}"
 		end

	gdk_or_reverse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_OR_REVERSE"
 			}"
 		end

	gdk_set_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SET"
 			}"
 		end

	gdk_xor_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_XOR"
 			}"
 		end


end -- class GDK_FUNCTION_ENUM
