-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class FCNTL_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	creat (a_file: POINTER; a_mode: NATURAL): INTEGER 

		-- function creat (in `/usr/include/fcntl.h')
               -- creat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "creat"
               }"
               end

	creat64 (a_file: POINTER; a_mode: NATURAL): INTEGER 

		-- function creat64 (in `/usr/include/fcntl.h')
               -- creat64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "creat64"
               }"
               end

	fcntl (a_fd: INTEGER; a_cmd: INTEGER): INTEGER 

		-- function fcntl (in `/usr/include/fcntl.h')
               -- fcntl (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fcntl"
               }"
               end

	lockf (a_fd: INTEGER; a_cmd: INTEGER; a_len: like long): INTEGER 

		-- function lockf (in `/usr/include/fcntl.h')
               -- lockf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "lockf"
               }"
               end

	lockf64 (a_fd: INTEGER; a_cmd: INTEGER; a_len: like long): INTEGER 

		-- function lockf64 (in `/usr/include/fcntl.h')
               -- lockf64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "lockf64"
               }"
               end

	open (a_file: POINTER; an_oflag: INTEGER): INTEGER 

		-- function open (in `/usr/include/fcntl.h')
               -- open (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "open"
               }"
               end

	open64 (a_file: POINTER; an_oflag: INTEGER): INTEGER 

		-- function open64 (in `/usr/include/fcntl.h')
               -- open64 (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "open64"
               }"
               end

	openat (a_fd: INTEGER; a_file: POINTER; an_oflag: INTEGER): INTEGER 

		-- function openat (in `/usr/include/fcntl.h')
               -- openat (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "openat"
               }"
               end

	openat64 (a_fd: INTEGER; a_file: POINTER; an_oflag: INTEGER): INTEGER 

		-- function openat64 (in `/usr/include/fcntl.h')
               -- openat64 (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "openat64"
               }"
               end

	posix_fadvise (a_fd: INTEGER; an_offset: like long; a_len: like long; an_advise: INTEGER): INTEGER 

		-- function posix_fadvise (in `/usr/include/fcntl.h')
               -- posix_fadvise
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_fadvise"
               }"
               end

	posix_fadvise64 (a_fd: INTEGER; an_offset: like long; a_len: like long; an_advise: INTEGER): INTEGER 

		-- function posix_fadvise64 (in `/usr/include/fcntl.h')
               -- posix_fadvise64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_fadvise64"
               }"
               end

	posix_fallocate (a_fd: INTEGER; an_offset: like long; a_len: like long): INTEGER 

		-- function posix_fallocate (in `/usr/include/fcntl.h')
               -- posix_fallocate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_fallocate"
               }"
               end

	posix_fallocate64 (a_fd: INTEGER; an_offset: like long; a_len: like long): INTEGER 

		-- function posix_fallocate64 (in `/usr/include/fcntl.h')
               -- posix_fallocate64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_fallocate64"
               }"
               end


end -- class FCNTL_EXTERNALS
