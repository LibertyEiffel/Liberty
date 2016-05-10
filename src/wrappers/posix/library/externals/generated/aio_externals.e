-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class AIO_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	aio_cancel (a_fildes: INTEGER; an_aiocbp: POINTER): INTEGER 

		-- function aio_cancel (in `/usr/include/aio.h')
               -- aio_cancel
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "aio_cancel"
               }"
               end

	aio_cancel64 (a_fildes: INTEGER; an_aiocbp: POINTER): INTEGER 

		-- function aio_cancel64 (in `/usr/include/aio.h')
               -- aio_cancel64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "aio_cancel64"
               }"
               end

	aio_error (an_aiocbp: POINTER): INTEGER 

		-- function aio_error (in `/usr/include/aio.h')
               -- aio_error
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "aio_error"
               }"
               end

	aio_error64 (an_aiocbp: POINTER): INTEGER 

		-- function aio_error64 (in `/usr/include/aio.h')
               -- aio_error64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "aio_error64"
               }"
               end

	aio_fsync (an_operation: INTEGER; an_aiocbp: POINTER): INTEGER 

		-- function aio_fsync (in `/usr/include/aio.h')
               -- aio_fsync
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "aio_fsync"
               }"
               end

	aio_fsync64 (an_operation: INTEGER; an_aiocbp: POINTER): INTEGER 

		-- function aio_fsync64 (in `/usr/include/aio.h')
               -- aio_fsync64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "aio_fsync64"
               }"
               end

	aio_init (an_init: POINTER) 

		-- function aio_init (in `/usr/include/aio.h')
               -- aio_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "aio_init"
               }"
               end

	aio_read (an_aiocbp: POINTER): INTEGER 

		-- function aio_read (in `/usr/include/aio.h')
               -- aio_read
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "aio_read"
               }"
               end

	aio_read64 (an_aiocbp: POINTER): INTEGER 

		-- function aio_read64 (in `/usr/include/aio.h')
               -- aio_read64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "aio_read64"
               }"
               end

	aio_return (an_aiocbp: POINTER): like long 

		-- function aio_return (in `/usr/include/aio.h')
               -- aio_return
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "aio_return"
               }"
               end

	aio_return64 (an_aiocbp: POINTER): like long 

		-- function aio_return64 (in `/usr/include/aio.h')
               -- aio_return64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "aio_return64"
               }"
               end

	aio_suspend (a_list: POINTER; a_nent: INTEGER; a_timeout: POINTER): INTEGER 

		-- function aio_suspend (in `/usr/include/aio.h')
               -- aio_suspend
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "aio_suspend"
               }"
               end

	aio_suspend64 (a_list: POINTER; a_nent: INTEGER; a_timeout: POINTER): INTEGER 

		-- function aio_suspend64 (in `/usr/include/aio.h')
               -- aio_suspend64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "aio_suspend64"
               }"
               end

	aio_write (an_aiocbp: POINTER): INTEGER 

		-- function aio_write (in `/usr/include/aio.h')
               -- aio_write
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "aio_write"
               }"
               end

	aio_write64 (an_aiocbp: POINTER): INTEGER 

		-- function aio_write64 (in `/usr/include/aio.h')
               -- aio_write64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "aio_write64"
               }"
               end

	lio_listio (a_mode: INTEGER; a_list: POINTER; a_nent: INTEGER; a_sig: POINTER): INTEGER 

		-- function lio_listio (in `/usr/include/aio.h')
               -- lio_listio
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "lio_listio"
               }"
               end

	lio_listio64 (a_mode: INTEGER; a_list: POINTER; a_nent: INTEGER; a_sig: POINTER): INTEGER 

		-- function lio_listio64 (in `/usr/include/aio.h')
               -- lio_listio64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "lio_listio64"
               }"
               end


end -- class AIO_EXTERNALS
