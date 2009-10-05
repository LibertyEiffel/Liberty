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
				(a_value = br_low_level)  or else
				(a_value = switch_low_level)  or else
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

	set_br is
		do
			value := br_low_level
		end

	set_switch is
		do
			value := switch_low_level
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
	is_term_ops_begin: BOOLEAN is
		do
			Result := (value=term_ops_begin_low_level)
		end

	is_br: BOOLEAN is
		do
			Result := (value=br_low_level)
		end

	is_switch: BOOLEAN is
		do
			Result := (value=switch_low_level)
		end

	is_invoke: BOOLEAN is
		do
			Result := (value=invoke_low_level)
		end

	is_unwind: BOOLEAN is
		do
			Result := (value=unwind_low_level)
		end

	is_unreachable: BOOLEAN is
		do
			Result := (value=unreachable_low_level)
		end

	is_term_ops_end: BOOLEAN is
		do
			Result := (value=term_ops_end_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	term_ops_begin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "TermOpsBegin"
 			}"
 		end

	br_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "Br"
 			}"
 		end

	switch_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "Switch"
 			}"
 		end

	invoke_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "Invoke"
 			}"
 		end

	unwind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "Unwind"
 			}"
 		end

	unreachable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "Unreachable"
 			}"
 		end

	term_ops_end_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "TermOpsEnd"
 			}"
 		end


end -- class TERM_OPS_ENUM
