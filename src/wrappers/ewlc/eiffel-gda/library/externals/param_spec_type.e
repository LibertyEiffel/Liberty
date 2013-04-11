-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class PARAM_SPEC_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = param_name) or else 
				(a_value = param_descr) or else 
				(a_value = param_type) or else 
				(a_value = param_isparam) or else 
				(a_value = param_nullok))
		end


feature {ANY} -- Setters
	default_create, set_name is
		do
			value := param_name
		end

	set_descr is
		do
			value := param_descr
		end

	set_type is
		do
			value := param_type
		end

	set_isparam is
		do
			value := param_isparam
		end

	set_nullok is
		do
			value := param_nullok
		end


feature {ANY} -- Queries
	is_name: BOOLEAN is
		do
			Result := (value=param_name)
		end

	is_descr: BOOLEAN is
		do
			Result := (value=param_descr)
		end

	is_type: BOOLEAN is
		do
			Result := (value=param_type)
		end

	is_isparam: BOOLEAN is
		do
			Result := (value=param_isparam)
		end

	is_nullok: BOOLEAN is
		do
			Result := (value=param_nullok)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	param_name: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "PARAM_name"
		end

	param_descr: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "PARAM_descr"
		end

	param_type: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "PARAM_type"
		end

	param_isparam: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "PARAM_isparam"
		end

	param_nullok: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "PARAM_nullok"
		end


end

