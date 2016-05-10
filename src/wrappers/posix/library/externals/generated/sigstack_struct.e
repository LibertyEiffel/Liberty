-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SIGSTACK_STRUCT
-- Wrapper of struct sigstack defined in file /usr/include/x86_64-linux-gnu/bits/sigstack.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   sigstack_struct_set_ss_sp (a_structure: POINTER; a_value: POINTER) 
         -- Setter for ss_sp field of SIGSTACK_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sigstack_struct_set_ss_sp"
      }"
      end

   sigstack_struct_set_ss_onstack (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for ss_onstack field of SIGSTACK_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sigstack_struct_set_ss_onstack"
      }"
      end

feature {} -- Low-level queries

   sigstack_struct_get_ss_sp (a_structure: POINTER): POINTER 
         -- Query for ss_sp field of SIGSTACK_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sigstack_struct_get_ss_sp"
      }"
      end

   sigstack_struct_get_ss_onstack (a_structure: POINTER): INTEGER 
         -- Query for ss_onstack field of SIGSTACK_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sigstack_struct_get_ss_onstack"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_sigstack"
               }"
               end

end -- class SIGSTACK_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
