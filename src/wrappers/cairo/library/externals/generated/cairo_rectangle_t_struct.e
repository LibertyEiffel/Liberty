-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class CAIRO_RECTANGLE_T_STRUCT
-- Wrapper of struct cairo_rectangle_t defined in file /usr/include/cairo/cairo.h line 994

insert STANDARD_C_LIBRARY_TYPES

	CAIRO_TYPES
feature {} -- Low-level setters

   cairo_rectangle_t_struct_set_x (a_structure: POINTER; a_value: REAL) 
         -- Setter for x field of CAIRO_RECTANGLE_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_rectangle_t_struct_set_x"
      }"
      end

   cairo_rectangle_t_struct_set_y (a_structure: POINTER; a_value: REAL) 
         -- Setter for y field of CAIRO_RECTANGLE_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_rectangle_t_struct_set_y"
      }"
      end

   cairo_rectangle_t_struct_set_width (a_structure: POINTER; a_value: REAL) 
         -- Setter for width field of CAIRO_RECTANGLE_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_rectangle_t_struct_set_width"
      }"
      end

   cairo_rectangle_t_struct_set_height (a_structure: POINTER; a_value: REAL) 
         -- Setter for height field of CAIRO_RECTANGLE_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_rectangle_t_struct_set_height"
      }"
      end

feature {} -- Low-level queries

   cairo_rectangle_t_struct_get_x (a_structure: POINTER): REAL 
         -- Query for x field of CAIRO_RECTANGLE_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_rectangle_t_struct_get_x"
      }"
      end

   cairo_rectangle_t_struct_get_y (a_structure: POINTER): REAL 
         -- Query for y field of CAIRO_RECTANGLE_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_rectangle_t_struct_get_y"
      }"
      end

   cairo_rectangle_t_struct_get_width (a_structure: POINTER): REAL 
         -- Query for width field of CAIRO_RECTANGLE_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_rectangle_t_struct_get_width"
      }"
      end

   cairo_rectangle_t_struct_get_height (a_structure: POINTER): REAL 
         -- Query for height field of CAIRO_RECTANGLE_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_rectangle_t_struct_get_height"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_cairo_rectangle_t"
               }"
               end

end -- class CAIRO_RECTANGLE_T_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
