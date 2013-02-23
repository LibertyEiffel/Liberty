indexing
description: "External calls for ZLib"
copyright: "Copyright (C) 2008 Paolo Redaelli"
license: "LGPL v2 or later"

deferred class ZLIB_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	zlib_version: POINTER is -- char * zlibVersion (void);
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "zlib"
			feature_name: "zlibVersion"
			}"
		end

	deflate_init (a_stream: POINTER; a_level: INTEGER_32): INTEGER_32 is --  int deflateInit (z_streamp strm, int level);
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "zlib"
			feature_name: "deflateInit"
			}"
		end

	deflate (a_stream: POINTER; a_flush: INTEGER_32): INTEGER is --  int deflate (z_streamp strm, int flush);
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "zlib"
			feature_name: "deflate"
			}"
		end

	deflate_end (a_stream: POINTER): INTEGER is --  int deflateEnd (z_streamp strm);
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "zlib"
			feature_name: "deflateEnd"
			}"
		end


	inflate_init (a_stream: POINTER): INTEGER is -- int inflateInit (z_streamp strm);
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "zlib"
			feature_name: "inflateInit"
			}"
		end


	inflate (a_stream: POINTER; a_flush: INTEGER): INTEGER is --  int inflate (z_streamp strm, int flush);;
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "zlib"
			feature_name: "inflate"
			}"
		end


	inflate_end (a_stream: POINTER): INTEGER is --  int inflateEnd (z_streamp strm); 
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "zlib"
			feature_name: "inflateEnd"
			}"
		end

	end -- deferred class ZLIB_EXTERNALS

