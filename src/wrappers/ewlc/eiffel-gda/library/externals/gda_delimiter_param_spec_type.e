-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_DELIMITER_PARAM_SPEC_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = gda_delimiter_param_name) or else 
				(a_value = gda_delimiter_param_descr) or else 
				(a_value = gda_delimiter_param_type) or else 
				(a_value = gda_delimiter_param_isparam) or else 
				(a_value = gda_delimiter_param_nullok) or else 
				(a_value = gda_delimiter_param_default))
		end


feature {ANY} -- Setters
	default_create, set_name is
		do
			value := gda_delimiter_param_name
		end

	set_descr is
		do
			value := gda_delimiter_param_descr
		end

	set_type is
		do
			value := gda_delimiter_param_type
		end

	set_isparam is
		do
			value := gda_delimiter_param_isparam
		end

	set_nullok is
		do
			value := gda_delimiter_param_nullok
		end

	set_default_external is
		do
			value := gda_delimiter_param_default
		end


feature {ANY} -- Queries
	is_name: BOOLEAN is
		do
			Result := (value=gda_delimiter_param_name)
		end

	is_descr: BOOLEAN is
		do
			Result := (value=gda_delimiter_param_descr)
		end

	is_type: BOOLEAN is
		do
			Result := (value=gda_delimiter_param_type)
		end

	is_isparam: BOOLEAN is
		do
			Result := (value=gda_delimiter_param_isparam)
		end

	is_nullok: BOOLEAN is
		do
			Result := (value=gda_delimiter_param_nullok)
		end

	is_default_external: BOOLEAN is
		do
			Result := (value=gda_delimiter_param_default)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_delimiter_param_name: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DELIMITER_PARAM_NAME"
		end

	gda_delimiter_param_descr: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DELIMITER_PARAM_DESCR"
		end

	gda_delimiter_param_type: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DELIMITER_PARAM_TYPE"
		end

	gda_delimiter_param_isparam: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DELIMITER_PARAM_ISPARAM"
		end

	gda_delimiter_param_nullok: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DELIMITER_PARAM_NULLOK"
		end

	gda_delimiter_param_default: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DELIMITER_PARAM_DEFAULT"
		end


end

