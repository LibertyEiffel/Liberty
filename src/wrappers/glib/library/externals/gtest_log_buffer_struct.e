-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GTEST_LOG_BUFFER_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

   gtest_log_buffer_struct_set_data (a_structure: POINTER; a_value: POINTER) 
         -- Setter for data field of GTEST_LOG_BUFFER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtest_log_buffer_struct_set_data"
      }"
      end

   gtest_log_buffer_struct_set_msgs (a_structure: POINTER; a_value: POINTER) 
         -- Setter for msgs field of GTEST_LOG_BUFFER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtest_log_buffer_struct_set_msgs"
      }"
      end

feature {} -- Low-level queries

   gtest_log_buffer_struct_get_data (a_structure: POINTER): POINTER 
         -- Query for data field of GTEST_LOG_BUFFER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtest_log_buffer_struct_get_data"
      }"
      end

   gtest_log_buffer_struct_get_msgs (a_structure: POINTER): POINTER 
         -- Query for msgs field of GTEST_LOG_BUFFER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtest_log_buffer_struct_get_msgs"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_GTestLogBuffer"
               }"
               end

end -- class GTEST_LOG_BUFFER_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
