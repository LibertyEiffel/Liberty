-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SOCKADDR_STORAGE_STRUCT
-- Wrapper of struct sockaddr_storage defined in file /usr/include/x86_64-linux-gnu/bits/socket.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   sockaddr_storage_struct_set_ss_family (a_structure: POINTER; a_value: NATURAL_16) 
         -- Setter for ss_family field of SOCKADDR_STORAGE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sockaddr_storage_struct_set_ss_family"
      }"
      end

feature {} -- Low-level queries

   sockaddr_storage_struct_get_ss_family (a_structure: POINTER): NATURAL_16 
         -- Query for ss_family field of SOCKADDR_STORAGE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sockaddr_storage_struct_get_ss_family"
      }"
      end

	-- Unwrapped private field __ss_align.
	-- Unwrapped private field __ss_padding.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_sockaddr_storage"
               }"
               end

end -- class SOCKADDR_STORAGE_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
