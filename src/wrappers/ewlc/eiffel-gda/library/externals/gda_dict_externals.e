-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_DICT_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_dict_get_object_by_xml_id (a_dict: POINTER; a_type: INTEGER_32; a_xml_id: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_get_object_by_name (a_dict: POINTER; a_type: INTEGER_32; a_name: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_get_objects (a_dict: POINTER; a_type: INTEGER_32): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_object_is_assumed (a_dict: POINTER; an_object: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_dict_unassume_object (a_dict: POINTER; an_object: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_dict_assume_object_as (a_dict: POINTER; an_object: POINTER; an_as_type: INTEGER_32)
		external "C use <libgda/libgda.h>"
		end

	gda_dict_assume_object (a_dict: POINTER; an_object: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_dict_declare_object_as (a_dict: POINTER; an_object: POINTER; an_as_type: INTEGER_32)
		external "C use <libgda/libgda.h>"
		end

	gda_dict_declare_object (a_dict: POINTER; an_object: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_dict_get_default_handler (a_dict: POINTER; a_for_type: INTEGER_32): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_get_handler (a_dict: POINTER; a_for_type: INTEGER_32): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_save_xml_file (a_dict: POINTER; a_xmlfile: POINTER; an_error: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_dict_load_xml_file (a_dict: POINTER; a_xmlfile: POINTER; an_error: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_dict_save (a_dict: POINTER; an_error: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_dict_load (a_dict: POINTER; an_error: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_dict_get_xml_filename (a_dict: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_set_xml_filename (a_dict: POINTER; a_xmlfile: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_dict_compute_xml_filename (a_dict: POINTER; a_datasource: POINTER; an_app_id: POINTER; an_error: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_stop_update_dbms_meta_data (a_dict: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_dict_update_dbms_meta_data (a_dict: POINTER; a_limit_to_type: INTEGER_32; a_limit_obj_name: POINTER; an_error: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_dict_get_object_by_string_id (a_dict: POINTER; a_strid: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_declare_object_string_id_change (a_dict: POINTER; an_obj: POINTER; an_oldid: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_dict_get_database (a_dict: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_get_connection (a_dict: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_set_connection (a_dict: POINTER; a_cnc: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_dict_extend_with_functions (a_dict: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_dict_new: POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_get_type: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_dict_error_quark: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

end
