-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GTEST_LOG_MSG_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

   gtest_log_msg_struct_set_log_type (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for log_type field of GTEST_LOG_MSG_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtest_log_msg_struct_set_log_type"
      }"
      end

   gtest_log_msg_struct_set_n_strings (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for n_strings field of GTEST_LOG_MSG_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtest_log_msg_struct_set_n_strings"
      }"
      end

   gtest_log_msg_struct_set_strings (a_structure: POINTER; a_value: POINTER) 
         -- Setter for strings field of GTEST_LOG_MSG_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtest_log_msg_struct_set_strings"
      }"
      end

   gtest_log_msg_struct_set_n_nums (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for n_nums field of GTEST_LOG_MSG_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtest_log_msg_struct_set_n_nums"
      }"
      end

   gtest_log_msg_struct_set_nums (a_structure: POINTER; a_value: POINTER) 
         -- Setter for nums field of GTEST_LOG_MSG_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtest_log_msg_struct_set_nums"
      }"
      end

feature {} -- Low-level queries

   gtest_log_msg_struct_get_log_type (a_structure: POINTER): INTEGER 
         -- Query for log_type field of GTEST_LOG_MSG_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtest_log_msg_struct_get_log_type"
      }"
      end

   gtest_log_msg_struct_get_n_strings (a_structure: POINTER): NATURAL 
         -- Query for n_strings field of GTEST_LOG_MSG_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtest_log_msg_struct_get_n_strings"
      }"
      end

   gtest_log_msg_struct_get_strings (a_structure: POINTER): POINTER 
         -- Query for strings field of GTEST_LOG_MSG_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtest_log_msg_struct_get_strings"
      }"
      end

   gtest_log_msg_struct_get_n_nums (a_structure: POINTER): NATURAL 
         -- Query for n_nums field of GTEST_LOG_MSG_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtest_log_msg_struct_get_n_nums"
      }"
      end

   gtest_log_msg_struct_get_nums (a_structure: POINTER): POINTER 
         -- Query for nums field of GTEST_LOG_MSG_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtest_log_msg_struct_get_nums"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_GTestLogMsg"
               }"
               end

end -- class GTEST_LOG_MSG_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
