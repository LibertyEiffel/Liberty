-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class CAIRO_RECTANGLE_LIST_T_STRUCT
-- Wrapper of struct cairo_rectangle_list_t defined in file /usr/include/cairo/cairo.h line 1009

insert STANDARD_C_LIBRARY_TYPES

	CAIRO_TYPES
feature {} -- Low-level setters

   cairo_rectangle_list_t_struct_set_status (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for status field of CAIRO_RECTANGLE_LIST_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_rectangle_list_t_struct_set_status"
      }"
      end

   cairo_rectangle_list_t_struct_set_rectangles (a_structure: POINTER; a_value: POINTER) 
         -- Setter for rectangles field of CAIRO_RECTANGLE_LIST_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_rectangle_list_t_struct_set_rectangles"
      }"
      end

   cairo_rectangle_list_t_struct_set_num_rectangles (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for num_rectangles field of CAIRO_RECTANGLE_LIST_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_rectangle_list_t_struct_set_num_rectangles"
      }"
      end

feature {} -- Low-level queries

   cairo_rectangle_list_t_struct_get_status (a_structure: POINTER): INTEGER 
         -- Query for status field of CAIRO_RECTANGLE_LIST_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_rectangle_list_t_struct_get_status"
      }"
      end

   cairo_rectangle_list_t_struct_get_rectangles (a_structure: POINTER): POINTER 
         -- Query for rectangles field of CAIRO_RECTANGLE_LIST_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_rectangle_list_t_struct_get_rectangles"
      }"
      end

   cairo_rectangle_list_t_struct_get_num_rectangles (a_structure: POINTER): INTEGER 
         -- Query for num_rectangles field of CAIRO_RECTANGLE_LIST_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_rectangle_list_t_struct_get_num_rectangles"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_cairo_rectangle_list_t"
               }"
               end

end -- class CAIRO_RECTANGLE_LIST_T_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
