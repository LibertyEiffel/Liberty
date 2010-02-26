-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class FCNTLEXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	splice (a_fdin: INTEGER_32; an_offin: POINTER; a_fdout: INTEGER_32; an_offout: POINTER; a_len: NATURAL_64; a_flags: NATURAL_32): INTEGER_64 is
 		-- splice (node at line 540)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "splice"
		}"
		end

	vmsplice (a_fdout: INTEGER_32; an_iov: POINTER; a_count: NATURAL_64; a_flags: NATURAL_32): INTEGER_64 is
 		-- vmsplice (node at line 752)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vmsplice"
		}"
		end

	sync_file_range (a_fd: INTEGER_32; a_from_external: INTEGER_64; a_to: INTEGER_64; a_flags: NATURAL_32): INTEGER_32 is
 		-- sync_file_range (node at line 801)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sync_file_range"
		}"
		end

	readahead (a_fd: INTEGER_32; an_offset: INTEGER_64; a_count: NATURAL_64): INTEGER_64 is
 		-- readahead (node at line 929)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "readahead"
		}"
		end

	fallocate (a_fd: INTEGER_32; a_mode: INTEGER_32; an_offset: INTEGER_64; a_len: INTEGER_64): INTEGER_32 is
 		-- fallocate (node at line 1177)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fallocate"
		}"
		end

	tee (a_fdin: INTEGER_32; a_fdout: INTEGER_32; a_len: NATURAL_64; a_flags: NATURAL_32): INTEGER_64 is
 		-- tee (node at line 1486)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tee"
		}"
		end

	fallocate64 (a_fd: INTEGER_32; a_mode: INTEGER_32; an_offset: INTEGER_64; a_len: INTEGER_64): INTEGER_32 is
 		-- fallocate64 (node at line 1637)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fallocate64"
		}"
		end


end -- class FCNTLEXTERNALS
