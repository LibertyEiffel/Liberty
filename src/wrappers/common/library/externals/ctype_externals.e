-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class CTYPE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	-- `hidden' function __ctype_b_loc skipped.
	-- `hidden' function __ctype_tolower_loc skipped.
	-- `hidden' function __ctype_toupper_loc skipped.
	isalnum (an_argument_l95_c7: INTEGER): INTEGER 
               -- isalnum
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isalnum"
               }"
               end

	isalnum_l (an_argument_l156_c7: INTEGER; an_argument_l157_c7: POINTER): INTEGER 
               -- isalnum_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isalnum_l"
               }"
               end

	isalpha (an_argument_l98_c7: INTEGER): INTEGER 
               -- isalpha
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isalpha"
               }"
               end

	isalpha_l (an_argument_l160_c7: INTEGER; an_argument_l161_c7: POINTER): INTEGER 
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

	isblank (an_argument_l134_c7: INTEGER): INTEGER 
               -- isblank
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isblank"
               }"
               end

	isblank_l (an_argument_l200_c7: INTEGER; an_argument_l201_c7: POINTER): INTEGER 
               -- isblank_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isblank_l"
               }"
               end

	iscntrl (an_argument_l101_c7: INTEGER): INTEGER 
               -- iscntrl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iscntrl"
               }"
               end

	iscntrl_l (an_argument_l164_c7: INTEGER; an_argument_l165_c7: POINTER): INTEGER 
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

	isdigit (an_argument_l104_c7: INTEGER): INTEGER 
               -- isdigit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isdigit"
               }"
               end

	isdigit_l (an_argument_l168_c7: INTEGER; an_argument_l169_c7: POINTER): INTEGER 
               -- isdigit_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isdigit_l"
               }"
               end

	isgraph (an_argument_l110_c7: INTEGER): INTEGER 
               -- isgraph
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isgraph"
               }"
               end

	isgraph_l (an_argument_l176_c7: INTEGER; an_argument_l177_c7: POINTER): INTEGER 
               -- isgraph_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isgraph_l"
               }"
               end

	islower (an_argument_l107_c7: INTEGER): INTEGER 
               -- islower
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "islower"
               }"
               end

	islower_l (an_argument_l172_c7: INTEGER; an_argument_l173_c7: POINTER): INTEGER 
               -- islower_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "islower_l"
               }"
               end

	isprint (an_argument_l113_c7: INTEGER): INTEGER 
               -- isprint
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isprint"
               }"
               end

	isprint_l (an_argument_l180_c7: INTEGER; an_argument_l181_c7: POINTER): INTEGER 
               -- isprint_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isprint_l"
               }"
               end

	ispunct (an_argument_l116_c7: INTEGER): INTEGER 
               -- ispunct
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ispunct"
               }"
               end

	ispunct_l (an_argument_l184_c7: INTEGER; an_argument_l185_c7: POINTER): INTEGER 
               -- ispunct_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ispunct_l"
               }"
               end

	isspace (an_argument_l119_c7: INTEGER): INTEGER 
               -- isspace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isspace"
               }"
               end

	isspace_l (an_argument_l188_c7: INTEGER; an_argument_l189_c7: POINTER): INTEGER 
               -- isspace_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isspace_l"
               }"
               end

	isupper (an_argument_l122_c7: INTEGER): INTEGER 
               -- isupper
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isupper"
               }"
               end

	isupper_l (an_argument_l192_c7: INTEGER; an_argument_l193_c7: POINTER): INTEGER 
               -- isupper_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isupper_l"
               }"
               end

	isxdigit (an_argument_l125_c7: INTEGER): INTEGER 
               -- isxdigit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isxdigit"
               }"
               end

	isxdigit_l (an_argument_l196_c7: INTEGER; an_argument_l197_c7: POINTER): INTEGER 
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
	-- `hidden' function __tolower_l skipped.
	tolower_l (a_c: INTEGER; a_l: POINTER): INTEGER 
               -- tolower_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "tolower_l"
               }"
               end

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
	-- `hidden' function __toupper_l skipped.
	toupper_l (a_c: INTEGER; a_l: POINTER): INTEGER 
               -- toupper_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "toupper_l"
               }"
               end


end -- class CTYPE_EXTERNALS
