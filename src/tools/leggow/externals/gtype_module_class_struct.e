-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GTYPE_MODULE_CLASS_STRUCT
-- Wrapper of struct _GTypeModuleClass defined in file /usr/include/glib-2.0/gobject/gtypemodule.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   gtype_module_class_struct_set_load (a_structure: POINTER; a_value: POINTER) 
         -- Setter for load field of GTYPE_MODULE_CLASS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_module_class_struct_set_load"
      }"
      end

   gtype_module_class_struct_set_unload (a_structure: POINTER; a_value: POINTER) 
         -- Setter for unload field of GTYPE_MODULE_CLASS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_module_class_struct_set_unload"
      }"
      end

   gtype_module_class_struct_set_reserved1 (a_structure: POINTER; a_value: POINTER) 
         -- Setter for reserved1 field of GTYPE_MODULE_CLASS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_module_class_struct_set_reserved1"
      }"
      end

   gtype_module_class_struct_set_reserved2 (a_structure: POINTER; a_value: POINTER) 
         -- Setter for reserved2 field of GTYPE_MODULE_CLASS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_module_class_struct_set_reserved2"
      }"
      end

   gtype_module_class_struct_set_reserved3 (a_structure: POINTER; a_value: POINTER) 
         -- Setter for reserved3 field of GTYPE_MODULE_CLASS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_module_class_struct_set_reserved3"
      }"
      end

   gtype_module_class_struct_set_reserved4 (a_structure: POINTER; a_value: POINTER) 
         -- Setter for reserved4 field of GTYPE_MODULE_CLASS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_module_class_struct_set_reserved4"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
   gtype_module_class_struct_get_load (a_structure: POINTER): POINTER 
         -- Query for load field of GTYPE_MODULE_CLASS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_module_class_struct_get_load"
      }"
      end

   gtype_module_class_struct_get_unload (a_structure: POINTER): POINTER 
         -- Query for unload field of GTYPE_MODULE_CLASS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_module_class_struct_get_unload"
      }"
      end

   gtype_module_class_struct_get_reserved1 (a_structure: POINTER): POINTER 
         -- Query for reserved1 field of GTYPE_MODULE_CLASS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_module_class_struct_get_reserved1"
      }"
      end

   gtype_module_class_struct_get_reserved2 (a_structure: POINTER): POINTER 
         -- Query for reserved2 field of GTYPE_MODULE_CLASS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_module_class_struct_get_reserved2"
      }"
      end

   gtype_module_class_struct_get_reserved3 (a_structure: POINTER): POINTER 
         -- Query for reserved3 field of GTYPE_MODULE_CLASS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_module_class_struct_get_reserved3"
      }"
      end

   gtype_module_class_struct_get_reserved4 (a_structure: POINTER): POINTER 
         -- Query for reserved4 field of GTYPE_MODULE_CLASS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_module_class_struct_get_reserved4"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gtype_module_class"
               }"
               end

end -- class GTYPE_MODULE_CLASS_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
