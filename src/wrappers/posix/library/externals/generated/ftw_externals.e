-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class FTW_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	ftw (a_dir: POINTER; a_func: POINTER; a_descriptors: INTEGER): INTEGER 

		-- function ftw (in `/usr/include/ftw.h')
               -- ftw
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ftw"
               }"
               end

	ftw64 (a_dir: POINTER; a_func: POINTER; a_descriptors: INTEGER): INTEGER 

		-- function ftw64 (in `/usr/include/ftw.h')
               -- ftw64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ftw64"
               }"
               end

	nftw (a_dir: POINTER; a_func: POINTER; a_descriptors: INTEGER; a_flag: INTEGER): INTEGER 

		-- function nftw (in `/usr/include/ftw.h')
               -- nftw
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "nftw"
               }"
               end

	nftw64 (a_dir: POINTER; a_func: POINTER; a_descriptors: INTEGER; a_flag: INTEGER): INTEGER 

		-- function nftw64 (in `/usr/include/ftw.h')
               -- nftw64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "nftw64"
               }"
               end


end -- class FTW_EXTERNALS
