-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GROUP_SOURCE_REQ_STRUCT
-- Wrapper of struct group_source_req defined in file /usr/include/netinet/in.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   group_source_req_struct_set_gsr_interface (a_structure: POINTER; a_value: like uint32_t) 
         -- Setter for gsr_interface field of GROUP_SOURCE_REQ_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "group_source_req_struct_set_gsr_interface"
      }"
      end

feature {} -- Low-level queries

   group_source_req_struct_get_gsr_interface (a_structure: POINTER): like uint32_t 
         -- Query for gsr_interface field of GROUP_SOURCE_REQ_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "group_source_req_struct_get_gsr_interface"
      }"
      end

	-- Unwrappable field gsr_group.
	-- Unwrappable field gsr_source.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_group_source_req"
               }"
               end

end -- class GROUP_SOURCE_REQ_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
