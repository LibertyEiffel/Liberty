-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class GQSORT_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_qsort_with_data (a_pbase: POINTER; a_total_elems: INTEGER_32; a_size: NATURAL_32; a_compare_func: POINTER; an_user_data: POINTER) is
 		-- g_qsort_with_data
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_qsort_with_data"
		}"
		end

end
