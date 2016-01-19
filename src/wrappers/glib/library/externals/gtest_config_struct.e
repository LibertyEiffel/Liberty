-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GTEST_CONFIG_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

   gtest_config_struct_set_test_initialized (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for test_initialized field of GTEST_CONFIG_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtest_config_struct_set_test_initialized"
      }"
      end

   gtest_config_struct_set_test_quick (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for test_quick field of GTEST_CONFIG_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtest_config_struct_set_test_quick"
      }"
      end

   gtest_config_struct_set_test_perf (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for test_perf field of GTEST_CONFIG_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtest_config_struct_set_test_perf"
      }"
      end

   gtest_config_struct_set_test_verbose (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for test_verbose field of GTEST_CONFIG_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtest_config_struct_set_test_verbose"
      }"
      end

   gtest_config_struct_set_test_quiet (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for test_quiet field of GTEST_CONFIG_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtest_config_struct_set_test_quiet"
      }"
      end

   gtest_config_struct_set_test_undefined (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for test_undefined field of GTEST_CONFIG_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtest_config_struct_set_test_undefined"
      }"
      end

feature {} -- Low-level queries

   gtest_config_struct_get_test_initialized (a_structure: POINTER): INTEGER 
         -- Query for test_initialized field of GTEST_CONFIG_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtest_config_struct_get_test_initialized"
      }"
      end

   gtest_config_struct_get_test_quick (a_structure: POINTER): INTEGER 
         -- Query for test_quick field of GTEST_CONFIG_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtest_config_struct_get_test_quick"
      }"
      end

   gtest_config_struct_get_test_perf (a_structure: POINTER): INTEGER 
         -- Query for test_perf field of GTEST_CONFIG_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtest_config_struct_get_test_perf"
      }"
      end

   gtest_config_struct_get_test_verbose (a_structure: POINTER): INTEGER 
         -- Query for test_verbose field of GTEST_CONFIG_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtest_config_struct_get_test_verbose"
      }"
      end

   gtest_config_struct_get_test_quiet (a_structure: POINTER): INTEGER 
         -- Query for test_quiet field of GTEST_CONFIG_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtest_config_struct_get_test_quiet"
      }"
      end

   gtest_config_struct_get_test_undefined (a_structure: POINTER): INTEGER 
         -- Query for test_undefined field of GTEST_CONFIG_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtest_config_struct_get_test_undefined"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_GTestConfig"
               }"
               end

end -- class GTEST_CONFIG_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
