-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class IP_OPTS_STRUCT
-- Wrapper of struct ip_opts defined in file /usr/include/x86_64-linux-gnu/bits/in.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   ip_opts_struct_set_ip_opts (a_structure: POINTER; a_value: POINTER) 
         -- Setter for ip_opts field of IP_OPTS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ip_opts_struct_set_ip_opts"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field ip_dst.
   ip_opts_struct_get_ip_opts (a_structure: POINTER): POINTER 
         -- Query for ip_opts field of IP_OPTS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ip_opts_struct_get_ip_opts"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_ip_opts"
               }"
               end

end -- class IP_OPTS_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
