-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class IMAXDIV_T_STRUCT
-- Wrapper of struct  defined in file /usr/include/inttypes.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   imaxdiv_t_struct_set_quot (a_structure: POINTER; a_value: like long) 
         -- Setter for quot field of IMAXDIV_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "imaxdiv_t_struct_set_quot"
      }"
      end

   imaxdiv_t_struct_set_rem (a_structure: POINTER; a_value: like long) 
         -- Setter for rem field of IMAXDIV_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "imaxdiv_t_struct_set_rem"
      }"
      end

feature {} -- Low-level queries

   imaxdiv_t_struct_get_quot (a_structure: POINTER): like long 
         -- Query for quot field of IMAXDIV_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "imaxdiv_t_struct_get_quot"
      }"
      end

   imaxdiv_t_struct_get_rem (a_structure: POINTER): like long 
         -- Query for rem field of IMAXDIV_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "imaxdiv_t_struct_get_rem"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_imaxdiv_t"
               }"
               end

end -- class IMAXDIV_T_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
