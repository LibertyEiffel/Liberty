-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_DICT_DATABASE_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = gda_dict_database_xml_save_error) or else 
				(a_value = gda_dict_database_xml_load_error) or else 
				(a_value = gda_dict_database_meta_data_update) or else 
				(a_value = gda_dict_database_meta_data_update_user_stopped) or else 
				(a_value = gda_dict_database_tables_error) or else 
				(a_value = gda_dict_database_sequences_error))
		end


feature {ANY} -- Setters
	default_create, set_xml_save_error is
		do
			value := gda_dict_database_xml_save_error
		end

	set_xml_load_error is
		do
			value := gda_dict_database_xml_load_error
		end

	set_meta_data_update is
		do
			value := gda_dict_database_meta_data_update
		end

	set_meta_data_update_user_stopped is
		do
			value := gda_dict_database_meta_data_update_user_stopped
		end

	set_tables_error is
		do
			value := gda_dict_database_tables_error
		end

	set_sequences_error is
		do
			value := gda_dict_database_sequences_error
		end


feature {ANY} -- Queries
	is_xml_save_error: BOOLEAN is
		do
			Result := (value=gda_dict_database_xml_save_error)
		end

	is_xml_load_error: BOOLEAN is
		do
			Result := (value=gda_dict_database_xml_load_error)
		end

	is_meta_data_update: BOOLEAN is
		do
			Result := (value=gda_dict_database_meta_data_update)
		end

	is_meta_data_update_user_stopped: BOOLEAN is
		do
			Result := (value=gda_dict_database_meta_data_update_user_stopped)
		end

	is_tables_error: BOOLEAN is
		do
			Result := (value=gda_dict_database_tables_error)
		end

	is_sequences_error: BOOLEAN is
		do
			Result := (value=gda_dict_database_sequences_error)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_dict_database_xml_save_error: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DICT_DATABASE_XML_SAVE_ERROR"
		end

	gda_dict_database_xml_load_error: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DICT_DATABASE_XML_LOAD_ERROR"
		end

	gda_dict_database_meta_data_update: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DICT_DATABASE_META_DATA_UPDATE"
		end

	gda_dict_database_meta_data_update_user_stopped: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DICT_DATABASE_META_DATA_UPDATE_USER_STOPPED"
		end

	gda_dict_database_tables_error: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DICT_DATABASE_TABLES_ERROR"
		end

	gda_dict_database_sequences_error: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DICT_DATABASE_SEQUENCES_ERROR"
		end


end

