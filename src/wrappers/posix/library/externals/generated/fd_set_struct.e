-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class FD_SET_STRUCT
-- Wrapper of struct  defined in file /usr/include/x86_64-linux-gnu/sys/select.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   fd_set_struct_set_fds_bits (a_structure: POINTER; a_value: POINTER) 
         -- Setter for fds_bits field of FD_SET_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "fd_set_struct_set_fds_bits"
      }"
      end

feature {} -- Low-level queries

   fd_set_struct_get_fds_bits (a_structure: POINTER): POINTER 
         -- Query for fds_bits field of FD_SET_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "fd_set_struct_get_fds_bits"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_fd_set"
               }"
               end

end -- class FD_SET_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
