-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SIGINFO_T_STRUCT
-- Wrapper of struct  defined in file /usr/include/x86_64-linux-gnu/bits/siginfo.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   siginfo_t_struct_set_si_signo (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for si_signo field of SIGINFO_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "siginfo_t_struct_set_si_signo"
      }"
      end

   siginfo_t_struct_set_si_errno (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for si_errno field of SIGINFO_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "siginfo_t_struct_set_si_errno"
      }"
      end

   siginfo_t_struct_set_si_code (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for si_code field of SIGINFO_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "siginfo_t_struct_set_si_code"
      }"
      end

feature {} -- Low-level queries

   siginfo_t_struct_get_si_signo (a_structure: POINTER): INTEGER 
         -- Query for si_signo field of SIGINFO_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "siginfo_t_struct_get_si_signo"
      }"
      end

   siginfo_t_struct_get_si_errno (a_structure: POINTER): INTEGER 
         -- Query for si_errno field of SIGINFO_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "siginfo_t_struct_get_si_errno"
      }"
      end

   siginfo_t_struct_get_si_code (a_structure: POINTER): INTEGER 
         -- Query for si_code field of SIGINFO_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "siginfo_t_struct_get_si_code"
      }"
      end

	-- Unwrapped private field _sifields.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_siginfo_t"
               }"
               end

end -- class SIGINFO_T_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
