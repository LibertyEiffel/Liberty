-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GNODE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

   gnode_struct_set_data (a_structure: POINTER; a_value: POINTER) 
         -- Setter for data field of GNODE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gnode_struct_set_data"
      }"
      end

   gnode_struct_set_next (a_structure: POINTER; a_value: POINTER) 
         -- Setter for next field of GNODE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gnode_struct_set_next"
      }"
      end

   gnode_struct_set_prev (a_structure: POINTER; a_value: POINTER) 
         -- Setter for prev field of GNODE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gnode_struct_set_prev"
      }"
      end

   gnode_struct_set_parent (a_structure: POINTER; a_value: POINTER) 
         -- Setter for parent field of GNODE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gnode_struct_set_parent"
      }"
      end

   gnode_struct_set_children (a_structure: POINTER; a_value: POINTER) 
         -- Setter for children field of GNODE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gnode_struct_set_children"
      }"
      end

feature {} -- Low-level queries

   gnode_struct_get_data (a_structure: POINTER): POINTER 
         -- Query for data field of GNODE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gnode_struct_get_data"
      }"
      end

   gnode_struct_get_next (a_structure: POINTER): POINTER 
         -- Query for next field of GNODE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gnode_struct_get_next"
      }"
      end

   gnode_struct_get_prev (a_structure: POINTER): POINTER 
         -- Query for prev field of GNODE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gnode_struct_get_prev"
      }"
      end

   gnode_struct_get_parent (a_structure: POINTER): POINTER 
         -- Query for parent field of GNODE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gnode_struct_get_parent"
      }"
      end

   gnode_struct_get_children (a_structure: POINTER): POINTER 
         -- Query for children field of GNODE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gnode_struct_get_children"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GNode"
               }"
               end

end -- class GNODE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
