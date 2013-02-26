-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class FCNTL_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	posix_fadvise (a_fd: INTEGER_32; an_offset: INTEGER_64; a_len: INTEGER_64; an_advise: INTEGER_32): INTEGER_32 is
 		-- posix_fadvise
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "posix_fadvise"
		}"
		end

	creat (a_file: POINTER; a_mode: NATURAL_32): INTEGER_32 is
 		-- creat
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "creat"
		}"
		end

	posix_fallocate (a_fd: INTEGER_32; an_offset: INTEGER_64; a_len: INTEGER_64): INTEGER_32 is
 		-- posix_fallocate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "posix_fallocate"
		}"
		end

	posix_fallocate64 (a_fd: INTEGER_32; an_offset: INTEGER_64; a_len: INTEGER_64): INTEGER_32 is
 		-- posix_fallocate64
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "posix_fallocate64"
		}"
		end

	lockf (a_fd: INTEGER_32; a_cmd: INTEGER_32; a_len: INTEGER_64): INTEGER_32 is
 		-- lockf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lockf"
		}"
		end

	posix_fadvise64 (a_fd: INTEGER_32; an_offset: INTEGER_64; a_len: INTEGER_64; an_advise: INTEGER_32): INTEGER_32 is
 		-- posix_fadvise64
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "posix_fadvise64"
		}"
		end

	lockf64 (a_fd: INTEGER_32; a_cmd: INTEGER_32; a_len: INTEGER_64): INTEGER_32 is
 		-- lockf64
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lockf64"
		}"
		end

	creat64 (a_file: POINTER; a_mode: NATURAL_32): INTEGER_32 is
 		-- creat64
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "creat64"
		}"
		end

	fcntl (a_fd: INTEGER_32; a_cmd: INTEGER_32): INTEGER_32 is
 		-- fcntl (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fcntl"
		}"
		end


end -- class FCNTL_EXTERNALS
