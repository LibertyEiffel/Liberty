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
                       feature_name: "Void"
               }"
               end

	isalnum_l (an_argument_l3389_c7: INTEGER; an_argument_l3390_c7: POINTER): INTEGER 
               -- isalnum_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	isalpha (a_c: INTEGER): INTEGER 
               -- isalpha
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	isalpha_l (an_argument_l3079_c7: INTEGER; an_argument_l3080_c7: POINTER): INTEGER 
               -- isalpha_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	isascii (a_c: INTEGER): INTEGER 
               -- isascii
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	isblank (a_c: INTEGER): INTEGER 
               -- isblank
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	isblank_l (an_argument_l1034_c7: INTEGER; an_argument_l1035_c7: POINTER): INTEGER 
               -- isblank_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	iscntrl (a_c: INTEGER): INTEGER 
               -- iscntrl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	iscntrl_l (an_argument_l1001_c7: INTEGER; an_argument_l1002_c7: POINTER): INTEGER 
               -- iscntrl_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	isctype (a_c: INTEGER; a_mask: INTEGER): INTEGER 
               -- isctype
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	isdigit (a_c: INTEGER): INTEGER 
               -- isdigit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	isdigit_l (an_argument_l721_c7: INTEGER; an_argument_l722_c7: POINTER): INTEGER 
               -- isdigit_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	isgraph (a_c: INTEGER): INTEGER 
               -- isgraph
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	isgraph_l (an_argument_l700_c7: INTEGER; an_argument_l701_c7: POINTER): INTEGER 
               -- isgraph_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	islower (a_c: INTEGER): INTEGER 
               -- islower
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	islower_l (an_argument_l2088_c7: INTEGER; an_argument_l2089_c7: POINTER): INTEGER 
               -- islower_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	isprint (a_c: INTEGER): INTEGER 
               -- isprint
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	isprint_l (an_argument_l2264_c7: INTEGER; an_argument_l2265_c7: POINTER): INTEGER 
               -- isprint_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	ispunct (a_c: INTEGER): INTEGER 
               -- ispunct
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	ispunct_l (an_argument_l2234_c7: INTEGER; an_argument_l2235_c7: POINTER): INTEGER 
               -- ispunct_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	isspace (a_c: INTEGER): INTEGER 
               -- isspace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	isspace_l (an_argument_l1502_c7: INTEGER; an_argument_l1503_c7: POINTER): INTEGER 
               -- isspace_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	isupper (a_c: INTEGER): INTEGER 
               -- isupper
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	isupper_l (an_argument_l2182_c7: INTEGER; an_argument_l2183_c7: POINTER): INTEGER 
               -- isupper_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	isxdigit (a_c: INTEGER): INTEGER 
               -- isxdigit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	isxdigit_l (an_argument_l1428_c7: INTEGER; an_argument_l1429_c7: POINTER): INTEGER 
               -- isxdigit_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	toascii (a_c: INTEGER): INTEGER 
               -- toascii
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	tolower (a_c: INTEGER): INTEGER 
               -- tolower
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	-- `hidden' function _tolower skipped.
	tolower_l (a_c: INTEGER; a_l: POINTER): INTEGER 
               -- tolower_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	-- `hidden' function __tolower_l skipped.
	toupper (a_c: INTEGER): INTEGER 
               -- toupper
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	-- `hidden' function _toupper skipped.
	toupper_l (a_c: INTEGER; a_l: POINTER): INTEGER 
               -- toupper_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	-- `hidden' function __toupper_l skipped.

end -- class CTYPE_EXTERNALS
