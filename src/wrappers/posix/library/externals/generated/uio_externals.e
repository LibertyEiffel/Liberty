-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class UIO_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	preadv (a_fd: INTEGER; an_iovec: POINTER; a_count: INTEGER; an_offset: like long): like ssize_t 

		-- function preadv (in `/usr/include/x86_64-linux-gnu/sys/uio.h')
               -- preadv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "preadv"
               }"
               end

	preadv64 (a_fd: INTEGER; an_iovec: POINTER; a_count: INTEGER; an_offset: like long): like ssize_t 

		-- function preadv64 (in `/usr/include/x86_64-linux-gnu/sys/uio.h')
               -- preadv64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "preadv64"
               }"
               end

	pwritev (a_fd: INTEGER; an_iovec: POINTER; a_count: INTEGER; an_offset: like long): like ssize_t 

		-- function pwritev (in `/usr/include/x86_64-linux-gnu/sys/uio.h')
               -- pwritev
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pwritev"
               }"
               end

	pwritev64 (a_fd: INTEGER; an_iovec: POINTER; a_count: INTEGER; an_offset: like long): like ssize_t 

		-- function pwritev64 (in `/usr/include/x86_64-linux-gnu/sys/uio.h')
               -- pwritev64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pwritev64"
               }"
               end

	readv (a_fd: INTEGER; an_iovec: POINTER; a_count: INTEGER): like ssize_t 

		-- function readv (in `/usr/include/x86_64-linux-gnu/sys/uio.h')
               -- readv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "readv"
               }"
               end

	writev (a_fd: INTEGER; an_iovec: POINTER; a_count: INTEGER): like ssize_t 

		-- function writev (in `/usr/include/x86_64-linux-gnu/sys/uio.h')
               -- writev
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "writev"
               }"
               end


end -- class UIO_EXTERNALS
