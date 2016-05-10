-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class MMAN_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	madvise (an_addr: POINTER; a_len: like size_t; an_advice: INTEGER): INTEGER 

		-- function madvise (in `/usr/include/x86_64-linux-gnu/sys/mman.h')
               -- madvise
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "madvise"
               }"
               end

	mincore (a_start: POINTER; a_len: like size_t; a_vec: POINTER): INTEGER 

		-- function mincore (in `/usr/include/x86_64-linux-gnu/sys/mman.h')
               -- mincore
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mincore"
               }"
               end

	mlock (an_addr: POINTER; a_len: like size_t): INTEGER 

		-- function mlock (in `/usr/include/x86_64-linux-gnu/sys/mman.h')
               -- mlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mlock"
               }"
               end

	mlockall (a_flags: INTEGER): INTEGER 

		-- function mlockall (in `/usr/include/x86_64-linux-gnu/sys/mman.h')
               -- mlockall
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mlockall"
               }"
               end

	mmap (an_addr: POINTER; a_len: like size_t; a_prot: INTEGER; a_flags: INTEGER; a_fd: INTEGER; an_offset: like long): POINTER 

		-- function mmap (in `/usr/include/x86_64-linux-gnu/sys/mman.h')
               -- mmap
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mmap"
               }"
               end

	mmap64 (an_addr: POINTER; a_len: like size_t; a_prot: INTEGER; a_flags: INTEGER; a_fd: INTEGER; an_offset: like long): POINTER 

		-- function mmap64 (in `/usr/include/x86_64-linux-gnu/sys/mman.h')
               -- mmap64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mmap64"
               }"
               end

	mprotect (an_addr: POINTER; a_len: like size_t; a_prot: INTEGER): INTEGER 

		-- function mprotect (in `/usr/include/x86_64-linux-gnu/sys/mman.h')
               -- mprotect
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mprotect"
               }"
               end

	mremap (an_addr: POINTER; an_old_len: like size_t; a_new_len: like size_t; a_flags: INTEGER): POINTER 

		-- function mremap (in `/usr/include/x86_64-linux-gnu/sys/mman.h')
               -- mremap (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mremap"
               }"
               end

	msync (an_addr: POINTER; a_len: like size_t; a_flags: INTEGER): INTEGER 

		-- function msync (in `/usr/include/x86_64-linux-gnu/sys/mman.h')
               -- msync
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "msync"
               }"
               end

	munlock (an_addr: POINTER; a_len: like size_t): INTEGER 

		-- function munlock (in `/usr/include/x86_64-linux-gnu/sys/mman.h')
               -- munlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "munlock"
               }"
               end

	munlockall: INTEGER 

		-- function munlockall (in `/usr/include/x86_64-linux-gnu/sys/mman.h')
               -- munlockall
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "munlockall()"
               }"
               end

	munmap (an_addr: POINTER; a_len: like size_t): INTEGER 

		-- function munmap (in `/usr/include/x86_64-linux-gnu/sys/mman.h')
               -- munmap
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "munmap"
               }"
               end

	posix_madvise (an_addr: POINTER; a_len: like size_t; an_advice: INTEGER): INTEGER 

		-- function posix_madvise (in `/usr/include/x86_64-linux-gnu/sys/mman.h')
               -- posix_madvise
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_madvise"
               }"
               end

	remap_file_pages (a_start: POINTER; a_size: like size_t; a_prot: INTEGER; a_pgoff: like size_t; a_flags: INTEGER): INTEGER 

		-- function remap_file_pages (in `/usr/include/x86_64-linux-gnu/sys/mman.h')
               -- remap_file_pages
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "remap_file_pages"
               }"
               end

	shm_open (a_name: POINTER; an_oflag: INTEGER; a_mode: NATURAL): INTEGER 

		-- function shm_open (in `/usr/include/x86_64-linux-gnu/sys/mman.h')
               -- shm_open
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "shm_open"
               }"
               end

	shm_unlink (a_name: POINTER): INTEGER 

		-- function shm_unlink (in `/usr/include/x86_64-linux-gnu/sys/mman.h')
               -- shm_unlink
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "shm_unlink"
               }"
               end


end -- class MMAN_EXTERNALS
