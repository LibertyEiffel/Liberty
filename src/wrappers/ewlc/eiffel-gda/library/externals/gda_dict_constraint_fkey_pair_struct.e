-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_DICT_CONSTRAINT_FKEY_PAIR_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters
	low_level_set_fkey (a_structure: POINTER; a_value: POINTER) is
		external "C struct GdaDictConstraintFkeyPair set fkey use <libgda/libgda.h>"
		end

	low_level_set_ref_pkey (a_structure: POINTER; a_value: POINTER) is
		external "C struct GdaDictConstraintFkeyPair set ref_pkey use <libgda/libgda.h>"
		end

	low_level_set_ref_pkey_repl (a_structure: POINTER; a_value: POINTER) is
		external "C struct GdaDictConstraintFkeyPair set ref_pkey_repl use <libgda/libgda.h>"
		end

feature {} -- Low-level queries
	get_fkey (a_structure: POINTER): POINTER is
		external "C struct GdaDictConstraintFkeyPair get fkey use <libgda/libgda.h>"
		end

	get_ref_pkey (a_structure: POINTER): POINTER is
		external "C struct GdaDictConstraintFkeyPair get ref_pkey use <libgda/libgda.h>"
		end

	get_ref_pkey_repl (a_structure: POINTER): POINTER is
		external "C struct GdaDictConstraintFkeyPair get ref_pkey_repl use <libgda/libgda.h>"
		end

end
