-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_DATA_MODEL_HINT
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = gda_data_model_hint_start_batch_update) or else 
				(a_value = gda_data_model_hint_end_batch_update) or else 
				(a_value = gda_data_model_hint_refresh))
		end


feature {ANY} -- Setters
	default_create, set_gda_data_model_hint_start_batch_update
		do
			value := gda_data_model_hint_start_batch_update
		end

	set_gda_data_model_hint_end_batch_update
		do
			value := gda_data_model_hint_end_batch_update
		end

	set_gda_data_model_hint_refresh
		do
			value := gda_data_model_hint_refresh
		end


feature {ANY} -- Queries
	is_gda_data_model_hint_start_batch_update: BOOLEAN
		do
			Result := (value=gda_data_model_hint_start_batch_update)
		end

	is_gda_data_model_hint_end_batch_update: BOOLEAN
		do
			Result := (value=gda_data_model_hint_end_batch_update)
		end

	is_gda_data_model_hint_refresh: BOOLEAN
		do
			Result := (value=gda_data_model_hint_refresh)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_data_model_hint_start_batch_update: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_MODEL_HINT_START_BATCH_UPDATE"
		end

	gda_data_model_hint_end_batch_update: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_MODEL_HINT_END_BATCH_UPDATE"
		end

	gda_data_model_hint_refresh: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_MODEL_HINT_REFRESH"
		end


end

