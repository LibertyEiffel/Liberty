-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SIGEVENT_T_STRUCT
-- Wrapper of struct sigevent defined in file /usr/include/x86_64-linux-gnu/bits/siginfo.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   sigevent_t_struct_set_sigev_signo (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for sigev_signo field of SIGEVENT_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sigevent_t_struct_set_sigev_signo"
      }"
      end

   sigevent_t_struct_set_sigev_notify (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for sigev_notify field of SIGEVENT_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sigevent_t_struct_set_sigev_notify"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field sigev_value.
   sigevent_t_struct_get_sigev_signo (a_structure: POINTER): INTEGER 
         -- Query for sigev_signo field of SIGEVENT_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sigevent_t_struct_get_sigev_signo"
      }"
      end

   sigevent_t_struct_get_sigev_notify (a_structure: POINTER): INTEGER 
         -- Query for sigev_notify field of SIGEVENT_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sigevent_t_struct_get_sigev_notify"
      }"
      end

	-- Unwrapped private field _sigev_un.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_sigevent_t"
               }"
               end

end -- class SIGEVENT_T_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
