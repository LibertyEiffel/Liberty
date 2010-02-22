-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class MMANEXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	munmap (an_addr: POINTER; a_len: NATURAL_64): INTEGER_32 is
 		-- munmap (node at line 153)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "munmap"
		}"
		end

	mremap (an_addr: POINTER; an_old_len: NATURAL_64; a_new_len: NATURAL_64; a_flags: INTEGER_32): POINTER is
 		-- mremap (variadic)  (node at line 166)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mremap"
		}"
		end

	shm_open (a_name: POINTER; an_oflag: INTEGER_32; a_mode: NATURAL_32): INTEGER_32 is
 		-- shm_open (node at line 246)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "shm_open"
		}"
		end

	mprotect (an_addr: POINTER; a_len: NATURAL_64; a_prot: INTEGER_32): INTEGER_32 is
 		-- mprotect (node at line 381)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mprotect"
		}"
		end

	munlock (an_addr: POINTER; a_len: NATURAL_64): INTEGER_32 is
 		-- munlock (node at line 446)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "munlock"
		}"
		end

	msync (an_addr: POINTER; a_len: NATURAL_64; a_flags: INTEGER_32): INTEGER_32 is
 		-- msync (node at line 577)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "msync"
		}"
		end

	mmap (an_addr: POINTER; a_len: NATURAL_64; a_prot: INTEGER_32; a_flags: INTEGER_32; a_fd: INTEGER_32; an_offset: INTEGER_64): POINTER is
 		-- mmap (node at line 652)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mmap"
		}"
		end

	posix_madvise (an_addr: POINTER; a_len: NATURAL_64; an_advice: INTEGER_32): INTEGER_32 is
 		-- posix_madvise (node at line 688)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "posix_madvise"
		}"
		end

	shm_unlink (a_name: POINTER): INTEGER_32 is
 		-- shm_unlink (node at line 881)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "shm_unlink"
		}"
		end

	mlockall (a_flags: INTEGER_32): INTEGER_32 is
 		-- mlockall (node at line 895)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mlockall"
		}"
		end

	mmap64 (an_addr: POINTER; a_len: NATURAL_64; a_prot: INTEGER_32; a_flags: INTEGER_32; a_fd: INTEGER_32; an_offset: INTEGER_64): POINTER is
 		-- mmap64 (node at line 1015)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mmap64"
		}"
		end

	remap_file_pages (a_start: POINTER; a_size: NATURAL_64; a_prot: INTEGER_32; a_pgoff: NATURAL_64; a_flags: INTEGER_32): INTEGER_32 is
 		-- remap_file_pages (node at line 1088)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "remap_file_pages"
		}"
		end

	madvise (an_addr: POINTER; a_len: NATURAL_64; an_advice: INTEGER_32): INTEGER_32 is
 		-- madvise (node at line 1140)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "madvise"
		}"
		end

	mlock (an_addr: POINTER; a_len: NATURAL_64): INTEGER_32 is
 		-- mlock (node at line 1289)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mlock"
		}"
		end

	munlockall: INTEGER_32 is
 		-- munlockall (node at line 1310)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "munlockall()"
		}"
		end

	mincore (a_start: POINTER; a_len: NATURAL_64; a_vec: POINTER): INTEGER_32 is
 		-- mincore (node at line 1349)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mincore"
		}"
		end


end -- class MMANEXTERNALS
