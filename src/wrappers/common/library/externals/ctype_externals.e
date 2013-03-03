-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class CTYPE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	-- `hidden' function __ctype_b_loc skipped.
	-- `hidden' function __ctype_tolower_loc skipped.
	-- `hidden' function __ctype_toupper_loc skipped.
	isalnum (a_c: INTEGER_32): INTEGER_32 is
 		-- isalnum
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isalnum"
		}"
		end

	isalnum_l (an_argument_l3345_c7: INTEGER_32; an_argument_l3346_c7: POINTER): INTEGER_32 is
 		-- isalnum_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isalnum_l"
		}"
		end

	isalpha (a_c: INTEGER_32): INTEGER_32 is
 		-- isalpha
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isalpha"
		}"
		end

	isalpha_l (an_argument_l3037_c7: INTEGER_32; an_argument_l3038_c7: POINTER): INTEGER_32 is
 		-- isalpha_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isalpha_l"
		}"
		end

	isascii (a_c: INTEGER_32): INTEGER_32 is
 		-- isascii
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isascii"
		}"
		end

	isblank (a_c: INTEGER_32): INTEGER_32 is
 		-- isblank
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isblank"
		}"
		end

	isblank_l (an_argument_l1027_c7: INTEGER_32; an_argument_l1028_c7: POINTER): INTEGER_32 is
 		-- isblank_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isblank_l"
		}"
		end

	iscntrl (a_c: INTEGER_32): INTEGER_32 is
 		-- iscntrl
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "iscntrl"
		}"
		end

	iscntrl_l (an_argument_l996_c7: INTEGER_32; an_argument_l997_c7: POINTER): INTEGER_32 is
 		-- iscntrl_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "iscntrl_l"
		}"
		end

	isctype (a_c: INTEGER_32; a_mask: INTEGER_32): INTEGER_32 is
 		-- isctype
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isctype"
		}"
		end

	isdigit (a_c: INTEGER_32): INTEGER_32 is
 		-- isdigit
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isdigit"
		}"
		end

	isdigit_l (an_argument_l716_c7: INTEGER_32; an_argument_l717_c7: POINTER): INTEGER_32 is
 		-- isdigit_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isdigit_l"
		}"
		end

	isgraph (a_c: INTEGER_32): INTEGER_32 is
 		-- isgraph
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isgraph"
		}"
		end

	isgraph_l (an_argument_l697_c7: INTEGER_32; an_argument_l698_c7: POINTER): INTEGER_32 is
 		-- isgraph_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isgraph_l"
		}"
		end

	islower (a_c: INTEGER_32): INTEGER_32 is
 		-- islower
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "islower"
		}"
		end

	islower_l (an_argument_l2067_c7: INTEGER_32; an_argument_l2068_c7: POINTER): INTEGER_32 is
 		-- islower_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "islower_l"
		}"
		end

	isprint (a_c: INTEGER_32): INTEGER_32 is
 		-- isprint
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isprint"
		}"
		end

	isprint_l (an_argument_l2237_c7: INTEGER_32; an_argument_l2238_c7: POINTER): INTEGER_32 is
 		-- isprint_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isprint_l"
		}"
		end

	ispunct (a_c: INTEGER_32): INTEGER_32 is
 		-- ispunct
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ispunct"
		}"
		end

	ispunct_l (an_argument_l2211_c7: INTEGER_32; an_argument_l2212_c7: POINTER): INTEGER_32 is
 		-- ispunct_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ispunct_l"
		}"
		end

	isspace (a_c: INTEGER_32): INTEGER_32 is
 		-- isspace
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isspace"
		}"
		end

	isspace_l (an_argument_l1485_c7: INTEGER_32; an_argument_l1486_c7: POINTER): INTEGER_32 is
 		-- isspace_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isspace_l"
		}"
		end

	isupper (a_c: INTEGER_32): INTEGER_32 is
 		-- isupper
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isupper"
		}"
		end

	isupper_l (an_argument_l2161_c7: INTEGER_32; an_argument_l2162_c7: POINTER): INTEGER_32 is
 		-- isupper_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isupper_l"
		}"
		end

	isxdigit (a_c: INTEGER_32): INTEGER_32 is
 		-- isxdigit
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isxdigit"
		}"
		end

	isxdigit_l (an_argument_l1417_c7: INTEGER_32; an_argument_l1418_c7: POINTER): INTEGER_32 is
 		-- isxdigit_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isxdigit_l"
		}"
		end

	toascii (a_c: INTEGER_32): INTEGER_32 is
 		-- toascii
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "toascii"
		}"
		end

	tolower (a_c: INTEGER_32): INTEGER_32 is
 		-- tolower
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tolower"
		}"
		end

	-- `hidden' function _tolower skipped.
	tolower_l (a_c: INTEGER_32; a_l: POINTER): INTEGER_32 is
 		-- tolower_l
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tolower_l"
		}"
		end

	-- `hidden' function __tolower_l skipped.
	toupper (a_c: INTEGER_32): INTEGER_32 is
 		-- toupper
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "toupper"
		}"
		end

	-- `hidden' function _toupper skipped.
	toupper_l (a_c: INTEGER_32; a_l: POINTER): INTEGER_32 is
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
