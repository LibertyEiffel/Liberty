-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class ICONV_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	iconv (a_cd: POINTER; an_inbuf: POINTER; an_inbytesleft: POINTER; an_outbuf: POINTER; an_outbytesleft: POINTER): like size_t 

		-- function iconv (in `/usr/include/iconv.h')
               -- iconv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iconv"
               }"
               end

	iconv_close (a_cd: POINTER): INTEGER 

		-- function iconv_close (in `/usr/include/iconv.h')
               -- iconv_close
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iconv_close"
               }"
               end

	iconv_open (a_tocode: POINTER; a_fromcode: POINTER): POINTER 

		-- function iconv_open (in `/usr/include/iconv.h')
               -- iconv_open
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iconv_open"
               }"
               end


end -- class ICONV_EXTERNALS
