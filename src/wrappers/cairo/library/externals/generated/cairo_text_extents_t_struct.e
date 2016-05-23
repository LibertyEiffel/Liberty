-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class CAIRO_TEXT_EXTENTS_T_STRUCT
-- Wrapper of struct cairo_text_extents_t defined in file /usr/include/cairo/cairo.h line 1174

insert STANDARD_C_LIBRARY_TYPES

	CAIRO_TYPES
feature {} -- Low-level setters

   cairo_text_extents_t_struct_set_x_bearing (a_structure: POINTER; a_value: REAL) 
         -- Setter for x_bearing field of CAIRO_TEXT_EXTENTS_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_text_extents_t_struct_set_x_bearing"
      }"
      end

   cairo_text_extents_t_struct_set_y_bearing (a_structure: POINTER; a_value: REAL) 
         -- Setter for y_bearing field of CAIRO_TEXT_EXTENTS_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_text_extents_t_struct_set_y_bearing"
      }"
      end

   cairo_text_extents_t_struct_set_width (a_structure: POINTER; a_value: REAL) 
         -- Setter for width field of CAIRO_TEXT_EXTENTS_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_text_extents_t_struct_set_width"
      }"
      end

   cairo_text_extents_t_struct_set_height (a_structure: POINTER; a_value: REAL) 
         -- Setter for height field of CAIRO_TEXT_EXTENTS_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_text_extents_t_struct_set_height"
      }"
      end

   cairo_text_extents_t_struct_set_x_advance (a_structure: POINTER; a_value: REAL) 
         -- Setter for x_advance field of CAIRO_TEXT_EXTENTS_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_text_extents_t_struct_set_x_advance"
      }"
      end

   cairo_text_extents_t_struct_set_y_advance (a_structure: POINTER; a_value: REAL) 
         -- Setter for y_advance field of CAIRO_TEXT_EXTENTS_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_text_extents_t_struct_set_y_advance"
      }"
      end

feature {} -- Low-level queries

   cairo_text_extents_t_struct_get_x_bearing (a_structure: POINTER): REAL 
         -- Query for x_bearing field of CAIRO_TEXT_EXTENTS_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_text_extents_t_struct_get_x_bearing"
      }"
      end

   cairo_text_extents_t_struct_get_y_bearing (a_structure: POINTER): REAL 
         -- Query for y_bearing field of CAIRO_TEXT_EXTENTS_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_text_extents_t_struct_get_y_bearing"
      }"
      end

   cairo_text_extents_t_struct_get_width (a_structure: POINTER): REAL 
         -- Query for width field of CAIRO_TEXT_EXTENTS_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_text_extents_t_struct_get_width"
      }"
      end

   cairo_text_extents_t_struct_get_height (a_structure: POINTER): REAL 
         -- Query for height field of CAIRO_TEXT_EXTENTS_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_text_extents_t_struct_get_height"
      }"
      end

   cairo_text_extents_t_struct_get_x_advance (a_structure: POINTER): REAL 
         -- Query for x_advance field of CAIRO_TEXT_EXTENTS_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_text_extents_t_struct_get_x_advance"
      }"
      end

   cairo_text_extents_t_struct_get_y_advance (a_structure: POINTER): REAL 
         -- Query for y_advance field of CAIRO_TEXT_EXTENTS_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_text_extents_t_struct_get_y_advance"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_cairo_text_extents_t"
               }"
               end

end -- class CAIRO_TEXT_EXTENTS_T_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
