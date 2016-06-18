-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_DATA_MODEL_IMPORT_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_data_model_import_clean_errors (a_model: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_import_get_errors (a_model: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_import_new_xml_node (a_node: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_import_new_mem (a_data: POINTER; a_random_access: INTEGER_32; an_options: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_import_new_file (a_filename: POINTER; a_random_access: INTEGER_32; an_options: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_import_get_type: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

end
