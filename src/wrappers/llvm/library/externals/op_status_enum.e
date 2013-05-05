-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class OP_STATUS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = op_div_by_zero_low_level)  or else
				(a_value = op_inexact_low_level)  or else
				(a_value = op_invalid_op_low_level)  or else
				(a_value = op_ok_low_level)  or else
				(a_value = op_overflow_low_level)  or else
				(a_value = op_underflow_low_level) )
		end

feature -- Setters
	default_create,
	set_op_div_by_zero is
		do
			value := op_div_by_zero_low_level
		end

	set_op_inexact is
		do
			value := op_inexact_low_level
		end

	set_op_invalid_op is
		do
			value := op_invalid_op_low_level
		end

	set_op_ok is
		do
			value := op_ok_low_level
		end

	set_op_overflow is
		do
			value := op_overflow_low_level
		end

	set_op_underflow is
		do
			value := op_underflow_low_level
		end

feature -- Queries
	is_op_div_by_zero: BOOLEAN is
		do
			Result := (value=op_div_by_zero_low_level)
		end

	is_op_inexact: BOOLEAN is
		do
			Result := (value=op_inexact_low_level)
		end

	is_op_invalid_op: BOOLEAN is
		do
			Result := (value=op_invalid_op_low_level)
		end

	is_op_ok: BOOLEAN is
		do
			Result := (value=op_ok_low_level)
		end

	is_op_overflow: BOOLEAN is
		do
			Result := (value=op_overflow_low_level)
		end

	is_op_underflow: BOOLEAN is
		do
			Result := (value=op_underflow_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	op_div_by_zero_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "opDivByZero"
 			}"
 		end

	op_inexact_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "opInexact"
 			}"
 		end

	op_invalid_op_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "opInvalidOp"
 			}"
 		end

	op_ok_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "opOK"
 			}"
 		end

	op_overflow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "opOverflow"
 			}"
 		end

	op_underflow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "opUnderflow"
 			}"
 		end


end -- class OP_STATUS_ENUM
