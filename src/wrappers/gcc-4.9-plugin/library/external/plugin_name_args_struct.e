-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class PLUGIN_NAME_ARGS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GCC_4_9_PLUGIN_TYPES
feature {} -- Low-level setters

   plugin_name_args_struct_set_base_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for base_name field of PLUGIN_NAME_ARGS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_name_args_struct_set_base_name"
      }"
      end

   plugin_name_args_struct_set_full_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for full_name field of PLUGIN_NAME_ARGS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_name_args_struct_set_full_name"
      }"
      end

   plugin_name_args_struct_set_argc (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for argc field of PLUGIN_NAME_ARGS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_name_args_struct_set_argc"
      }"
      end

   plugin_name_args_struct_set_argv (a_structure: POINTER; a_value: POINTER) 
         -- Setter for argv field of PLUGIN_NAME_ARGS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_name_args_struct_set_argv"
      }"
      end

   plugin_name_args_struct_set_version (a_structure: POINTER; a_value: POINTER) 
         -- Setter for version field of PLUGIN_NAME_ARGS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_name_args_struct_set_version"
      }"
      end

   plugin_name_args_struct_set_help (a_structure: POINTER; a_value: POINTER) 
         -- Setter for help field of PLUGIN_NAME_ARGS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_name_args_struct_set_help"
      }"
      end

feature {} -- Low-level queries

   plugin_name_args_struct_get_base_name (a_structure: POINTER): POINTER 
         -- Query for base_name field of PLUGIN_NAME_ARGS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_name_args_struct_get_base_name"
      }"
      end

   plugin_name_args_struct_get_full_name (a_structure: POINTER): POINTER 
         -- Query for full_name field of PLUGIN_NAME_ARGS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_name_args_struct_get_full_name"
      }"
      end

   plugin_name_args_struct_get_argc (a_structure: POINTER): INTEGER 
         -- Query for argc field of PLUGIN_NAME_ARGS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_name_args_struct_get_argc"
      }"
      end

   plugin_name_args_struct_get_argv (a_structure: POINTER): POINTER 
         -- Query for argv field of PLUGIN_NAME_ARGS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_name_args_struct_get_argv"
      }"
      end

   plugin_name_args_struct_get_version (a_structure: POINTER): POINTER 
         -- Query for version field of PLUGIN_NAME_ARGS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_name_args_struct_get_version"
      }"
      end

   plugin_name_args_struct_get_help (a_structure: POINTER): POINTER 
         -- Query for help field of PLUGIN_NAME_ARGS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_name_args_struct_get_help"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_plugin_name_args"
               }"
               end

end -- class PLUGIN_NAME_ARGS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
