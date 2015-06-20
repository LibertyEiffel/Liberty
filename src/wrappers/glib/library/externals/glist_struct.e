-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GLIST_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

   glist_struct_set_data (a_structure: POINTER; a_value: POINTER) 
         -- Setter for data field of GLIST_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "glist_struct_set_data"
      }"
      end

   glist_struct_set_next (a_structure: POINTER; a_value: POINTER) 
         -- Setter for next field of GLIST_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "glist_struct_set_next"
      }"
      end

   glist_struct_set_prev (a_structure: POINTER; a_value: POINTER) 
         -- Setter for prev field of GLIST_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "glist_struct_set_prev"
      }"
      end

feature {} -- Low-level queries

   glist_struct_get_data (a_structure: POINTER): POINTER 
         -- Query for data field of GLIST_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "glist_struct_get_data"
      }"
      end

   glist_struct_get_next (a_structure: POINTER): POINTER 
         -- Query for next field of GLIST_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "glist_struct_get_next"
      }"
      end

   glist_struct_get_prev (a_structure: POINTER): POINTER 
         -- Query for prev field of GLIST_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "glist_struct_get_prev"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GList"
               }"
               end

end -- class GLIST_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
