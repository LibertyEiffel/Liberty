-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class STATVFS_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	fstatvfs (a_fildes: INTEGER; a_buf: POINTER): INTEGER 

		-- function fstatvfs (in `/usr/include/x86_64-linux-gnu/sys/statvfs.h')
               -- fstatvfs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fstatvfs"
               }"
               end

	fstatvfs64 (a_fildes: INTEGER; a_buf: POINTER): INTEGER 

		-- function fstatvfs64 (in `/usr/include/x86_64-linux-gnu/sys/statvfs.h')
               -- fstatvfs64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fstatvfs64"
               }"
               end

	statvfs (a_file: POINTER; a_buf: POINTER): INTEGER 

		-- function statvfs (in `/usr/include/x86_64-linux-gnu/sys/statvfs.h')
               -- statvfs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "statvfs"
               }"
               end

	statvfs64 (a_file: POINTER; a_buf: POINTER): INTEGER 

		-- function statvfs64 (in `/usr/include/x86_64-linux-gnu/sys/statvfs.h')
               -- statvfs64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "statvfs64"
               }"
               end


end -- class STATVFS_EXTERNALS
