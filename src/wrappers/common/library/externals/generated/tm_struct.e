-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class TM_STRUCT
-- Wrapper of struct tm defined in file /usr/include/time.h

insert STANDARD_C_LIBRARY_TYPES

	STANDARD_C_LIBRARY_TYPES
feature {} -- Low-level setters

   tm_struct_set_tm_sec (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for tm_sec field of TM_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tm_struct_set_tm_sec"
      }"
      end

   tm_struct_set_tm_min (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for tm_min field of TM_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tm_struct_set_tm_min"
      }"
      end

   tm_struct_set_tm_hour (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for tm_hour field of TM_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tm_struct_set_tm_hour"
      }"
      end

   tm_struct_set_tm_mday (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for tm_mday field of TM_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tm_struct_set_tm_mday"
      }"
      end

   tm_struct_set_tm_mon (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for tm_mon field of TM_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tm_struct_set_tm_mon"
      }"
      end

   tm_struct_set_tm_year (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for tm_year field of TM_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tm_struct_set_tm_year"
      }"
      end

   tm_struct_set_tm_wday (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for tm_wday field of TM_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tm_struct_set_tm_wday"
      }"
      end

   tm_struct_set_tm_yday (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for tm_yday field of TM_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tm_struct_set_tm_yday"
      }"
      end

   tm_struct_set_tm_isdst (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for tm_isdst field of TM_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tm_struct_set_tm_isdst"
      }"
      end

   tm_struct_set_tm_gmtoff (a_structure: POINTER; a_value: like long) 
         -- Setter for tm_gmtoff field of TM_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tm_struct_set_tm_gmtoff"
      }"
      end

   tm_struct_set_tm_zone (a_structure: POINTER; a_value: POINTER) 
         -- Setter for tm_zone field of TM_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tm_struct_set_tm_zone"
      }"
      end

feature {} -- Low-level queries

   tm_struct_get_tm_sec (a_structure: POINTER): INTEGER 
         -- Query for tm_sec field of TM_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tm_struct_get_tm_sec"
      }"
      end

   tm_struct_get_tm_min (a_structure: POINTER): INTEGER 
         -- Query for tm_min field of TM_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tm_struct_get_tm_min"
      }"
      end

   tm_struct_get_tm_hour (a_structure: POINTER): INTEGER 
         -- Query for tm_hour field of TM_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tm_struct_get_tm_hour"
      }"
      end

   tm_struct_get_tm_mday (a_structure: POINTER): INTEGER 
         -- Query for tm_mday field of TM_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tm_struct_get_tm_mday"
      }"
      end

   tm_struct_get_tm_mon (a_structure: POINTER): INTEGER 
         -- Query for tm_mon field of TM_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tm_struct_get_tm_mon"
      }"
      end

   tm_struct_get_tm_year (a_structure: POINTER): INTEGER 
         -- Query for tm_year field of TM_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tm_struct_get_tm_year"
      }"
      end

   tm_struct_get_tm_wday (a_structure: POINTER): INTEGER 
         -- Query for tm_wday field of TM_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tm_struct_get_tm_wday"
      }"
      end

   tm_struct_get_tm_yday (a_structure: POINTER): INTEGER 
         -- Query for tm_yday field of TM_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tm_struct_get_tm_yday"
      }"
      end

   tm_struct_get_tm_isdst (a_structure: POINTER): INTEGER 
         -- Query for tm_isdst field of TM_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tm_struct_get_tm_isdst"
      }"
      end

   tm_struct_get_tm_gmtoff (a_structure: POINTER): like long 
         -- Query for tm_gmtoff field of TM_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tm_struct_get_tm_gmtoff"
      }"
      end

   tm_struct_get_tm_zone (a_structure: POINTER): POINTER 
         -- Query for tm_zone field of TM_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tm_struct_get_tm_zone"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_tm"
               }"
               end

end -- class TM_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
