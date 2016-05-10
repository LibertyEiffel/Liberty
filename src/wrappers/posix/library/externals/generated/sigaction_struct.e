-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SIGACTION_STRUCT
-- Wrapper of struct sigaction defined in file /usr/include/x86_64-linux-gnu/bits/sigaction.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   sigaction_struct_set_sa_flags (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for sa_flags field of SIGACTION_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sigaction_struct_set_sa_flags"
      }"
      end

   sigaction_struct_set_sa_restorer (a_structure: POINTER; a_value: POINTER) 
         -- Setter for sa_restorer field of SIGACTION_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sigaction_struct_set_sa_restorer"
      }"
      end

feature {} -- Low-level queries

	-- Unwrapped private field __sigaction_handler.
	-- Unwrappable field sa_mask.
   sigaction_struct_get_sa_flags (a_structure: POINTER): INTEGER 
         -- Query for sa_flags field of SIGACTION_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sigaction_struct_get_sa_flags"
      }"
      end

   sigaction_struct_get_sa_restorer (a_structure: POINTER): POINTER 
         -- Query for sa_restorer field of SIGACTION_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sigaction_struct_get_sa_restorer"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_sigaction"
               }"
               end

end -- class SIGACTION_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
