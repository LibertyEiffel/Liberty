-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_COLUMN_INDEX_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_column_index_set_references (a_dmcia: POINTER; a_ref: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_column_index_get_references (a_dmcia: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_column_index_set_sorting (a_dmcia: POINTER; a_sorting: INTEGER_32)
		external "C use <libgda/libgda.h>"
		end

	gda_column_index_get_sorting (a_dmcia: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_column_index_set_defined_size (a_dmcia: POINTER; a_size: INTEGER_32)
		external "C use <libgda/libgda.h>"
		end

	gda_column_index_get_defined_size (a_dmcia: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_column_index_set_column_name (a_dmcia: POINTER; a_column_name: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_column_index_get_column_name (a_dmcia: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_column_index_equal (a_lhs: POINTER; a_rhs: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_column_index_copy (a_dmcia: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_column_index_new: POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_column_index_get_type: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

end
