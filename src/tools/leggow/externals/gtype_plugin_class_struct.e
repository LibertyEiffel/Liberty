-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GTYPE_PLUGIN_CLASS_STRUCT
-- Wrapper of struct _GTypePluginClass defined in file /usr/include/glib-2.0/gobject/gtypeplugin.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   gtype_plugin_class_struct_set_use_plugin (a_structure: POINTER; a_value: POINTER) 
         -- Setter for use_plugin field of GTYPE_PLUGIN_CLASS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_plugin_class_struct_set_use_plugin"
      }"
      end

   gtype_plugin_class_struct_set_unuse_plugin (a_structure: POINTER; a_value: POINTER) 
         -- Setter for unuse_plugin field of GTYPE_PLUGIN_CLASS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_plugin_class_struct_set_unuse_plugin"
      }"
      end

   gtype_plugin_class_struct_set_complete_type_info (a_structure: POINTER; a_value: POINTER) 
         -- Setter for complete_type_info field of GTYPE_PLUGIN_CLASS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_plugin_class_struct_set_complete_type_info"
      }"
      end

   gtype_plugin_class_struct_set_complete_interface_info (a_structure: POINTER; a_value: POINTER) 
         -- Setter for complete_interface_info field of GTYPE_PLUGIN_CLASS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_plugin_class_struct_set_complete_interface_info"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field base_iface.
   gtype_plugin_class_struct_get_use_plugin (a_structure: POINTER): POINTER 
         -- Query for use_plugin field of GTYPE_PLUGIN_CLASS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_plugin_class_struct_get_use_plugin"
      }"
      end

   gtype_plugin_class_struct_get_unuse_plugin (a_structure: POINTER): POINTER 
         -- Query for unuse_plugin field of GTYPE_PLUGIN_CLASS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_plugin_class_struct_get_unuse_plugin"
      }"
      end

   gtype_plugin_class_struct_get_complete_type_info (a_structure: POINTER): POINTER 
         -- Query for complete_type_info field of GTYPE_PLUGIN_CLASS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_plugin_class_struct_get_complete_type_info"
      }"
      end

   gtype_plugin_class_struct_get_complete_interface_info (a_structure: POINTER): POINTER 
         -- Query for complete_interface_info field of GTYPE_PLUGIN_CLASS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_plugin_class_struct_get_complete_interface_info"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gtype_plugin_class"
               }"
               end

end -- class GTYPE_PLUGIN_CLASS_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
