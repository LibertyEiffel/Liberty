-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_DATA_MODEL_IOFORMAT
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = gda_data_model_io_data_array_xml) or else 
				(a_value = gda_data_model_io_text_separated))
		end


feature {ANY} -- Setters
	default_create, set_gda_data_model_io_data_array_xml is
		do
			value := gda_data_model_io_data_array_xml
		end

	set_gda_data_model_io_text_separated is
		do
			value := gda_data_model_io_text_separated
		end


feature {ANY} -- Queries
	is_gda_data_model_io_data_array_xml: BOOLEAN is
		do
			Result := (value=gda_data_model_io_data_array_xml)
		end

	is_gda_data_model_io_text_separated: BOOLEAN is
		do
			Result := (value=gda_data_model_io_text_separated)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_data_model_io_data_array_xml: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_MODEL_IO_DATA_ARRAY_XML"
		end

	gda_data_model_io_text_separated: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_MODEL_IO_TEXT_SEPARATED"
		end


end

