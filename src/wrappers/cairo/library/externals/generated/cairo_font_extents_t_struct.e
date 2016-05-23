-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class CAIRO_FONT_EXTENTS_T_STRUCT
-- Wrapper of struct cairo_font_extents_t defined in file /usr/include/cairo/cairo.h line 1226

insert STANDARD_C_LIBRARY_TYPES

	CAIRO_TYPES
feature {} -- Low-level setters

   cairo_font_extents_t_struct_set_ascent (a_structure: POINTER; a_value: REAL) 
         -- Setter for ascent field of CAIRO_FONT_EXTENTS_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_font_extents_t_struct_set_ascent"
      }"
      end

   cairo_font_extents_t_struct_set_descent (a_structure: POINTER; a_value: REAL) 
         -- Setter for descent field of CAIRO_FONT_EXTENTS_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_font_extents_t_struct_set_descent"
      }"
      end

   cairo_font_extents_t_struct_set_height (a_structure: POINTER; a_value: REAL) 
         -- Setter for height field of CAIRO_FONT_EXTENTS_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_font_extents_t_struct_set_height"
      }"
      end

   cairo_font_extents_t_struct_set_max_x_advance (a_structure: POINTER; a_value: REAL) 
         -- Setter for max_x_advance field of CAIRO_FONT_EXTENTS_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_font_extents_t_struct_set_max_x_advance"
      }"
      end

   cairo_font_extents_t_struct_set_max_y_advance (a_structure: POINTER; a_value: REAL) 
         -- Setter for max_y_advance field of CAIRO_FONT_EXTENTS_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_font_extents_t_struct_set_max_y_advance"
      }"
      end

feature {} -- Low-level queries

   cairo_font_extents_t_struct_get_ascent (a_structure: POINTER): REAL 
         -- Query for ascent field of CAIRO_FONT_EXTENTS_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_font_extents_t_struct_get_ascent"
      }"
      end

   cairo_font_extents_t_struct_get_descent (a_structure: POINTER): REAL 
         -- Query for descent field of CAIRO_FONT_EXTENTS_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_font_extents_t_struct_get_descent"
      }"
      end

   cairo_font_extents_t_struct_get_height (a_structure: POINTER): REAL 
         -- Query for height field of CAIRO_FONT_EXTENTS_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_font_extents_t_struct_get_height"
      }"
      end

   cairo_font_extents_t_struct_get_max_x_advance (a_structure: POINTER): REAL 
         -- Query for max_x_advance field of CAIRO_FONT_EXTENTS_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_font_extents_t_struct_get_max_x_advance"
      }"
      end

   cairo_font_extents_t_struct_get_max_y_advance (a_structure: POINTER): REAL 
         -- Query for max_y_advance field of CAIRO_FONT_EXTENTS_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_font_extents_t_struct_get_max_y_advance"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_cairo_font_extents_t"
               }"
               end

end -- class CAIRO_FONT_EXTENTS_T_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
