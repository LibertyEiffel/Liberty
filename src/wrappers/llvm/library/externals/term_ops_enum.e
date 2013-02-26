-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class TERM_OPS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = term_ops_begin_low_level)  or else
				(a_value = ret_low_level)  or else
				(a_value = br_low_level)  or else
				(a_value = switch_low_level)  or else
				(a_value = indirect_br_low_level)  or else
				(a_value = invoke_low_level)  or else
				(a_value = unwind_low_level)  or else
				(a_value = unreachable_low_level)  or else
				(a_value = term_ops_end_low_level) )
		end

feature -- Setters
	default_create,
	set_term_ops_begin is
		do
			value := term_ops_begin_low_level
		end

	set_ret is
		do
			value := ret_low_level
		end

	set_br is
		do
			value := br_low_level
		end

	set_switch is
		do
			value := switch_low_level
		end

	set_indirect_br is
		do
			value := indirect_br_low_level
		end

	set_invoke is
		do
			value := invoke_low_level
		end

	set_unwind is
		do
			value := unwind_low_level
		end

	set_unreachable is
		do
			value := unreachable_low_level
		end

	set_term_ops_end is
		do
			value := term_ops_end_low_level
		end

feature -- Queries
	term_ops_begin: BOOLEAN is
		do
			Result := (value=term_ops_begin_low_level)
		end

	ret: BOOLEAN is
		do
			Result := (value=ret_low_level)
		end

	br: BOOLEAN is
		do
			Result := (value=br_low_level)
		end

	switch: BOOLEAN is
		do
			Result := (value=switch_low_level)
		end

	indirect_br: BOOLEAN is
		do
			Result := (value=indirect_br_low_level)
		end

	invoke: BOOLEAN is
		do
			Result := (value=invoke_low_level)
		end

	unwind: BOOLEAN is
		do
			Result := (value=unwind_low_level)
		end

	unreachable: BOOLEAN is
		do
			Result := (value=unreachable_low_level)
		end

	term_ops_end: BOOLEAN is
		do
			Result := (value=term_ops_end_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	term_ops_begin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "TermOpsBegin"
 			}"
 		end

	ret_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Ret"
 			}"
 		end

	br_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Br"
 			}"
 		end

	switch_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Switch"
 			}"
 		end

	indirect_br_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "IndirectBr"
 			}"
 		end

	invoke_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Invoke"
 			}"
 		end

	unwind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Unwind"
 			}"
 		end

	unreachable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Unreachable"
 			}"
 		end

	term_ops_end_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "TermOpsEnd"
 			}"
 		end


end -- class TERM_OPS_ENUM
