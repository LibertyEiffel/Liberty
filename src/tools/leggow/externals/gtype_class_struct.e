-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GTYPE_CLASS_STRUCT
-- Wrapper of struct _GTypeClass defined in file /usr/include/glib-2.0/gobject/gtype.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   gtype_class_struct_set_g_type (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for g_type field of GTYPE_CLASS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_class_struct_set_g_type"
      }"
      end

feature {} -- Low-level queries

   gtype_class_struct_get_g_type (a_structure: POINTER): like long_unsigned 
         -- Query for g_type field of GTYPE_CLASS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_class_struct_get_g_type"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gtype_class"
               }"
               end

end -- class GTYPE_CLASS_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
