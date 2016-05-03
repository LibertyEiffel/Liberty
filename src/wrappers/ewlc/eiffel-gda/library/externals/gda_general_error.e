-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_GENERAL_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = gda_general_object_name_error) or else 
				(a_value = gda_general_incorrect_value_error) or else 
				(a_value = gda_general_operation_error))
		end


feature {ANY} -- Setters
	default_create, set_gda_general_object_name_error is
		do
			value := gda_general_object_name_error
		end

	set_gda_general_incorrect_value_error is
		do
			value := gda_general_incorrect_value_error
		end

	set_gda_general_operation_error is
		do
			value := gda_general_operation_error
		end


feature {ANY} -- Queries
	is_gda_general_object_name_error: BOOLEAN is
		do
			Result := (value=gda_general_object_name_error)
		end

	is_gda_general_incorrect_value_error: BOOLEAN is
		do
			Result := (value=gda_general_incorrect_value_error)
		end

	is_gda_general_operation_error: BOOLEAN is
		do
			Result := (value=gda_general_operation_error)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_general_object_name_error: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_GENERAL_OBJECT_NAME_ERROR"
		end

	gda_general_incorrect_value_error: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_GENERAL_INCORRECT_VALUE_ERROR"
		end

	gda_general_operation_error: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_GENERAL_OPERATION_ERROR"
		end


end

