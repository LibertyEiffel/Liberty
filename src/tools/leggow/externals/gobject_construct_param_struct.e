-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GOBJECT_CONSTRUCT_PARAM_STRUCT
-- Wrapper of struct _GObjectConstructParam defined in file /usr/include/glib-2.0/gobject/gobject.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   gobject_construct_param_struct_set_pspec (a_structure: POINTER; a_value: POINTER) 
         -- Setter for pspec field of GOBJECT_CONSTRUCT_PARAM_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gobject_construct_param_struct_set_pspec"
      }"
      end

   gobject_construct_param_struct_set_value (a_structure: POINTER; a_value: POINTER) 
         -- Setter for value field of GOBJECT_CONSTRUCT_PARAM_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gobject_construct_param_struct_set_value"
      }"
      end

feature {} -- Low-level queries

   gobject_construct_param_struct_get_pspec (a_structure: POINTER): POINTER 
         -- Query for pspec field of GOBJECT_CONSTRUCT_PARAM_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gobject_construct_param_struct_get_pspec"
      }"
      end

   gobject_construct_param_struct_get_value (a_structure: POINTER): POINTER 
         -- Query for value field of GOBJECT_CONSTRUCT_PARAM_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gobject_construct_param_struct_get_value"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gobject_construct_param"
               }"
               end

end -- class GOBJECT_CONSTRUCT_PARAM_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
