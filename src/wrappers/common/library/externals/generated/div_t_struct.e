-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class DIV_T_STRUCT
-- Wrapper of struct  defined in file /usr/include/stdlib.h

insert STANDARD_C_LIBRARY_TYPES

	STANDARD_C_LIBRARY_TYPES
feature {} -- Low-level setters

   div_t_struct_set_quot (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for quot field of DIV_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "div_t_struct_set_quot"
      }"
      end

   div_t_struct_set_rem (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for rem field of DIV_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "div_t_struct_set_rem"
      }"
      end

feature {} -- Low-level queries

   div_t_struct_get_quot (a_structure: POINTER): INTEGER 
         -- Query for quot field of DIV_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "div_t_struct_get_quot"
      }"
      end

   div_t_struct_get_rem (a_structure: POINTER): INTEGER 
         -- Query for rem field of DIV_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "div_t_struct_get_rem"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_div_t"
               }"
               end

end -- class DIV_T_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
