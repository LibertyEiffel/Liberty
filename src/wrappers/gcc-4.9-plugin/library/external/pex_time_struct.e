-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class PEX_TIME_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GCC_4_9_PLUGIN_TYPES
feature {} -- Low-level setters

   pex_time_struct_set_user_seconds (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for user_seconds field of PEX_TIME_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "pex_time_struct_set_user_seconds"
      }"
      end

   pex_time_struct_set_user_microseconds (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for user_microseconds field of PEX_TIME_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "pex_time_struct_set_user_microseconds"
      }"
      end

   pex_time_struct_set_system_seconds (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for system_seconds field of PEX_TIME_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "pex_time_struct_set_system_seconds"
      }"
      end

   pex_time_struct_set_system_microseconds (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for system_microseconds field of PEX_TIME_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "pex_time_struct_set_system_microseconds"
      }"
      end

feature {} -- Low-level queries

   pex_time_struct_get_user_seconds (a_structure: POINTER): like long_unsigned 
         -- Query for user_seconds field of PEX_TIME_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "pex_time_struct_get_user_seconds"
      }"
      end

   pex_time_struct_get_user_microseconds (a_structure: POINTER): like long_unsigned 
         -- Query for user_microseconds field of PEX_TIME_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "pex_time_struct_get_user_microseconds"
      }"
      end

   pex_time_struct_get_system_seconds (a_structure: POINTER): like long_unsigned 
         -- Query for system_seconds field of PEX_TIME_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "pex_time_struct_get_system_seconds"
      }"
      end

   pex_time_struct_get_system_microseconds (a_structure: POINTER): like long_unsigned 
         -- Query for system_microseconds field of PEX_TIME_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "pex_time_struct_get_system_microseconds"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_pex_time"
               }"
               end

end -- class PEX_TIME_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
