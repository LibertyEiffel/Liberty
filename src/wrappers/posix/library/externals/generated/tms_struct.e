-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class TMS_STRUCT
-- Wrapper of struct tms defined in file /usr/include/x86_64-linux-gnu/sys/times.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   tms_struct_set_tms_utime (a_structure: POINTER; a_value: like long) 
         -- Setter for tms_utime field of TMS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tms_struct_set_tms_utime"
      }"
      end

   tms_struct_set_tms_stime (a_structure: POINTER; a_value: like long) 
         -- Setter for tms_stime field of TMS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tms_struct_set_tms_stime"
      }"
      end

   tms_struct_set_tms_cutime (a_structure: POINTER; a_value: like long) 
         -- Setter for tms_cutime field of TMS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tms_struct_set_tms_cutime"
      }"
      end

   tms_struct_set_tms_cstime (a_structure: POINTER; a_value: like long) 
         -- Setter for tms_cstime field of TMS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tms_struct_set_tms_cstime"
      }"
      end

feature {} -- Low-level queries

   tms_struct_get_tms_utime (a_structure: POINTER): like long 
         -- Query for tms_utime field of TMS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tms_struct_get_tms_utime"
      }"
      end

   tms_struct_get_tms_stime (a_structure: POINTER): like long 
         -- Query for tms_stime field of TMS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tms_struct_get_tms_stime"
      }"
      end

   tms_struct_get_tms_cutime (a_structure: POINTER): like long 
         -- Query for tms_cutime field of TMS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tms_struct_get_tms_cutime"
      }"
      end

   tms_struct_get_tms_cstime (a_structure: POINTER): like long 
         -- Query for tms_cstime field of TMS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tms_struct_get_tms_cstime"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_tms"
               }"
               end

end -- class TMS_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
