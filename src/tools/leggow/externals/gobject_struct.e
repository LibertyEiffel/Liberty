-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GOBJECT_STRUCT
-- Wrapper of struct _GObject defined in file /usr/include/glib-2.0/gobject/gobject.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   gobject_struct_set_ref_count (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for ref_count field of GOBJECT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gobject_struct_set_ref_count"
      }"
      end

   gobject_struct_set_qdata (a_structure: POINTER; a_value: POINTER) 
         -- Setter for qdata field of GOBJECT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gobject_struct_set_qdata"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field g_type_instance.
   gobject_struct_get_ref_count (a_structure: POINTER): NATURAL 
         -- Query for ref_count field of GOBJECT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gobject_struct_get_ref_count"
      }"
      end

   gobject_struct_get_qdata (a_structure: POINTER): POINTER 
         -- Query for qdata field of GOBJECT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gobject_struct_get_qdata"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gobject"
               }"
               end

end -- class GOBJECT_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
