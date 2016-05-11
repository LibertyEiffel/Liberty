-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class IP_MREQN_STRUCT
-- Wrapper of struct ip_mreqn defined in file /usr/include/x86_64-linux-gnu/bits/in.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   ip_mreqn_struct_set_imr_ifindex (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for imr_ifindex field of IP_MREQN_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ip_mreqn_struct_set_imr_ifindex"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field imr_multiaddr.
	-- Unwrappable field imr_address.
   ip_mreqn_struct_get_imr_ifindex (a_structure: POINTER): INTEGER 
         -- Query for imr_ifindex field of IP_MREQN_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ip_mreqn_struct_get_imr_ifindex"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_ip_mreqn"
               }"
               end

end -- class IP_MREQN_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
