-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class IN_PKTINFO_STRUCT
-- Wrapper of struct in_pktinfo defined in file /usr/include/x86_64-linux-gnu/bits/in.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   in_pktinfo_struct_set_ipi_ifindex (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for ipi_ifindex field of IN_PKTINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "in_pktinfo_struct_set_ipi_ifindex"
      }"
      end

feature {} -- Low-level queries

   in_pktinfo_struct_get_ipi_ifindex (a_structure: POINTER): INTEGER 
         -- Query for ipi_ifindex field of IN_PKTINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "in_pktinfo_struct_get_ipi_ifindex"
      }"
      end

	-- Unwrappable field ipi_spec_dst.
	-- Unwrappable field ipi_addr.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_in_pktinfo"
               }"
               end

end -- class IN_PKTINFO_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
