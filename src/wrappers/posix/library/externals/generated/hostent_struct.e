-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class HOSTENT_STRUCT
-- Wrapper of struct hostent defined in file /usr/include/netdb.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   hostent_struct_set_h_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for h_name field of HOSTENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "hostent_struct_set_h_name"
      }"
      end

   hostent_struct_set_h_aliases (a_structure: POINTER; a_value: POINTER) 
         -- Setter for h_aliases field of HOSTENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "hostent_struct_set_h_aliases"
      }"
      end

   hostent_struct_set_h_addrtype (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for h_addrtype field of HOSTENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "hostent_struct_set_h_addrtype"
      }"
      end

   hostent_struct_set_h_length (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for h_length field of HOSTENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "hostent_struct_set_h_length"
      }"
      end

   hostent_struct_set_h_addr_list (a_structure: POINTER; a_value: POINTER) 
         -- Setter for h_addr_list field of HOSTENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "hostent_struct_set_h_addr_list"
      }"
      end

feature {} -- Low-level queries

   hostent_struct_get_h_name (a_structure: POINTER): POINTER 
         -- Query for h_name field of HOSTENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "hostent_struct_get_h_name"
      }"
      end

   hostent_struct_get_h_aliases (a_structure: POINTER): POINTER 
         -- Query for h_aliases field of HOSTENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "hostent_struct_get_h_aliases"
      }"
      end

   hostent_struct_get_h_addrtype (a_structure: POINTER): INTEGER 
         -- Query for h_addrtype field of HOSTENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "hostent_struct_get_h_addrtype"
      }"
      end

   hostent_struct_get_h_length (a_structure: POINTER): INTEGER 
         -- Query for h_length field of HOSTENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "hostent_struct_get_h_length"
      }"
      end

   hostent_struct_get_h_addr_list (a_structure: POINTER): POINTER 
         -- Query for h_addr_list field of HOSTENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "hostent_struct_get_h_addr_list"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_hostent"
               }"
               end

end -- class HOSTENT_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
