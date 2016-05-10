-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class REGMATCH_T_STRUCT
-- Wrapper of struct  defined in file /usr/include/regex.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   regmatch_t_struct_set_rm_so (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for rm_so field of REGMATCH_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regmatch_t_struct_set_rm_so"
      }"
      end

   regmatch_t_struct_set_rm_eo (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for rm_eo field of REGMATCH_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regmatch_t_struct_set_rm_eo"
      }"
      end

feature {} -- Low-level queries

   regmatch_t_struct_get_rm_so (a_structure: POINTER): INTEGER 
         -- Query for rm_so field of REGMATCH_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regmatch_t_struct_get_rm_so"
      }"
      end

   regmatch_t_struct_get_rm_eo (a_structure: POINTER): INTEGER 
         -- Query for rm_eo field of REGMATCH_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regmatch_t_struct_get_rm_eo"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_regmatch_t"
               }"
               end

end -- class REGMATCH_T_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
