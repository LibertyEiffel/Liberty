-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SIGVAL_T_UNION
-- Wrapper of union sigval defined in file /usr/include/x86_64-linux-gnu/bits/siginfo.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   sigval_t_union_set_sival_int (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for sival_int field of SIGVAL_T_UNION structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sigval_t_union_set_sival_int"
      }"
      end

   sigval_t_union_set_sival_ptr (a_structure: POINTER; a_value: POINTER) 
         -- Setter for sival_ptr field of SIGVAL_T_UNION structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sigval_t_union_set_sival_ptr"
      }"
      end

feature {} -- Low-level queries

   sigval_t_union_get_sival_int (a_structure: POINTER): INTEGER 
         -- Query for sival_int field of SIGVAL_T_UNION structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sigval_t_union_get_sival_int"
      }"
      end

   sigval_t_union_get_sival_ptr (a_structure: POINTER): POINTER 
         -- Query for sival_ptr field of SIGVAL_T_UNION structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sigval_t_union_get_sival_ptr"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_sigval_t"
               }"
               end

end -- class SIGVAL_T_UNION
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
