-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class CTYPE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	-- `hidden' function __ctype_b_loc skipped.
	-- `hidden' function __ctype_tolower_loc skipped.
	-- `hidden' function __ctype_toupper_loc skipped.
	isalnum (an_argument_l95_c7: INTEGER): INTEGER 

		-- function isalnum (in 110 at line /usr/include/ctype.h)
               -- isalnum
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isalnum"
               }"
               end

	isalnum_l (an_argument_l156_c7: INTEGER; an_argument_l157_c7: POINTER): INTEGER 

		-- function isalnum_l (in 271 at line /usr/include/ctype.h)
               -- isalnum_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isalnum_l"
               }"
               end

	isalpha (an_argument_l98_c7: INTEGER): INTEGER 

		-- function isalpha (in 111 at line /usr/include/ctype.h)
               -- isalpha
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isalpha"
               }"
               end

	isalpha_l (an_argument_l160_c7: INTEGER; an_argument_l161_c7: POINTER): INTEGER 

		-- function isalpha_l (in 272 at line /usr/include/ctype.h)
               -- isalpha_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isalpha_l"
               }"
               end

	isascii (a_c: INTEGER): INTEGER 

		-- function isascii (in 150 at line /usr/include/ctype.h)
               -- isascii
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isascii"
               }"
               end

	isblank (an_argument_l134_c7: INTEGER): INTEGER 

		-- function isblank (in 136 at line /usr/include/ctype.h)
               -- isblank
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isblank"
               }"
               end

	isblank_l (an_argument_l200_c7: INTEGER; an_argument_l201_c7: POINTER): INTEGER 

		-- function isblank_l (in 283 at line /usr/include/ctype.h)
               -- isblank_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isblank_l"
               }"
               end

	iscntrl (an_argument_l101_c7: INTEGER): INTEGER 

		-- function iscntrl (in 112 at line /usr/include/ctype.h)
               -- iscntrl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iscntrl"
               }"
               end

	iscntrl_l (an_argument_l164_c7: INTEGER; an_argument_l165_c7: POINTER): INTEGER 

		-- function iscntrl_l (in 273 at line /usr/include/ctype.h)
               -- iscntrl_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iscntrl_l"
               }"
               end

	isctype (a_c: INTEGER; a_mask: INTEGER): INTEGER 

		-- function isctype (in 143 at line /usr/include/ctype.h)
               -- isctype
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isctype"
               }"
               end

	isdigit (an_argument_l104_c7: INTEGER): INTEGER 

		-- function isdigit (in 113 at line /usr/include/ctype.h)
               -- isdigit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isdigit"
               }"
               end

	isdigit_l (an_argument_l168_c7: INTEGER; an_argument_l169_c7: POINTER): INTEGER 

		-- function isdigit_l (in 274 at line /usr/include/ctype.h)
               -- isdigit_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isdigit_l"
               }"
               end

	isgraph (an_argument_l110_c7: INTEGER): INTEGER 

		-- function isgraph (in 115 at line /usr/include/ctype.h)
               -- isgraph
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isgraph"
               }"
               end

	isgraph_l (an_argument_l176_c7: INTEGER; an_argument_l177_c7: POINTER): INTEGER 

		-- function isgraph_l (in 276 at line /usr/include/ctype.h)
               -- isgraph_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isgraph_l"
               }"
               end

	islower (an_argument_l107_c7: INTEGER): INTEGER 

		-- function islower (in 114 at line /usr/include/ctype.h)
               -- islower
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "islower"
               }"
               end

	islower_l (an_argument_l172_c7: INTEGER; an_argument_l173_c7: POINTER): INTEGER 

		-- function islower_l (in 275 at line /usr/include/ctype.h)
               -- islower_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "islower_l"
               }"
               end

	isprint (an_argument_l113_c7: INTEGER): INTEGER 

		-- function isprint (in 116 at line /usr/include/ctype.h)
               -- isprint
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isprint"
               }"
               end

	isprint_l (an_argument_l180_c7: INTEGER; an_argument_l181_c7: POINTER): INTEGER 

		-- function isprint_l (in 277 at line /usr/include/ctype.h)
               -- isprint_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isprint_l"
               }"
               end

	ispunct (an_argument_l116_c7: INTEGER): INTEGER 

		-- function ispunct (in 117 at line /usr/include/ctype.h)
               -- ispunct
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ispunct"
               }"
               end

	ispunct_l (an_argument_l184_c7: INTEGER; an_argument_l185_c7: POINTER): INTEGER 

		-- function ispunct_l (in 278 at line /usr/include/ctype.h)
               -- ispunct_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ispunct_l"
               }"
               end

	isspace (an_argument_l119_c7: INTEGER): INTEGER 

		-- function isspace (in 118 at line /usr/include/ctype.h)
               -- isspace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isspace"
               }"
               end

	isspace_l (an_argument_l188_c7: INTEGER; an_argument_l189_c7: POINTER): INTEGER 

		-- function isspace_l (in 279 at line /usr/include/ctype.h)
               -- isspace_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isspace_l"
               }"
               end

	isupper (an_argument_l122_c7: INTEGER): INTEGER 

		-- function isupper (in 119 at line /usr/include/ctype.h)
               -- isupper
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isupper"
               }"
               end

	isupper_l (an_argument_l192_c7: INTEGER; an_argument_l193_c7: POINTER): INTEGER 

		-- function isupper_l (in 280 at line /usr/include/ctype.h)
               -- isupper_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isupper_l"
               }"
               end

	isxdigit (an_argument_l125_c7: INTEGER): INTEGER 

		-- function isxdigit (in 120 at line /usr/include/ctype.h)
               -- isxdigit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isxdigit"
               }"
               end

	isxdigit_l (an_argument_l196_c7: INTEGER; an_argument_l197_c7: POINTER): INTEGER 

		-- function isxdigit_l (in 281 at line /usr/include/ctype.h)
               -- isxdigit_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isxdigit_l"
               }"
               end

	toascii (a_c: INTEGER): INTEGER 

		-- function toascii (in 154 at line /usr/include/ctype.h)
               -- toascii
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "toascii"
               }"
               end

	tolower (a_c: INTEGER): INTEGER 

		-- function tolower (in 124 at line /usr/include/ctype.h)
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

		-- function tolower_l (in 288 at line /usr/include/ctype.h)
               -- tolower_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "tolower_l"
               }"
               end

	toupper (a_c: INTEGER): INTEGER 

		-- function toupper (in 127 at line /usr/include/ctype.h)
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

		-- function toupper_l (in 292 at line /usr/include/ctype.h)
               -- toupper_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "toupper_l"
               }"
               end


end -- class CTYPE_EXTERNALS
