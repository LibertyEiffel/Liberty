-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GIATTRIBUTE_ITER_STRUCT
-- Wrapper of struct  defined in file /usr/include/gobject-introspection-1.0/gibaseinfo.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   giattribute_iter_struct_set_data (a_structure: POINTER; a_value: POINTER) 
         -- Setter for data field of GIATTRIBUTE_ITER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giattribute_iter_struct_set_data"
      }"
      end

   giattribute_iter_struct_set_data2 (a_structure: POINTER; a_value: POINTER) 
         -- Setter for data2 field of GIATTRIBUTE_ITER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giattribute_iter_struct_set_data2"
      }"
      end

   giattribute_iter_struct_set_data3 (a_structure: POINTER; a_value: POINTER) 
         -- Setter for data3 field of GIATTRIBUTE_ITER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giattribute_iter_struct_set_data3"
      }"
      end

   giattribute_iter_struct_set_data4 (a_structure: POINTER; a_value: POINTER) 
         -- Setter for data4 field of GIATTRIBUTE_ITER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giattribute_iter_struct_set_data4"
      }"
      end

feature {} -- Low-level queries

   giattribute_iter_struct_get_data (a_structure: POINTER): POINTER 
         -- Query for data field of GIATTRIBUTE_ITER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giattribute_iter_struct_get_data"
      }"
      end

   giattribute_iter_struct_get_data2 (a_structure: POINTER): POINTER 
         -- Query for data2 field of GIATTRIBUTE_ITER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giattribute_iter_struct_get_data2"
      }"
      end

   giattribute_iter_struct_get_data3 (a_structure: POINTER): POINTER 
         -- Query for data3 field of GIATTRIBUTE_ITER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giattribute_iter_struct_get_data3"
      }"
      end

   giattribute_iter_struct_get_data4 (a_structure: POINTER): POINTER 
         -- Query for data4 field of GIATTRIBUTE_ITER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "giattribute_iter_struct_get_data4"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_GIAttributeIter"
               }"
               end

end -- class GIATTRIBUTE_ITER_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
