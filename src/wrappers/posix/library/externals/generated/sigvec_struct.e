-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SIGVEC_STRUCT
-- Wrapper of struct sigvec defined in file /usr/include/signal.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   sigvec_struct_set_sv_handler (a_structure: POINTER; a_value: POINTER) 
         -- Setter for sv_handler field of SIGVEC_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sigvec_struct_set_sv_handler"
      }"
      end

   sigvec_struct_set_sv_mask (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for sv_mask field of SIGVEC_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sigvec_struct_set_sv_mask"
      }"
      end

   sigvec_struct_set_sv_flags (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for sv_flags field of SIGVEC_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sigvec_struct_set_sv_flags"
      }"
      end

feature {} -- Low-level queries

   sigvec_struct_get_sv_handler (a_structure: POINTER): POINTER 
         -- Query for sv_handler field of SIGVEC_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sigvec_struct_get_sv_handler"
      }"
      end

   sigvec_struct_get_sv_mask (a_structure: POINTER): INTEGER 
         -- Query for sv_mask field of SIGVEC_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sigvec_struct_get_sv_mask"
      }"
      end

   sigvec_struct_get_sv_flags (a_structure: POINTER): INTEGER 
         -- Query for sv_flags field of SIGVEC_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sigvec_struct_get_sv_flags"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_sigvec"
               }"
               end

end -- class SIGVEC_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
