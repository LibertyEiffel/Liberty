-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class UCONTEXT_T_STRUCT
-- Wrapper of struct ucontext defined in file /usr/include/x86_64-linux-gnu/sys/ucontext.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   ucontext_t_struct_set_uc_flags (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for uc_flags field of UCONTEXT_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ucontext_t_struct_set_uc_flags"
      }"
      end

   ucontext_t_struct_set_uc_link (a_structure: POINTER; a_value: POINTER) 
         -- Setter for uc_link field of UCONTEXT_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ucontext_t_struct_set_uc_link"
      }"
      end

feature {} -- Low-level queries

   ucontext_t_struct_get_uc_flags (a_structure: POINTER): like long_unsigned 
         -- Query for uc_flags field of UCONTEXT_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ucontext_t_struct_get_uc_flags"
      }"
      end

   ucontext_t_struct_get_uc_link (a_structure: POINTER): POINTER 
         -- Query for uc_link field of UCONTEXT_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ucontext_t_struct_get_uc_link"
      }"
      end

	-- Unwrappable field uc_stack.
	-- Unwrappable field uc_mcontext.
	-- Unwrappable field uc_sigmask.
	-- Unwrapped private field __fpregs_mem.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_ucontext_t"
               }"
               end

end -- class UCONTEXT_T_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
