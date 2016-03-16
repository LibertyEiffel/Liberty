-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class TIMESPEC_STRUCT
-- Wrapper of struct timespec defined in file /usr/include/time.h

insert STANDARD_C_LIBRARY_TYPES

	STANDARD_C_LIBRARY_TYPES
feature {} -- Low-level setters

   timespec_struct_set_tv_sec (a_structure: POINTER; a_value: like long) 
         -- Setter for tv_sec field of TIMESPEC_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "timespec_struct_set_tv_sec"
      }"
      end

   timespec_struct_set_tv_nsec (a_structure: POINTER; a_value: like long) 
         -- Setter for tv_nsec field of TIMESPEC_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "timespec_struct_set_tv_nsec"
      }"
      end

feature {} -- Low-level queries

   timespec_struct_get_tv_sec (a_structure: POINTER): like long 
         -- Query for tv_sec field of TIMESPEC_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "timespec_struct_get_tv_sec"
      }"
      end

   timespec_struct_get_tv_nsec (a_structure: POINTER): like long 
         -- Query for tv_nsec field of TIMESPEC_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "timespec_struct_get_tv_nsec"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_timespec"
               }"
               end

end -- class TIMESPEC_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
