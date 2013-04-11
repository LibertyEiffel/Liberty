-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_DATA_MODEL_ITER_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = gda_data_model_iter_what_error))
		end


feature {ANY} -- Setters
	default_create, set_gda_data_model_iter_what_error is
		do
			value := gda_data_model_iter_what_error
		end


feature {ANY} -- Queries
	is_gda_data_model_iter_what_error: BOOLEAN is
		do
			Result := (value=gda_data_model_iter_what_error)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_data_model_iter_what_error: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_MODEL_ITER_WHAT_ERROR"
		end


end

