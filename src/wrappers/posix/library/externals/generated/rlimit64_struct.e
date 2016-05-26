-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class RLIMIT64_STRUCT
-- Wrapper of struct rlimit64 defined in file /usr/include/x86_64-linux-gnu/bits/resource.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   rlimit64_struct_set_rlim_cur (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for rlim_cur field of RLIMIT64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "rlimit64_struct_set_rlim_cur"
      }"
      end

   rlimit64_struct_set_rlim_max (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for rlim_max field of RLIMIT64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "rlimit64_struct_set_rlim_max"
      }"
      end

feature {} -- Low-level queries

   rlimit64_struct_get_rlim_cur (a_structure: POINTER): like long_unsigned 
         -- Query for rlim_cur field of RLIMIT64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "rlimit64_struct_get_rlim_cur"
      }"
      end

   rlimit64_struct_get_rlim_max (a_structure: POINTER): like long_unsigned 
         -- Query for rlim_max field of RLIMIT64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "rlimit64_struct_get_rlim_max"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_rlimit64"
               }"
               end

end -- class RLIMIT64_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
