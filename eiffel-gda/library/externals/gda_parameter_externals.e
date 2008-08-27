-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_PARAMETER_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_parameter_get_bind_param (a_param: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_bind_to_param (a_param: POINTER; a_bind_to: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_has_restrict_values (a_param: POINTER; a_model: POINTER; a_col: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_restrict_values (a_param: POINTER; a_model: POINTER; a_col: INTEGER_32; an_error: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_get_not_null (a_param: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_set_not_null (a_param: POINTER; a_not_null: INTEGER_32) is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_set_exists_default_value (a_param: POINTER; a_default_value_exists: INTEGER_32) is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_get_exists_default_value (a_param: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_set_default_value (a_param: POINTER; a_value: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_get_default_value (a_param: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_is_valid (a_param: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_declare_invalid (a_param: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_set_value_str (a_param: POINTER; a_value: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_set_value (a_param: POINTER; a_value: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_get_value_str (a_param: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_get_value (a_param: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_new_boolean (a_name: POINTER; a_value: INTEGER_32): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_new_string (a_name: POINTER; a_str: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_get_g_type (a_param: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_new_copy (an_orig: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_new (a_type: INTEGER_32): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_get_type: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_error_quark: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

end
