-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class RANDOM_DATA_STRUCT
-- Wrapper of struct random_data defined in file /usr/include/stdlib.h

insert STANDARD_C_LIBRARY_TYPES

	STANDARD_C_LIBRARY_TYPES
feature {} -- Low-level setters

   random_data_struct_set_fptr (a_structure: POINTER; a_value: POINTER) 
         -- Setter for fptr field of RANDOM_DATA_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "random_data_struct_set_fptr"
      }"
      end

   random_data_struct_set_rptr (a_structure: POINTER; a_value: POINTER) 
         -- Setter for rptr field of RANDOM_DATA_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "random_data_struct_set_rptr"
      }"
      end

   random_data_struct_set_state (a_structure: POINTER; a_value: POINTER) 
         -- Setter for state field of RANDOM_DATA_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "random_data_struct_set_state"
      }"
      end

   random_data_struct_set_rand_type (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for rand_type field of RANDOM_DATA_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "random_data_struct_set_rand_type"
      }"
      end

   random_data_struct_set_rand_deg (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for rand_deg field of RANDOM_DATA_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "random_data_struct_set_rand_deg"
      }"
      end

   random_data_struct_set_rand_sep (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for rand_sep field of RANDOM_DATA_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "random_data_struct_set_rand_sep"
      }"
      end

   random_data_struct_set_end_ptr (a_structure: POINTER; a_value: POINTER) 
         -- Setter for end_ptr field of RANDOM_DATA_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "random_data_struct_set_end_ptr"
      }"
      end

feature {} -- Low-level queries

   random_data_struct_get_fptr (a_structure: POINTER): POINTER 
         -- Query for fptr field of RANDOM_DATA_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "random_data_struct_get_fptr"
      }"
      end

   random_data_struct_get_rptr (a_structure: POINTER): POINTER 
         -- Query for rptr field of RANDOM_DATA_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "random_data_struct_get_rptr"
      }"
      end

   random_data_struct_get_state (a_structure: POINTER): POINTER 
         -- Query for state field of RANDOM_DATA_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "random_data_struct_get_state"
      }"
      end

   random_data_struct_get_rand_type (a_structure: POINTER): INTEGER 
         -- Query for rand_type field of RANDOM_DATA_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "random_data_struct_get_rand_type"
      }"
      end

   random_data_struct_get_rand_deg (a_structure: POINTER): INTEGER 
         -- Query for rand_deg field of RANDOM_DATA_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "random_data_struct_get_rand_deg"
      }"
      end

   random_data_struct_get_rand_sep (a_structure: POINTER): INTEGER 
         -- Query for rand_sep field of RANDOM_DATA_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "random_data_struct_get_rand_sep"
      }"
      end

   random_data_struct_get_end_ptr (a_structure: POINTER): POINTER 
         -- Query for end_ptr field of RANDOM_DATA_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "random_data_struct_get_end_ptr"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_random_data"
               }"
               end

end -- class RANDOM_DATA_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
