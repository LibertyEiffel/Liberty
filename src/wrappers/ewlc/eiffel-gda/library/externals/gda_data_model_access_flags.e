-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_DATA_MODEL_ACCESS_FLAGS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = gda_data_model_access_random) or else 
				(a_value = gda_data_model_access_cursor_forward) or else 
				(a_value = gda_data_model_access_cursor_backward) or else 
				(a_value = gda_data_model_access_cursor) or else 
				(a_value = gda_data_model_access_insert) or else 
				(a_value = gda_data_model_access_update) or else 
				(a_value = gda_data_model_access_delete) or else 
				(a_value = gda_data_model_access_write))
		end


feature {ANY} -- Setters
	default_create, set_random
		do
			value := gda_data_model_access_random
		end

	set_cursor_forward
		do
			value := gda_data_model_access_cursor_forward
		end

	set_cursor_backward
		do
			value := gda_data_model_access_cursor_backward
		end

	set_cursor
		do
			value := gda_data_model_access_cursor
		end

	set_insert_external
		do
			value := gda_data_model_access_insert
		end

	set_update
		do
			value := gda_data_model_access_update
		end

	set_delete
		do
			value := gda_data_model_access_delete
		end

	set_write
		do
			value := gda_data_model_access_write
		end


feature {ANY} -- Queries
	is_random: BOOLEAN
		do
			Result := (value=gda_data_model_access_random)
		end

	is_cursor_forward: BOOLEAN
		do
			Result := (value=gda_data_model_access_cursor_forward)
		end

	is_cursor_backward: BOOLEAN
		do
			Result := (value=gda_data_model_access_cursor_backward)
		end

	is_cursor: BOOLEAN
		do
			Result := (value=gda_data_model_access_cursor)
		end

	is_insert_external: BOOLEAN
		do
			Result := (value=gda_data_model_access_insert)
		end

	is_update: BOOLEAN
		do
			Result := (value=gda_data_model_access_update)
		end

	is_delete: BOOLEAN
		do
			Result := (value=gda_data_model_access_delete)
		end

	is_write: BOOLEAN
		do
			Result := (value=gda_data_model_access_write)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_data_model_access_random: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_MODEL_ACCESS_RANDOM"
		end

	gda_data_model_access_cursor_forward: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_MODEL_ACCESS_CURSOR_FORWARD"
		end

	gda_data_model_access_cursor_backward: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_MODEL_ACCESS_CURSOR_BACKWARD"
		end

	gda_data_model_access_cursor: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_MODEL_ACCESS_CURSOR"
		end

	gda_data_model_access_insert: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_MODEL_ACCESS_INSERT"
		end

	gda_data_model_access_update: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_MODEL_ACCESS_UPDATE"
		end

	gda_data_model_access_delete: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_MODEL_ACCESS_DELETE"
		end

	gda_data_model_access_write: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_MODEL_ACCESS_WRITE"
		end


end

