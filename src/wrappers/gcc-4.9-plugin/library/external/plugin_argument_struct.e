-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class PLUGIN_ARGUMENT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GCC_4_9_PLUGIN_TYPES
feature {} -- Low-level setters

   plugin_argument_struct_set_key (a_structure: POINTER; a_value: POINTER) 
         -- Setter for key field of PLUGIN_ARGUMENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_argument_struct_set_key"
      }"
      end

   plugin_argument_struct_set_value (a_structure: POINTER; a_value: POINTER) 
         -- Setter for value field of PLUGIN_ARGUMENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_argument_struct_set_value"
      }"
      end

feature {} -- Low-level queries

   plugin_argument_struct_get_key (a_structure: POINTER): POINTER 
         -- Query for key field of PLUGIN_ARGUMENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_argument_struct_get_key"
      }"
      end

   plugin_argument_struct_get_value (a_structure: POINTER): POINTER 
         -- Query for value field of PLUGIN_ARGUMENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_argument_struct_get_value"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_plugin_argument"
               }"
               end

end -- class PLUGIN_ARGUMENT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
