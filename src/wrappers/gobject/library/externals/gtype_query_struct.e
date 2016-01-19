-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GTYPE_QUERY_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

   gtype_query_struct_set_type (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for type field of GTYPE_QUERY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_query_struct_set_type"
      }"
      end

   gtype_query_struct_set_type_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for type_name field of GTYPE_QUERY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_query_struct_set_type_name"
      }"
      end

   gtype_query_struct_set_class_size (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for class_size field of GTYPE_QUERY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_query_struct_set_class_size"
      }"
      end

   gtype_query_struct_set_instance_size (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for instance_size field of GTYPE_QUERY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_query_struct_set_instance_size"
      }"
      end

feature {} -- Low-level queries

   gtype_query_struct_get_type (a_structure: POINTER): like long_unsigned 
         -- Query for type field of GTYPE_QUERY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_query_struct_get_type"
      }"
      end

   gtype_query_struct_get_type_name (a_structure: POINTER): POINTER 
         -- Query for type_name field of GTYPE_QUERY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_query_struct_get_type_name"
      }"
      end

   gtype_query_struct_get_class_size (a_structure: POINTER): NATURAL 
         -- Query for class_size field of GTYPE_QUERY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_query_struct_get_class_size"
      }"
      end

   gtype_query_struct_get_instance_size (a_structure: POINTER): NATURAL 
         -- Query for instance_size field of GTYPE_QUERY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_query_struct_get_instance_size"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GTypeQuery"
               }"
               end

end -- class GTYPE_QUERY_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
