-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class FCNTL_LINUX_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	fallocate (a_fd: INTEGER; a_mode: INTEGER; an_offset: like long; a_len: like long): INTEGER 

		-- function fallocate (in `/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h')
               -- fallocate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fallocate"
               }"
               end

	fallocate64 (a_fd: INTEGER; a_mode: INTEGER; an_offset: like long; a_len: like long): INTEGER 

		-- function fallocate64 (in `/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h')
               -- fallocate64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fallocate64"
               }"
               end

	name_to_handle_at (a_dfd: INTEGER; a_name: POINTER; a_handle: POINTER; a_mnt_id: POINTER; a_flags: INTEGER): INTEGER 

		-- function name_to_handle_at (in `/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h')
               -- name_to_handle_at
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "name_to_handle_at"
               }"
               end

	open_by_handle_at (a_mountdirfd: INTEGER; a_handle: POINTER; a_flags: INTEGER): INTEGER 

		-- function open_by_handle_at (in `/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h')
               -- open_by_handle_at
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "open_by_handle_at"
               }"
               end

	readahead (a_fd: INTEGER; an_offset: like long; a_count: like size_t): like ssize_t 

		-- function readahead (in `/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h')
               -- readahead
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "readahead"
               }"
               end

	splice (a_fdin: INTEGER; an_offin: POINTER; a_fdout: INTEGER; an_offout: POINTER; a_len: like size_t; a_flags: NATURAL): like ssize_t 

		-- function splice (in `/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h')
               -- splice
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "splice"
               }"
               end

	sync_file_range (a_fd: INTEGER; an_offset: like long; a_count: like long; a_flags: NATURAL): INTEGER 

		-- function sync_file_range (in `/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h')
               -- sync_file_range
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sync_file_range"
               }"
               end

	tee (a_fdin: INTEGER; a_fdout: INTEGER; a_len: like size_t; a_flags: NATURAL): like ssize_t 

		-- function tee (in `/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h')
               -- tee
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "tee"
               }"
               end

	vmsplice (a_fdout: INTEGER; an_iov: POINTER; a_count: like size_t; a_flags: NATURAL): like ssize_t 

		-- function vmsplice (in `/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h')
               -- vmsplice
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "vmsplice"
               }"
               end


end -- class FCNTL_LINUX_EXTERNALS
