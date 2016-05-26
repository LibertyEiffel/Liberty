-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GTYPE_VALUE_TABLE_STRUCT
-- Wrapper of struct _GTypeValueTable defined in file /usr/include/glib-2.0/gobject/gtype.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   gtype_value_table_struct_set_value_init (a_structure: POINTER; a_value: POINTER) 
         -- Setter for value_init field of GTYPE_VALUE_TABLE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_value_table_struct_set_value_init"
      }"
      end

   gtype_value_table_struct_set_value_free (a_structure: POINTER; a_value: POINTER) 
         -- Setter for value_free field of GTYPE_VALUE_TABLE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_value_table_struct_set_value_free"
      }"
      end

   gtype_value_table_struct_set_value_copy (a_structure: POINTER; a_value: POINTER) 
         -- Setter for value_copy field of GTYPE_VALUE_TABLE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_value_table_struct_set_value_copy"
      }"
      end

   gtype_value_table_struct_set_value_peek_pointer (a_structure: POINTER; a_value: POINTER) 
         -- Setter for value_peek_pointer field of GTYPE_VALUE_TABLE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_value_table_struct_set_value_peek_pointer"
      }"
      end

   gtype_value_table_struct_set_collect_format (a_structure: POINTER; a_value: POINTER) 
         -- Setter for collect_format field of GTYPE_VALUE_TABLE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_value_table_struct_set_collect_format"
      }"
      end

   gtype_value_table_struct_set_collect_value (a_structure: POINTER; a_value: POINTER) 
         -- Setter for collect_value field of GTYPE_VALUE_TABLE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_value_table_struct_set_collect_value"
      }"
      end

   gtype_value_table_struct_set_lcopy_format (a_structure: POINTER; a_value: POINTER) 
         -- Setter for lcopy_format field of GTYPE_VALUE_TABLE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_value_table_struct_set_lcopy_format"
      }"
      end

   gtype_value_table_struct_set_lcopy_value (a_structure: POINTER; a_value: POINTER) 
         -- Setter for lcopy_value field of GTYPE_VALUE_TABLE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_value_table_struct_set_lcopy_value"
      }"
      end

feature {} -- Low-level queries

   gtype_value_table_struct_get_value_init (a_structure: POINTER): POINTER 
         -- Query for value_init field of GTYPE_VALUE_TABLE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_value_table_struct_get_value_init"
      }"
      end

   gtype_value_table_struct_get_value_free (a_structure: POINTER): POINTER 
         -- Query for value_free field of GTYPE_VALUE_TABLE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_value_table_struct_get_value_free"
      }"
      end

   gtype_value_table_struct_get_value_copy (a_structure: POINTER): POINTER 
         -- Query for value_copy field of GTYPE_VALUE_TABLE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_value_table_struct_get_value_copy"
      }"
      end

   gtype_value_table_struct_get_value_peek_pointer (a_structure: POINTER): POINTER 
         -- Query for value_peek_pointer field of GTYPE_VALUE_TABLE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_value_table_struct_get_value_peek_pointer"
      }"
      end

   gtype_value_table_struct_get_collect_format (a_structure: POINTER): POINTER 
         -- Query for collect_format field of GTYPE_VALUE_TABLE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_value_table_struct_get_collect_format"
      }"
      end

   gtype_value_table_struct_get_collect_value (a_structure: POINTER): POINTER 
         -- Query for collect_value field of GTYPE_VALUE_TABLE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_value_table_struct_get_collect_value"
      }"
      end

   gtype_value_table_struct_get_lcopy_format (a_structure: POINTER): POINTER 
         -- Query for lcopy_format field of GTYPE_VALUE_TABLE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_value_table_struct_get_lcopy_format"
      }"
      end

   gtype_value_table_struct_get_lcopy_value (a_structure: POINTER): POINTER 
         -- Query for lcopy_value field of GTYPE_VALUE_TABLE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_value_table_struct_get_lcopy_value"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gtype_value_table"
               }"
               end

end -- class GTYPE_VALUE_TABLE_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
