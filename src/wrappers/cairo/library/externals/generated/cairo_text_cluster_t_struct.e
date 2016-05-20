-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class CAIRO_TEXT_CLUSTER_T_STRUCT
-- Wrapper of struct cairo_text_cluster_t defined in file /usr/include/cairo/cairo.h line 1121

insert STANDARD_C_LIBRARY_TYPES

	CAIRO_TYPES
feature {} -- Low-level setters

   cairo_text_cluster_t_struct_set_num_bytes (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for num_bytes field of CAIRO_TEXT_CLUSTER_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_text_cluster_t_struct_set_num_bytes"
      }"
      end

   cairo_text_cluster_t_struct_set_num_glyphs (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for num_glyphs field of CAIRO_TEXT_CLUSTER_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_text_cluster_t_struct_set_num_glyphs"
      }"
      end

feature {} -- Low-level queries

   cairo_text_cluster_t_struct_get_num_bytes (a_structure: POINTER): INTEGER 
         -- Query for num_bytes field of CAIRO_TEXT_CLUSTER_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_text_cluster_t_struct_get_num_bytes"
      }"
      end

   cairo_text_cluster_t_struct_get_num_glyphs (a_structure: POINTER): INTEGER 
         -- Query for num_glyphs field of CAIRO_TEXT_CLUSTER_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_text_cluster_t_struct_get_num_glyphs"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_cairo_text_cluster_t"
               }"
               end

end -- class CAIRO_TEXT_CLUSTER_T_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
