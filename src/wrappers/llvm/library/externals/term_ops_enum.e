-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class TERM_OPS_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = br_low_level)  or else
				(a_value = indirect_br_low_level)  or else
				(a_value = invoke_low_level)  or else
				(a_value = resume_low_level)  or else
				(a_value = ret_low_level)  or else
				(a_value = switch_low_level)  or else
				(a_value = term_ops_begin_low_level)  or else
				(a_value = term_ops_end_low_level)  or else
				(a_value = unreachable_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_br is
		do
			value := br_low_level
		end

	set_indirect_br is
		do
			value := indirect_br_low_level
		end

	set_invoke is
		do
			value := invoke_low_level
		end

	set_resume is
		do
			value := resume_low_level
		end

	set_ret is
		do
			value := ret_low_level
		end

	set_switch is
		do
			value := switch_low_level
		end

	set_term_ops_begin is
		do
			value := term_ops_begin_low_level
		end

	set_term_ops_end is
		do
			value := term_ops_end_low_level
		end

	set_unreachable is
		do
			value := unreachable_low_level
		end

feature {ANY} -- Queries
	is_br: BOOLEAN is
		do
			Result := (value=br_low_level)
		end

	is_indirect_br: BOOLEAN is
		do
			Result := (value=indirect_br_low_level)
		end

	is_invoke: BOOLEAN is
		do
			Result := (value=invoke_low_level)
		end

	is_resume: BOOLEAN is
		do
			Result := (value=resume_low_level)
		end

	is_ret: BOOLEAN is
		do
			Result := (value=ret_low_level)
		end

	is_switch: BOOLEAN is
		do
			Result := (value=switch_low_level)
		end

	is_term_ops_begin: BOOLEAN is
		do
			Result := (value=term_ops_begin_low_level)
		end

	is_term_ops_end: BOOLEAN is
		do
			Result := (value=term_ops_end_low_level)
		end

	is_unreachable: BOOLEAN is
		do
			Result := (value=unreachable_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	br_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Br"
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

	resume_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Resume"
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

	switch_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Switch"
 			}"
 		end

	term_ops_begin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "TermOpsBegin"
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

	unreachable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Unreachable"
 			}"
 		end


end -- class TERM_OPS_ENUM
