indexing
	description: "External calls for GDA_PARAMETER"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_PARAMETER_EXTERNALS

insert
	ANY
		undefine
			copy, is_equal
		end
	
feature {} -- External calls

	gda_parameter_new (a_type: INTEGER): POINTER is -- GdaParameter*
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_new_copy (a_parameter: POINTER): POINTER is -- GdaParameter*
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_new_string (a_name, a_string: POINTER): POINTER is -- GdaParameter*
		external "C use <libgda/libgda.h>"
		end
	
	gda_parameter_new_boolean (a_name: POINTER; a_bool: INTEGER): POINTER is -- GdaParameter*
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_get_gda_type (a_parameter: POINTER): INTEGER is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_declare_param_user (a_parameter, a_user: POINTER) is
		external "C use <libgda/libgda.h>"
		end
	
	gda_parameter_get_param_users (a_parameter: POINTER): POINTER is -- GSList*
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_get_value (a_parameter: POINTER): POINTER is -- const GValue*
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_set_value (a_parameter, a_const_gvalue: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_set_value_str (a_parameter, a_str_value: POINTER): INTEGER is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_declare_invalid (a_parameter: POINTER) is
		external "C use <libgda/libgda.h>"
		end
	
	gda_parameter_is_valid (a_parameter: POINTER): INTEGER is
		external "C use <libgda/libgda.h>"
		end
	
	gda_parameter_get_default_value (a_parameter: POINTER): POINTER is --  const GValue*
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_set_default_value (a_parameter, a_gvalue: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_get_exists_default_value (a_parameter: POINTER): INTEGER is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_set_exists_default_value (a_parameter: POINTER; does_default_value_exists: INTEGER) is
		external "C use <libgda/libgda.h>"
		end
	
	gda_parameter_set_not_null (a_parameter: POINTER; not_null_bool: INTEGER) is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_get_not_null (a_parameter: POINTER): INTEGER is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_restrict_values (a_parameter, a_data_model: POINTER; a_col: INTEGER; an_error_handle: POINTER): INTEGER is
		external "C use <libgda/libgda.h>"
		end
	
	gda_parameter_has_restrict_values (a_parameter, a_model_ref, a_col_ptr: POINTER): INTEGER is
		external "C use <libgda/libgda.h>"
		end
	
	gda_parameter_replace_param_users (a_parameter, hashtable_replacements: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_bind_to_param (a_parameter, bind_to_param: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_get_bind_param (a_parameter: POINTER): POINTER is -- GdaParameter*
		external "C use <libgda/libgda.h>"
		end

feature -- size

	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaParameter)"
		end
end
