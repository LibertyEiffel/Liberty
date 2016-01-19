-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class PLUGIN_GCC_VERSION_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GCC_4_9_PLUGIN_TYPES
feature {} -- Low-level setters

   plugin_gcc_version_struct_set_basever (a_structure: POINTER; a_value: POINTER) 
         -- Setter for basever field of PLUGIN_GCC_VERSION_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_gcc_version_struct_set_basever"
      }"
      end

   plugin_gcc_version_struct_set_datestamp (a_structure: POINTER; a_value: POINTER) 
         -- Setter for datestamp field of PLUGIN_GCC_VERSION_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_gcc_version_struct_set_datestamp"
      }"
      end

   plugin_gcc_version_struct_set_devphase (a_structure: POINTER; a_value: POINTER) 
         -- Setter for devphase field of PLUGIN_GCC_VERSION_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_gcc_version_struct_set_devphase"
      }"
      end

   plugin_gcc_version_struct_set_revision (a_structure: POINTER; a_value: POINTER) 
         -- Setter for revision field of PLUGIN_GCC_VERSION_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_gcc_version_struct_set_revision"
      }"
      end

   plugin_gcc_version_struct_set_configuration_arguments (a_structure: POINTER; a_value: POINTER) 
         -- Setter for configuration_arguments field of PLUGIN_GCC_VERSION_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_gcc_version_struct_set_configuration_arguments"
      }"
      end

feature {} -- Low-level queries

   plugin_gcc_version_struct_get_basever (a_structure: POINTER): POINTER 
         -- Query for basever field of PLUGIN_GCC_VERSION_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_gcc_version_struct_get_basever"
      }"
      end

   plugin_gcc_version_struct_get_datestamp (a_structure: POINTER): POINTER 
         -- Query for datestamp field of PLUGIN_GCC_VERSION_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_gcc_version_struct_get_datestamp"
      }"
      end

   plugin_gcc_version_struct_get_devphase (a_structure: POINTER): POINTER 
         -- Query for devphase field of PLUGIN_GCC_VERSION_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_gcc_version_struct_get_devphase"
      }"
      end

   plugin_gcc_version_struct_get_revision (a_structure: POINTER): POINTER 
         -- Query for revision field of PLUGIN_GCC_VERSION_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_gcc_version_struct_get_revision"
      }"
      end

   plugin_gcc_version_struct_get_configuration_arguments (a_structure: POINTER): POINTER 
         -- Query for configuration_arguments field of PLUGIN_GCC_VERSION_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "plugin_gcc_version_struct_get_configuration_arguments"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_plugin_gcc_version"
               }"
               end

end -- class PLUGIN_GCC_VERSION_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
