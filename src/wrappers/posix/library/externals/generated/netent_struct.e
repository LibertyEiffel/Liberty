-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class NETENT_STRUCT
-- Wrapper of struct netent defined in file /usr/include/x86_64-linux-gnu/bits/netdb.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   netent_struct_set_n_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for n_name field of NETENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "netent_struct_set_n_name"
      }"
      end

   netent_struct_set_n_aliases (a_structure: POINTER; a_value: POINTER) 
         -- Setter for n_aliases field of NETENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "netent_struct_set_n_aliases"
      }"
      end

   netent_struct_set_n_addrtype (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for n_addrtype field of NETENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "netent_struct_set_n_addrtype"
      }"
      end

   netent_struct_set_n_net (a_structure: POINTER; a_value: like uint32_t) 
         -- Setter for n_net field of NETENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "netent_struct_set_n_net"
      }"
      end

feature {} -- Low-level queries

   netent_struct_get_n_name (a_structure: POINTER): POINTER 
         -- Query for n_name field of NETENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "netent_struct_get_n_name"
      }"
      end

   netent_struct_get_n_aliases (a_structure: POINTER): POINTER 
         -- Query for n_aliases field of NETENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "netent_struct_get_n_aliases"
      }"
      end

   netent_struct_get_n_addrtype (a_structure: POINTER): INTEGER 
         -- Query for n_addrtype field of NETENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "netent_struct_get_n_addrtype"
      }"
      end

   netent_struct_get_n_net (a_structure: POINTER): like uint32_t 
         -- Query for n_net field of NETENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "netent_struct_get_n_net"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_netent"
               }"
               end

end -- class NETENT_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
