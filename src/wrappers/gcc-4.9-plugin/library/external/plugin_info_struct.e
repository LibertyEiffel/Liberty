-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class PLUGIN_INFO_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GCC_4_9_PLUGIN_TYPES
feature {} -- Low-level setters

   plugin_info_struct_set_version (a_structure: POINTER; a_value: POINTER) 
         -- Setter for version field of PLUGIN_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_info_struct_set_version"
      }"
      end

   plugin_info_struct_set_help (a_structure: POINTER; a_value: POINTER) 
         -- Setter for help field of PLUGIN_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_info_struct_set_help"
      }"
      end

feature {} -- Low-level queries

   plugin_info_struct_get_version (a_structure: POINTER): POINTER 
         -- Query for version field of PLUGIN_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_info_struct_get_version"
      }"
      end

   plugin_info_struct_get_help (a_structure: POINTER): POINTER 
         -- Query for help field of PLUGIN_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_info_struct_get_help"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_plugin_info"
               }"
               end

end -- class PLUGIN_INFO_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
