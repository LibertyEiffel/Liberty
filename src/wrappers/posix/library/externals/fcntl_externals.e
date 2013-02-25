-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class FCNTL_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	posix_fadvise (a_fd: INTEGER_32; an_offset: INTEGER_64; a_len: INTEGER_64; an_advise: INTEGER_32): INTEGER_32 is
 		-- posix_fadvise (node at line 339)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "posix_fadvise"
		}"
		end

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
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "creat"
		}"
		end

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
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "posix_fallocate"
		}"
		end

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
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "posix_fallocate64"
		}"
		end

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
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lockf"
		}"
		end

	openat64 (a_fd: INTEGER_32; a_file: POINTER; an_oflag: INTEGER_32): INTEGER_32 is
 		-- openat64 (variadic call)  (node at line 757)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "openat64"
		}"
		end

	lockf64 (a_fd: INTEGER_32; a_cmd: INTEGER_32; a_len: INTEGER_64): INTEGER_32 is
 		-- lockf64 (node at line 915)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lockf64"
		}"
		end

	creat64 (a_file: POINTER; a_mode: NATURAL_32): INTEGER_32 is
 		-- creat64 (node at line 920)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "creat64"
		}"
		end

	fcntl (a_fd: INTEGER_32; a_cmd: INTEGER_32): INTEGER_32 is
 		-- fcntl (variadic call)  (node at line 929)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fcntl"
		}"
		end


end -- class FCNTL_EXTERNALS
