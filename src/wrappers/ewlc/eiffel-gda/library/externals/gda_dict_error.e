-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_DICT_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = gda_dict_meta_data_update_error) or else 
				(a_value = gda_dict_meta_data_update_user_stopped) or else 
				(a_value = gda_dict_load_file_not_exist_error) or else 
				(a_value = gda_dict_file_load_error) or else 
				(a_value = gda_dict_file_save_error) or else 
				(a_value = gda_dict_datatype_error) or else 
				(a_value = gda_dict_functions_error) or else 
				(a_value = gda_dict_aggregates_error))
		end


feature {ANY} -- Setters
	default_create, set_meta_data_update_error
		do
			value := gda_dict_meta_data_update_error
		end

	set_meta_data_update_user_stopped
		do
			value := gda_dict_meta_data_update_user_stopped
		end

	set_load_file_not_exist_error
		do
			value := gda_dict_load_file_not_exist_error
		end

	set_file_load_error
		do
			value := gda_dict_file_load_error
		end

	set_file_save_error
		do
			value := gda_dict_file_save_error
		end

	set_datatype_error
		do
			value := gda_dict_datatype_error
		end

	set_functions_error
		do
			value := gda_dict_functions_error
		end

	set_aggregates_error
		do
			value := gda_dict_aggregates_error
		end


feature {ANY} -- Queries
	is_meta_data_update_error: BOOLEAN
		do
			Result := (value=gda_dict_meta_data_update_error)
		end

	is_meta_data_update_user_stopped: BOOLEAN
		do
			Result := (value=gda_dict_meta_data_update_user_stopped)
		end

	is_load_file_not_exist_error: BOOLEAN
		do
			Result := (value=gda_dict_load_file_not_exist_error)
		end

	is_file_load_error: BOOLEAN
		do
			Result := (value=gda_dict_file_load_error)
		end

	is_file_save_error: BOOLEAN
		do
			Result := (value=gda_dict_file_save_error)
		end

	is_datatype_error: BOOLEAN
		do
			Result := (value=gda_dict_datatype_error)
		end

	is_functions_error: BOOLEAN
		do
			Result := (value=gda_dict_functions_error)
		end

	is_aggregates_error: BOOLEAN
		do
			Result := (value=gda_dict_aggregates_error)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_dict_meta_data_update_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DICT_META_DATA_UPDATE_ERROR"
		end

	gda_dict_meta_data_update_user_stopped: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DICT_META_DATA_UPDATE_USER_STOPPED"
		end

	gda_dict_load_file_not_exist_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DICT_LOAD_FILE_NOT_EXIST_ERROR"
		end

	gda_dict_file_load_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DICT_FILE_LOAD_ERROR"
		end

	gda_dict_file_save_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DICT_FILE_SAVE_ERROR"
		end

	gda_dict_datatype_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DICT_DATATYPE_ERROR"
		end

	gda_dict_functions_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DICT_FUNCTIONS_ERROR"
		end

	gda_dict_aggregates_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DICT_AGGREGATES_ERROR"
		end


end

