-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_QUERY_CONDITION_OPERATOR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = gda_query_condition_op_left) or else 
				(a_value = gda_query_condition_op_right) or else 
				(a_value = gda_query_condition_op_right2))
		end


feature {ANY} -- Setters
	default_create, set_gda_query_condition_op_left is
		do
			value := gda_query_condition_op_left
		end

	set_gda_query_condition_op_right is
		do
			value := gda_query_condition_op_right
		end

	set_gda_query_condition_op_right2 is
		do
			value := gda_query_condition_op_right2
		end


feature {ANY} -- Queries
	is_gda_query_condition_op_left: BOOLEAN is
		do
			Result := (value=gda_query_condition_op_left)
		end

	is_gda_query_condition_op_right: BOOLEAN is
		do
			Result := (value=gda_query_condition_op_right)
		end

	is_gda_query_condition_op_right2: BOOLEAN is
		do
			Result := (value=gda_query_condition_op_right2)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_query_condition_op_left: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CONDITION_OP_LEFT"
		end

	gda_query_condition_op_right: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CONDITION_OP_RIGHT"
		end

	gda_query_condition_op_right2: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_CONDITION_OP_RIGHT2"
		end


end

