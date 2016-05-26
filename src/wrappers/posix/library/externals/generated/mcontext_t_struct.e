-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class MCONTEXT_T_STRUCT
-- Wrapper of struct  defined in file /usr/include/x86_64-linux-gnu/sys/ucontext.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   mcontext_t_struct_set_gregs (a_structure: POINTER; a_value: POINTER) 
         -- Setter for gregs field of MCONTEXT_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "mcontext_t_struct_set_gregs"
      }"
      end

   mcontext_t_struct_set_fpregs (a_structure: POINTER; a_value: POINTER) 
         -- Setter for fpregs field of MCONTEXT_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "mcontext_t_struct_set_fpregs"
      }"
      end

feature {} -- Low-level queries

   mcontext_t_struct_get_gregs (a_structure: POINTER): POINTER 
         -- Query for gregs field of MCONTEXT_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "mcontext_t_struct_get_gregs"
      }"
      end

   mcontext_t_struct_get_fpregs (a_structure: POINTER): POINTER 
         -- Query for fpregs field of MCONTEXT_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "mcontext_t_struct_get_fpregs"
      }"
      end

	-- Unwrapped private field __reserved1.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_mcontext_t"
               }"
               end

end -- class MCONTEXT_T_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
