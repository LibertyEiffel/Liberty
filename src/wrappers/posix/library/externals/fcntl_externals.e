-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class FCNTL_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	posix_fadvise (a_fd: INTEGER_32; an_offset: INTEGER_64; a_len: INTEGER_64; an_advise: INTEGER_32): INTEGER_32 is
<<<<<<< HEAD
 		-- posix_fadvise
=======
 		-- posix_fadvise (node at line 339)
>>>>>>> 20fc8ce8818a42563af1c2b21a7d315d1df969cd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "posix_fadvise"
		}"
		end

<<<<<<< HEAD
	creat (a_file: POINTER; a_mode: NATURAL_32): INTEGER_32 is
 		-- creat
=======
	open (a_file: POINTER; an_oflag: INTEGER_32): INTEGER_32 is
 		-- open (variadic call)  (node at line 354)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "open"
		}"
		end

	creat (a_file: POINTER; a_mode: NATURAL_32): INTEGER_32 is
 		-- creat (node at line 564)
>>>>>>> 20fc8ce8818a42563af1c2b21a7d315d1df969cd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "creat"
		}"
		end

<<<<<<< HEAD
	posix_fallocate (a_fd: INTEGER_32; an_offset: INTEGER_64; a_len: INTEGER_64): INTEGER_32 is
 		-- posix_fallocate
=======
	open64 (a_file: POINTER; an_oflag: INTEGER_32): INTEGER_32 is
 		-- open64 (variadic call)  (node at line 574)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "open64"
		}"
		end

	posix_fallocate (a_fd: INTEGER_32; an_offset: INTEGER_64; a_len: INTEGER_64): INTEGER_32 is
 		-- posix_fallocate (node at line 636)
>>>>>>> 20fc8ce8818a42563af1c2b21a7d315d1df969cd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "posix_fallocate"
		}"
		end

<<<<<<< HEAD
	posix_fallocate64 (a_fd: INTEGER_32; an_offset: INTEGER_64; a_len: INTEGER_64): INTEGER_32 is
 		-- posix_fallocate64
=======
	posix_fadvise64 (a_fd: INTEGER_32; an_offset: INTEGER_64; a_len: INTEGER_64; an_advise: INTEGER_32): INTEGER_32 is
 		-- posix_fadvise64 (node at line 657)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "posix_fadvise64"
		}"
		end

	posix_fallocate64 (a_fd: INTEGER_32; an_offset: INTEGER_64; a_len: INTEGER_64): INTEGER_32 is
 		-- posix_fallocate64 (node at line 675)
>>>>>>> 20fc8ce8818a42563af1c2b21a7d315d1df969cd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "posix_fallocate64"
		}"
		end

<<<<<<< HEAD
	lockf (a_fd: INTEGER_32; a_cmd: INTEGER_32; a_len: INTEGER_64): INTEGER_32 is
 		-- lockf
=======
	openat (a_fd: INTEGER_32; a_file: POINTER; an_oflag: INTEGER_32): INTEGER_32 is
 		-- openat (variadic call)  (node at line 689)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "openat"
		}"
		end

	lockf (a_fd: INTEGER_32; a_cmd: INTEGER_32; a_len: INTEGER_64): INTEGER_32 is
 		-- lockf (node at line 752)
>>>>>>> 20fc8ce8818a42563af1c2b21a7d315d1df969cd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lockf"
		}"
		end

<<<<<<< HEAD
	posix_fadvise64 (a_fd: INTEGER_32; an_offset: INTEGER_64; a_len: INTEGER_64; an_advise: INTEGER_32): INTEGER_32 is
 		-- posix_fadvise64
=======
	openat64 (a_fd: INTEGER_32; a_file: POINTER; an_oflag: INTEGER_32): INTEGER_32 is
 		-- openat64 (variadic call)  (node at line 757)
>>>>>>> 20fc8ce8818a42563af1c2b21a7d315d1df969cd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
<<<<<<< HEAD
			feature_name: "posix_fadvise64"
=======
			feature_name: "openat64"
>>>>>>> 20fc8ce8818a42563af1c2b21a7d315d1df969cd
		}"
		end

	lockf64 (a_fd: INTEGER_32; a_cmd: INTEGER_32; a_len: INTEGER_64): INTEGER_32 is
<<<<<<< HEAD
 		-- lockf64
=======
 		-- lockf64 (node at line 915)
>>>>>>> 20fc8ce8818a42563af1c2b21a7d315d1df969cd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lockf64"
		}"
		end

	creat64 (a_file: POINTER; a_mode: NATURAL_32): INTEGER_32 is
<<<<<<< HEAD
 		-- creat64
=======
 		-- creat64 (node at line 920)
>>>>>>> 20fc8ce8818a42563af1c2b21a7d315d1df969cd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "creat64"
		}"
		end

	fcntl (a_fd: INTEGER_32; a_cmd: INTEGER_32): INTEGER_32 is
<<<<<<< HEAD
 		-- fcntl (variadic call) 
=======
 		-- fcntl (variadic call)  (node at line 929)
>>>>>>> 20fc8ce8818a42563af1c2b21a7d315d1df969cd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fcntl"
		}"
		end


end -- class FCNTL_EXTERNALS
