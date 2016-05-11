-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class IFADDR_STRUCT
-- Wrapper of struct ifaddr defined in file /usr/include/net/if.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   ifaddr_struct_set_ifa_ifp (a_structure: POINTER; a_value: POINTER) 
         -- Setter for ifa_ifp field of IFADDR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ifaddr_struct_set_ifa_ifp"
      }"
      end

   ifaddr_struct_set_ifa_next (a_structure: POINTER; a_value: POINTER) 
         -- Setter for ifa_next field of IFADDR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ifaddr_struct_set_ifa_next"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field ifa_addr.
	-- Unwrappable field ifa_ifu.
   ifaddr_struct_get_ifa_ifp (a_structure: POINTER): POINTER 
         -- Query for ifa_ifp field of IFADDR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ifaddr_struct_get_ifa_ifp"
      }"
      end

   ifaddr_struct_get_ifa_next (a_structure: POINTER): POINTER 
         -- Query for ifa_next field of IFADDR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ifaddr_struct_get_ifa_next"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_ifaddr"
               }"
               end

end -- class IFADDR_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
