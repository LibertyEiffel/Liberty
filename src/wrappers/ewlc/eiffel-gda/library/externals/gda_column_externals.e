-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_COLUMN_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_column_set_default_value (a_column: POINTER; a_default_value: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_get_default_value (a_column: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_set_position (a_column: POINTER; a_position: INTEGER_32)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_get_position (a_column: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_set_auto_increment (a_column: POINTER; an_is_auto: INTEGER_32)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_get_auto_increment (a_column: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_set_references (a_column: POINTER; a_ref: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_get_references (a_column: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_set_unique_key (a_column: POINTER; an_uk: INTEGER_32)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_get_unique_key (a_column: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_set_primary_key (a_column: POINTER; a_pk: INTEGER_32)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_get_primary_key (a_column: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_set_allow_null (a_column: POINTER; an_allow: INTEGER_32)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_get_allow_null (a_column: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_set_g_type (a_column: POINTER; a_type: INTEGER_32)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_get_g_type (a_column: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_set_dbms_type (a_column: POINTER; a_dbms_type: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_get_dbms_type (a_column: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_set_scale (a_column: POINTER; a_scale: INTEGER_32)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_get_scale (a_column: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_set_caption (a_column: POINTER; a_caption: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_get_caption (a_column: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_set_table (a_column: POINTER; a_table: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_get_table (a_column: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_set_name (a_column: POINTER; a_name: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_get_name (a_column: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_set_defined_size (a_column: POINTER; a_size: INTEGER_32)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_get_defined_size (a_column: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_set_title (a_column: POINTER; a_title: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_get_title (a_column: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_copy (a_column: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_new: POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_column_get_type: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

end
