-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class STACK_T_STRUCT
-- Wrapper of struct sigaltstack defined in file /usr/include/x86_64-linux-gnu/bits/sigstack.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   stack_t_struct_set_ss_sp (a_structure: POINTER; a_value: POINTER) 
         -- Setter for ss_sp field of STACK_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "stack_t_struct_set_ss_sp"
      }"
      end

   stack_t_struct_set_ss_flags (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for ss_flags field of STACK_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "stack_t_struct_set_ss_flags"
      }"
      end

   stack_t_struct_set_ss_size (a_structure: POINTER; a_value: like size_t) 
         -- Setter for ss_size field of STACK_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "stack_t_struct_set_ss_size"
      }"
      end

feature {} -- Low-level queries

   stack_t_struct_get_ss_sp (a_structure: POINTER): POINTER 
         -- Query for ss_sp field of STACK_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "stack_t_struct_get_ss_sp"
      }"
      end

   stack_t_struct_get_ss_flags (a_structure: POINTER): INTEGER 
         -- Query for ss_flags field of STACK_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "stack_t_struct_get_ss_flags"
      }"
      end

   stack_t_struct_get_ss_size (a_structure: POINTER): like size_t 
         -- Query for ss_size field of STACK_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "stack_t_struct_get_ss_size"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_stack_t"
               }"
               end

end -- class STACK_T_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
