-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class FCNTL_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	creat (a_file: POINTER; a_mode: NATURAL): INTEGER is
 		-- creat
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "creat"
		}"
		end

	creat64 (a_file: POINTER; a_mode: NATURAL): INTEGER is
 		-- creat64
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "creat64"
		}"
		end

	fcntl (a_fd: INTEGER; a_cmd: INTEGER): INTEGER is
 		-- fcntl (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fcntl"
		}"
		end

	lockf (a_fd: INTEGER; a_cmd: INTEGER; a_len: like long): INTEGER is
 		-- lockf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lockf"
		}"
		end

	lockf64 (a_fd: INTEGER; a_cmd: INTEGER; a_len: INTEGER_64): INTEGER is
 		-- lockf64
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lockf64"
		}"
		end

	posix_fadvise (a_fd: INTEGER; an_offset: like long; a_len: like long; an_advise: INTEGER): INTEGER is
 		-- posix_fadvise
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "posix_fadvise"
		}"
		end

	posix_fadvise64 (a_fd: INTEGER; an_offset: INTEGER_64; a_len: INTEGER_64; an_advise: INTEGER): INTEGER is
 		-- posix_fadvise64
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "posix_fadvise64"
		}"
		end

	posix_fallocate (a_fd: INTEGER; an_offset: like long; a_len: like long): INTEGER is
 		-- posix_fallocate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "posix_fallocate"
		}"
		end

	posix_fallocate64 (a_fd: INTEGER; an_offset: INTEGER_64; a_len: INTEGER_64): INTEGER is
 		-- posix_fallocate64
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "posix_fallocate64"
		}"
		end


end -- class FCNTL_EXTERNALS
