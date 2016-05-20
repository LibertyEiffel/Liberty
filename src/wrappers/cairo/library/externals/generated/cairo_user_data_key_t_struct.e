-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class CAIRO_USER_DATA_KEY_T_STRUCT
-- Wrapper of struct cairo_user_data_key_t defined in file /usr/include/cairo/cairo.h line 246

insert STANDARD_C_LIBRARY_TYPES

	CAIRO_TYPES
feature {} -- Low-level setters

   cairo_user_data_key_t_struct_set_unused (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for unused field of CAIRO_USER_DATA_KEY_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_user_data_key_t_struct_set_unused"
      }"
      end

feature {} -- Low-level queries

   cairo_user_data_key_t_struct_get_unused (a_structure: POINTER): INTEGER 
         -- Query for unused field of CAIRO_USER_DATA_KEY_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cairo_user_data_key_t_struct_get_unused"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_cairo_user_data_key_t"
               }"
               end

end -- class CAIRO_USER_DATA_KEY_T_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
