-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GTYPE_MODULE_STRUCT
-- Wrapper of struct _GTypeModule defined in file /usr/include/glib-2.0/gobject/gtypemodule.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   gtype_module_struct_set_use_count (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for use_count field of GTYPE_MODULE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_module_struct_set_use_count"
      }"
      end

   gtype_module_struct_set_type_infos (a_structure: POINTER; a_value: POINTER) 
         -- Setter for type_infos field of GTYPE_MODULE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_module_struct_set_type_infos"
      }"
      end

   gtype_module_struct_set_interface_infos (a_structure: POINTER; a_value: POINTER) 
         -- Setter for interface_infos field of GTYPE_MODULE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_module_struct_set_interface_infos"
      }"
      end

   gtype_module_struct_set_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for name field of GTYPE_MODULE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_module_struct_set_name"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
   gtype_module_struct_get_use_count (a_structure: POINTER): NATURAL 
         -- Query for use_count field of GTYPE_MODULE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_module_struct_get_use_count"
      }"
      end

   gtype_module_struct_get_type_infos (a_structure: POINTER): POINTER 
         -- Query for type_infos field of GTYPE_MODULE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_module_struct_get_type_infos"
      }"
      end

   gtype_module_struct_get_interface_infos (a_structure: POINTER): POINTER 
         -- Query for interface_infos field of GTYPE_MODULE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_module_struct_get_interface_infos"
      }"
      end

   gtype_module_struct_get_name (a_structure: POINTER): POINTER 
         -- Query for name field of GTYPE_MODULE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_module_struct_get_name"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gtype_module"
               }"
               end

end -- class GTYPE_MODULE_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
