-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class FCNTL_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	creat (a_file: POINTER; a_mode: NATURAL): INTEGER 

		-- function creat (in 192 at line /usr/include/fcntl.h)i
               -- creat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "creat"
               }"
               end

	creat64 (a_file: POINTER; a_mode: NATURAL): INTEGER 

		-- function creat64 (in 202 at line /usr/include/fcntl.h)i
               -- creat64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "creat64"
               }"
               end

	fcntl (a_fd: INTEGER; a_cmd: INTEGER): INTEGER 

		-- function fcntl (in 137 at line /usr/include/fcntl.h)i
               -- fcntl (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fcntl"
               }"
               end

	lockf (a_fd: INTEGER; a_cmd: INTEGER; a_len: like long): INTEGER 

		-- function lockf (in 221 at line /usr/include/fcntl.h)i
               -- lockf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "lockf"
               }"
               end

	lockf64 (a_fd: INTEGER; a_cmd: INTEGER; a_len: like long): INTEGER 

		-- function lockf64 (in 230 at line /usr/include/fcntl.h)i
               -- lockf64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "lockf64"
               }"
               end

	open (a_file: POINTER; an_oflag: INTEGER): INTEGER 

		-- function open (in 146 at line /usr/include/fcntl.h)i
               -- open (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "open"
               }"
               end

	open64 (a_file: POINTER; an_oflag: INTEGER): INTEGER 

		-- function open64 (in 156 at line /usr/include/fcntl.h)i
               -- open64 (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "open64"
               }"
               end

	openat (a_fd: INTEGER; a_file: POINTER; an_oflag: INTEGER): INTEGER 

		-- function openat (in 170 at line /usr/include/fcntl.h)i
               -- openat (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "openat"
               }"
               end

	openat64 (a_fd: INTEGER; a_file: POINTER; an_oflag: INTEGER): INTEGER 

		-- function openat64 (in 181 at line /usr/include/fcntl.h)i
               -- openat64 (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "openat64"
               }"
               end

	posix_fadvise (a_fd: INTEGER; an_offset: like long; a_len: like long; an_advise: INTEGER): INTEGER 

		-- function posix_fadvise (in 238 at line /usr/include/fcntl.h)i
               -- posix_fadvise
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_fadvise"
               }"
               end

	posix_fadvise64 (a_fd: INTEGER; an_offset: like long; a_len: like long; an_advise: INTEGER): INTEGER 

		-- function posix_fadvise64 (in 250 at line /usr/include/fcntl.h)i
               -- posix_fadvise64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_fadvise64"
               }"
               end

	posix_fallocate (a_fd: INTEGER; an_offset: like long; a_len: like long): INTEGER 

		-- function posix_fallocate (in 260 at line /usr/include/fcntl.h)i
               -- posix_fallocate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_fallocate"
               }"
               end

	posix_fallocate64 (a_fd: INTEGER; an_offset: like long; a_len: like long): INTEGER 

		-- function posix_fallocate64 (in 271 at line /usr/include/fcntl.h)i
               -- posix_fallocate64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_fallocate64"
               }"
               end


end -- class FCNTL_EXTERNALS
