-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SOCKADDR_UN_STRUCT
-- Wrapper of struct sockaddr_un defined in file /usr/include/x86_64-linux-gnu/sys/un.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   sockaddr_un_struct_set_sun_family (a_structure: POINTER; a_value: NATURAL_16) 
         -- Setter for sun_family field of SOCKADDR_UN_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sockaddr_un_struct_set_sun_family"
      }"
      end

   sockaddr_un_struct_set_sun_path (a_structure: POINTER; a_value: POINTER) 
         -- Setter for sun_path field of SOCKADDR_UN_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sockaddr_un_struct_set_sun_path"
      }"
      end

feature {} -- Low-level queries

   sockaddr_un_struct_get_sun_family (a_structure: POINTER): NATURAL_16 
         -- Query for sun_family field of SOCKADDR_UN_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sockaddr_un_struct_get_sun_family"
      }"
      end

   sockaddr_un_struct_get_sun_path (a_structure: POINTER): POINTER 
         -- Query for sun_path field of SOCKADDR_UN_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sockaddr_un_struct_get_sun_path"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_sockaddr_un"
               }"
               end

end -- class SOCKADDR_UN_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
