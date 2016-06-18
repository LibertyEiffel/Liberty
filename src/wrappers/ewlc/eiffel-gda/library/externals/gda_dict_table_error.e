-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_DICT_TABLE_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = gda_dict_table_xml_load_error) or else 
				(a_value = gda_dict_table_meta_data_update) or else 
				(a_value = gda_dict_fields_error))
		end


feature {ANY} -- Setters
	default_create, set_gda_dict_table_xml_load_error
		do
			value := gda_dict_table_xml_load_error
		end

	set_gda_dict_table_meta_data_update
		do
			value := gda_dict_table_meta_data_update
		end

	set_gda_dict_fields_error
		do
			value := gda_dict_fields_error
		end


feature {ANY} -- Queries
	is_gda_dict_table_xml_load_error: BOOLEAN
		do
			Result := (value=gda_dict_table_xml_load_error)
		end

	is_gda_dict_table_meta_data_update: BOOLEAN
		do
			Result := (value=gda_dict_table_meta_data_update)
		end

	is_gda_dict_fields_error: BOOLEAN
		do
			Result := (value=gda_dict_fields_error)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_dict_table_xml_load_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DICT_TABLE_XML_LOAD_ERROR"
		end

	gda_dict_table_meta_data_update: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DICT_TABLE_META_DATA_UPDATE"
		end

	gda_dict_fields_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DICT_FIELDS_ERROR"
		end


end

