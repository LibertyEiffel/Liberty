-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SOCKADDR_STRUCT
-- Wrapper of struct sockaddr defined in file /usr/include/x86_64-linux-gnu/bits/socket.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   sockaddr_struct_set_sa_family (a_structure: POINTER; a_value: NATURAL_16) 
         -- Setter for sa_family field of SOCKADDR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sockaddr_struct_set_sa_family"
      }"
      end

   sockaddr_struct_set_sa_data (a_structure: POINTER; a_value: POINTER) 
         -- Setter for sa_data field of SOCKADDR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sockaddr_struct_set_sa_data"
      }"
      end

feature {} -- Low-level queries

   sockaddr_struct_get_sa_family (a_structure: POINTER): NATURAL_16 
         -- Query for sa_family field of SOCKADDR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sockaddr_struct_get_sa_family"
      }"
      end

   sockaddr_struct_get_sa_data (a_structure: POINTER): POINTER 
         -- Query for sa_data field of SOCKADDR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sockaddr_struct_get_sa_data"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_sockaddr"
               }"
               end

end -- class SOCKADDR_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
