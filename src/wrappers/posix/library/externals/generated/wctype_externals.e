-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class WCTYPE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	iswalnum (a_wc: NATURAL): INTEGER 

		-- function iswalnum (in `/usr/include/wctype.h')
               -- iswalnum
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iswalnum"
               }"
               end

	iswalnum_l (a_wc: NATURAL; a_locale: POINTER): INTEGER 

		-- function iswalnum_l (in `/usr/include/wctype.h')
               -- iswalnum_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iswalnum_l"
               }"
               end

	iswalpha (a_wc: NATURAL): INTEGER 

		-- function iswalpha (in `/usr/include/wctype.h')
               -- iswalpha
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iswalpha"
               }"
               end

	iswalpha_l (a_wc: NATURAL; a_locale: POINTER): INTEGER 

		-- function iswalpha_l (in `/usr/include/wctype.h')
               -- iswalpha_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iswalpha_l"
               }"
               end

	iswblank (a_wc: NATURAL): INTEGER 

		-- function iswblank (in `/usr/include/wctype.h')
               -- iswblank
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iswblank"
               }"
               end

	iswblank_l (a_wc: NATURAL; a_locale: POINTER): INTEGER 

		-- function iswblank_l (in `/usr/include/wctype.h')
               -- iswblank_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iswblank_l"
               }"
               end

	iswcntrl (a_wc: NATURAL): INTEGER 

		-- function iswcntrl (in `/usr/include/wctype.h')
               -- iswcntrl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iswcntrl"
               }"
               end

	iswcntrl_l (a_wc: NATURAL; a_locale: POINTER): INTEGER 

		-- function iswcntrl_l (in `/usr/include/wctype.h')
               -- iswcntrl_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iswcntrl_l"
               }"
               end

	iswctype (a_wc: NATURAL; a_desc: like long_unsigned): INTEGER 

		-- function iswctype (in `/usr/include/wctype.h')
               -- iswctype
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iswctype"
               }"
               end

	iswctype_l (a_wc: NATURAL; a_desc: like long_unsigned; a_locale: POINTER): INTEGER 

		-- function iswctype_l (in `/usr/include/wctype.h')
               -- iswctype_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iswctype_l"
               }"
               end

	iswdigit (a_wc: NATURAL): INTEGER 

		-- function iswdigit (in `/usr/include/wctype.h')
               -- iswdigit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iswdigit"
               }"
               end

	iswdigit_l (a_wc: NATURAL; a_locale: POINTER): INTEGER 

		-- function iswdigit_l (in `/usr/include/wctype.h')
               -- iswdigit_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iswdigit_l"
               }"
               end

	iswgraph (a_wc: NATURAL): INTEGER 

		-- function iswgraph (in `/usr/include/wctype.h')
               -- iswgraph
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iswgraph"
               }"
               end

	iswgraph_l (a_wc: NATURAL; a_locale: POINTER): INTEGER 

		-- function iswgraph_l (in `/usr/include/wctype.h')
               -- iswgraph_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iswgraph_l"
               }"
               end

	iswlower (a_wc: NATURAL): INTEGER 

		-- function iswlower (in `/usr/include/wctype.h')
               -- iswlower
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iswlower"
               }"
               end

	iswlower_l (a_wc: NATURAL; a_locale: POINTER): INTEGER 

		-- function iswlower_l (in `/usr/include/wctype.h')
               -- iswlower_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iswlower_l"
               }"
               end

	iswprint (a_wc: NATURAL): INTEGER 

		-- function iswprint (in `/usr/include/wctype.h')
               -- iswprint
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iswprint"
               }"
               end

	iswprint_l (a_wc: NATURAL; a_locale: POINTER): INTEGER 

		-- function iswprint_l (in `/usr/include/wctype.h')
               -- iswprint_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iswprint_l"
               }"
               end

	iswpunct (a_wc: NATURAL): INTEGER 

		-- function iswpunct (in `/usr/include/wctype.h')
               -- iswpunct
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iswpunct"
               }"
               end

	iswpunct_l (a_wc: NATURAL; a_locale: POINTER): INTEGER 

		-- function iswpunct_l (in `/usr/include/wctype.h')
               -- iswpunct_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iswpunct_l"
               }"
               end

	iswspace (a_wc: NATURAL): INTEGER 

		-- function iswspace (in `/usr/include/wctype.h')
               -- iswspace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iswspace"
               }"
               end

	iswspace_l (a_wc: NATURAL; a_locale: POINTER): INTEGER 

		-- function iswspace_l (in `/usr/include/wctype.h')
               -- iswspace_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iswspace_l"
               }"
               end

	iswupper (a_wc: NATURAL): INTEGER 

		-- function iswupper (in `/usr/include/wctype.h')
               -- iswupper
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iswupper"
               }"
               end

	iswupper_l (a_wc: NATURAL; a_locale: POINTER): INTEGER 

		-- function iswupper_l (in `/usr/include/wctype.h')
               -- iswupper_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iswupper_l"
               }"
               end

	iswxdigit (a_wc: NATURAL): INTEGER 

		-- function iswxdigit (in `/usr/include/wctype.h')
               -- iswxdigit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iswxdigit"
               }"
               end

	iswxdigit_l (a_wc: NATURAL; a_locale: POINTER): INTEGER 

		-- function iswxdigit_l (in `/usr/include/wctype.h')
               -- iswxdigit_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iswxdigit_l"
               }"
               end

	towctrans (a_wc: NATURAL; a_desc: POINTER): NATURAL 

		-- function towctrans (in `/usr/include/wctype.h')
               -- towctrans
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "towctrans"
               }"
               end

	towctrans_l (a_wc: NATURAL; a_desc: POINTER; a_locale: POINTER): NATURAL 

		-- function towctrans_l (in `/usr/include/wctype.h')
               -- towctrans_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "towctrans_l"
               }"
               end

	towlower (a_wc: NATURAL): NATURAL 

		-- function towlower (in `/usr/include/wctype.h')
               -- towlower
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "towlower"
               }"
               end

	towlower_l (a_wc: NATURAL; a_locale: POINTER): NATURAL 

		-- function towlower_l (in `/usr/include/wctype.h')
               -- towlower_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "towlower_l"
               }"
               end

	towupper (a_wc: NATURAL): NATURAL 

		-- function towupper (in `/usr/include/wctype.h')
               -- towupper
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "towupper"
               }"
               end

	towupper_l (a_wc: NATURAL; a_locale: POINTER): NATURAL 

		-- function towupper_l (in `/usr/include/wctype.h')
               -- towupper_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "towupper_l"
               }"
               end

	wctrans (a_property: POINTER): POINTER 

		-- function wctrans (in `/usr/include/wctype.h')
               -- wctrans
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "wctrans"
               }"
               end

	wctrans_l (a_property: POINTER; a_locale: POINTER): POINTER 

		-- function wctrans_l (in `/usr/include/wctype.h')
               -- wctrans_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "wctrans_l"
               }"
               end

	wctype (a_property: POINTER): like long_unsigned 

		-- function wctype (in `/usr/include/wctype.h')
               -- wctype
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "wctype"
               }"
               end

	wctype_l (a_property: POINTER; a_locale: POINTER): like long_unsigned 

		-- function wctype_l (in `/usr/include/wctype.h')
               -- wctype_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "wctype_l"
               }"
               end


end -- class WCTYPE_EXTERNALS
