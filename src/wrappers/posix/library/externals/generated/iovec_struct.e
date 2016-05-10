-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class IOVEC_STRUCT
-- Wrapper of struct iovec defined in file /usr/include/x86_64-linux-gnu/bits/uio.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   iovec_struct_set_iov_base (a_structure: POINTER; a_value: POINTER) 
         -- Setter for iov_base field of IOVEC_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "iovec_struct_set_iov_base"
      }"
      end

   iovec_struct_set_iov_len (a_structure: POINTER; a_value: like size_t) 
         -- Setter for iov_len field of IOVEC_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "iovec_struct_set_iov_len"
      }"
      end

feature {} -- Low-level queries

   iovec_struct_get_iov_base (a_structure: POINTER): POINTER 
         -- Query for iov_base field of IOVEC_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "iovec_struct_get_iov_base"
      }"
      end

   iovec_struct_get_iov_len (a_structure: POINTER): like size_t 
         -- Query for iov_len field of IOVEC_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "iovec_struct_get_iov_len"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_iovec"
               }"
               end

end -- class IOVEC_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
