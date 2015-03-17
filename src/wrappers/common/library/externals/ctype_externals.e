-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class CTYPE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	-- `hidden' function __ctype_b_loc skipped.
	-- `hidden' function __ctype_tolower_loc skipped.
	-- `hidden' function __ctype_toupper_loc skipped.
	isalnum (a_c: INTEGER): INTEGER
 		-- isalnum
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isalnum"
		}"
		end

	isalnum_l (an_argument_l3366_c7: INTEGER; an_argument_l3367_c7: POINTER): INTEGER
 		-- isalnum_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isalnum_l"
		}"
		end

	isalpha (a_c: INTEGER): INTEGER
 		-- isalpha
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isalpha"
		}"
		end

	isalpha_l (an_argument_l3054_c7: INTEGER; an_argument_l3055_c7: POINTER): INTEGER
 		-- isalpha_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isalpha_l"
		}"
		end

	isascii (a_c: INTEGER): INTEGER
 		-- isascii
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isascii"
		}"
		end

	isblank (a_c: INTEGER): INTEGER
 		-- isblank
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isblank"
		}"
		end

	isblank_l (an_argument_l1038_c7: INTEGER; an_argument_l1039_c7: POINTER): INTEGER
 		-- isblank_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isblank_l"
		}"
		end

	iscntrl (a_c: INTEGER): INTEGER
 		-- iscntrl
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "iscntrl"
		}"
		end

	iscntrl_l (an_argument_l1007_c7: INTEGER; an_argument_l1008_c7: POINTER): INTEGER
 		-- iscntrl_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "iscntrl_l"
		}"
		end

	isctype (a_c: INTEGER; a_mask: INTEGER): INTEGER
 		-- isctype
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isctype"
		}"
		end

	isdigit (a_c: INTEGER): INTEGER
 		-- isdigit
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isdigit"
		}"
		end

	isdigit_l (an_argument_l726_c7: INTEGER; an_argument_l727_c7: POINTER): INTEGER
 		-- isdigit_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isdigit_l"
		}"
		end

	isgraph (a_c: INTEGER): INTEGER
 		-- isgraph
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isgraph"
		}"
		end

	isgraph_l (an_argument_l705_c7: INTEGER; an_argument_l706_c7: POINTER): INTEGER
 		-- isgraph_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isgraph_l"
		}"
		end

	islower (a_c: INTEGER): INTEGER
 		-- islower
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "islower"
		}"
		end

	islower_l (an_argument_l2084_c7: INTEGER; an_argument_l2085_c7: POINTER): INTEGER
 		-- islower_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "islower_l"
		}"
		end

	isprint (a_c: INTEGER): INTEGER
 		-- isprint
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isprint"
		}"
		end

	isprint_l (an_argument_l2255_c7: INTEGER; an_argument_l2256_c7: POINTER): INTEGER
 		-- isprint_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isprint_l"
		}"
		end

	ispunct (a_c: INTEGER): INTEGER
 		-- ispunct
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ispunct"
		}"
		end

	ispunct_l (an_argument_l2229_c7: INTEGER; an_argument_l2230_c7: POINTER): INTEGER
 		-- ispunct_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ispunct_l"
		}"
		end

	isspace (a_c: INTEGER): INTEGER
 		-- isspace
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isspace"
		}"
		end

	isspace_l (an_argument_l1497_c7: INTEGER; an_argument_l1498_c7: POINTER): INTEGER
 		-- isspace_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isspace_l"
		}"
		end

	isupper (a_c: INTEGER): INTEGER
 		-- isupper
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isupper"
		}"
		end

	isupper_l (an_argument_l2178_c7: INTEGER; an_argument_l2179_c7: POINTER): INTEGER
 		-- isupper_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isupper_l"
		}"
		end

	isxdigit (a_c: INTEGER): INTEGER
 		-- isxdigit
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isxdigit"
		}"
		end

	isxdigit_l (an_argument_l1428_c7: INTEGER; an_argument_l1429_c7: POINTER): INTEGER
 		-- isxdigit_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isxdigit_l"
		}"
		end

	toascii (a_c: INTEGER): INTEGER
 		-- toascii
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "toascii"
		}"
		end

	tolower (a_c: INTEGER): INTEGER
 		-- tolower
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tolower"
		}"
		end

	-- `hidden' function _tolower skipped.
	tolower_l (a_c: INTEGER; a_l: POINTER): INTEGER
 		-- tolower_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tolower_l"
		}"
		end

	-- `hidden' function __tolower_l skipped.
	toupper (a_c: INTEGER): INTEGER
 		-- toupper
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "toupper"
		}"
		end

	-- `hidden' function _toupper skipped.
	toupper_l (a_c: INTEGER; a_l: POINTER): INTEGER
 		-- toupper_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "toupper_l"
		}"
		end

	-- `hidden' function __toupper_l skipped.

end -- class CTYPE_EXTERNALS
