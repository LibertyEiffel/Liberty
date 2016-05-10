-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class AIOCB64_STRUCT
-- Wrapper of struct aiocb64 defined in file /usr/include/aio.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   aiocb64_struct_set_aio_fildes (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for aio_fildes field of AIOCB64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aiocb64_struct_set_aio_fildes"
      }"
      end

   aiocb64_struct_set_aio_lio_opcode (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for aio_lio_opcode field of AIOCB64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aiocb64_struct_set_aio_lio_opcode"
      }"
      end

   aiocb64_struct_set_aio_reqprio (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for aio_reqprio field of AIOCB64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aiocb64_struct_set_aio_reqprio"
      }"
      end

   aiocb64_struct_set_aio_buf (a_structure: POINTER; a_value: POINTER) 
         -- Setter for aio_buf field of AIOCB64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aiocb64_struct_set_aio_buf"
      }"
      end

   aiocb64_struct_set_aio_nbytes (a_structure: POINTER; a_value: like size_t) 
         -- Setter for aio_nbytes field of AIOCB64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aiocb64_struct_set_aio_nbytes"
      }"
      end

   aiocb64_struct_set_aio_offset (a_structure: POINTER; a_value: like long) 
         -- Setter for aio_offset field of AIOCB64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aiocb64_struct_set_aio_offset"
      }"
      end

feature {} -- Low-level queries

   aiocb64_struct_get_aio_fildes (a_structure: POINTER): INTEGER 
         -- Query for aio_fildes field of AIOCB64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aiocb64_struct_get_aio_fildes"
      }"
      end

   aiocb64_struct_get_aio_lio_opcode (a_structure: POINTER): INTEGER 
         -- Query for aio_lio_opcode field of AIOCB64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aiocb64_struct_get_aio_lio_opcode"
      }"
      end

   aiocb64_struct_get_aio_reqprio (a_structure: POINTER): INTEGER 
         -- Query for aio_reqprio field of AIOCB64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aiocb64_struct_get_aio_reqprio"
      }"
      end

   aiocb64_struct_get_aio_buf (a_structure: POINTER): POINTER 
         -- Query for aio_buf field of AIOCB64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aiocb64_struct_get_aio_buf"
      }"
      end

   aiocb64_struct_get_aio_nbytes (a_structure: POINTER): like size_t 
         -- Query for aio_nbytes field of AIOCB64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aiocb64_struct_get_aio_nbytes"
      }"
      end

	-- Unwrappable field aio_sigevent.
	-- Unwrapped private field __next_prio.
	-- Unwrapped private field __abs_prio.
	-- Unwrapped private field __policy.
	-- Unwrapped private field __error_code.
	-- Unwrapped private field __return_value.
   aiocb64_struct_get_aio_offset (a_structure: POINTER): like long 
         -- Query for aio_offset field of AIOCB64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aiocb64_struct_get_aio_offset"
      }"
      end

	-- Unwrapped private field __glibc_reserved.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_aiocb64"
               }"
               end

end -- class AIOCB64_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
