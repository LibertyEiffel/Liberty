-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class SQL_FIELD_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = sql_name) or else 
				(a_value = sql_equation) or else 
				(a_value = sql_inlineselect) or else 
				(a_value = sql_function))
		end


feature {ANY} -- Setters
	default_create, set_name is
		do
			value := sql_name
		end

	set_equation is
		do
			value := sql_equation
		end

	set_inlineselect is
		do
			value := sql_inlineselect
		end

	set_function is
		do
			value := sql_function
		end


feature {ANY} -- Queries
	is_name: BOOLEAN is
		do
			Result := (value=sql_name)
		end

	is_equation: BOOLEAN is
		do
			Result := (value=sql_equation)
		end

	is_inlineselect: BOOLEAN is
		do
			Result := (value=sql_inlineselect)
		end

	is_function: BOOLEAN is
		do
			Result := (value=sql_function)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	sql_name: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "SQL_name"
		end

	sql_equation: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "SQL_equation"
		end

	sql_inlineselect: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "SQL_inlineselect"
		end

	sql_function: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "SQL_function"
		end


end

