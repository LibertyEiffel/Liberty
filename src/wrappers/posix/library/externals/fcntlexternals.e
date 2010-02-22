-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class FCNTLEXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	posix_fadvise (a_fd: INTEGER_32; an_offset: INTEGER_64; a_len: INTEGER_64; an_advise: INTEGER_32): INTEGER_32 is
 		-- posix_fadvise (node at line 506)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "posix_fadvise"
		}"
		end

	open (a_file: POINTER; an_oflag: INTEGER_32): INTEGER_32 is
 		-- open (variadic)  (node at line 530)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "open"
		}"
		end

	creat (a_file: POINTER; a_mode: NATURAL_32): INTEGER_32 is
 		-- creat (node at line 828)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "creat"
		}"
		end

	open64 (a_file: POINTER; an_oflag: INTEGER_32): INTEGER_32 is
 		-- open64 (variadic)  (node at line 842)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "open64"
		}"
		end

	posix_fallocate (a_fd: INTEGER_32; an_offset: INTEGER_64; a_len: INTEGER_64): INTEGER_32 is
 		-- posix_fallocate (node at line 961)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "posix_fallocate"
		}"
		end

	posix_fadvise64 (a_fd: INTEGER_32; an_offset: INTEGER_64; a_len: INTEGER_64; an_advise: INTEGER_32): INTEGER_32 is
 		-- posix_fadvise64 (node at line 1003)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "posix_fadvise64"
		}"
		end

	posix_fallocate64 (a_fd: INTEGER_32; an_offset: INTEGER_64; a_len: INTEGER_64): INTEGER_32 is
 		-- posix_fallocate64 (node at line 1037)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "posix_fallocate64"
		}"
		end

	openat (a_fd: INTEGER_32; a_file: POINTER; an_oflag: INTEGER_32): INTEGER_32 is
 		-- openat (variadic)  (node at line 1057)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "openat"
		}"
		end

	lockf (a_fd: INTEGER_32; a_cmd: INTEGER_32; a_len: INTEGER_64): INTEGER_32 is
 		-- lockf (node at line 1145)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lockf"
		}"
		end

	openat64 (a_fd: INTEGER_32; a_file: POINTER; an_oflag: INTEGER_32): INTEGER_32 is
 		-- openat64 (variadic)  (node at line 1155)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "openat64"
		}"
		end

	lockf64 (a_fd: INTEGER_32; a_cmd: INTEGER_32; a_len: INTEGER_64): INTEGER_32 is
 		-- lockf64 (node at line 1394)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lockf64"
		}"
		end

	creat64 (a_file: POINTER; a_mode: NATURAL_32): INTEGER_32 is
 		-- creat64 (node at line 1399)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "creat64"
		}"
		end

	fcntl (a_fd: INTEGER_32; a_cmd: INTEGER_32): INTEGER_32 is
 		-- fcntl (variadic)  (node at line 1418)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fcntl"
		}"
		end


end -- class FCNTLEXTERNALS
