-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class HISTORY_STATE_STRUCT
-- Wrapper of struct _hist_state defined in file /usr/include/readline/history.h

insert STANDARD_C_LIBRARY_TYPES

	READLINE_TYPES
feature {} -- Low-level setters

   history_state_struct_set_entries (a_structure: POINTER; a_value: POINTER) 
         -- Setter for entries field of HISTORY_STATE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "history_state_struct_set_entries"
      }"
      end

   history_state_struct_set_offset (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for offset field of HISTORY_STATE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "history_state_struct_set_offset"
      }"
      end

   history_state_struct_set_length (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for length field of HISTORY_STATE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "history_state_struct_set_length"
      }"
      end

   history_state_struct_set_size (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for size field of HISTORY_STATE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "history_state_struct_set_size"
      }"
      end

   history_state_struct_set_flags (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for flags field of HISTORY_STATE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "history_state_struct_set_flags"
      }"
      end

feature {} -- Low-level queries

   history_state_struct_get_entries (a_structure: POINTER): POINTER 
         -- Query for entries field of HISTORY_STATE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "history_state_struct_get_entries"
      }"
      end

   history_state_struct_get_offset (a_structure: POINTER): INTEGER 
         -- Query for offset field of HISTORY_STATE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "history_state_struct_get_offset"
      }"
      end

   history_state_struct_get_length (a_structure: POINTER): INTEGER 
         -- Query for length field of HISTORY_STATE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "history_state_struct_get_length"
      }"
      end

   history_state_struct_get_size (a_structure: POINTER): INTEGER 
         -- Query for size field of HISTORY_STATE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "history_state_struct_get_size"
      }"
      end

   history_state_struct_get_flags (a_structure: POINTER): INTEGER 
         -- Query for flags field of HISTORY_STATE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "history_state_struct_get_flags"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_history_state"
               }"
               end

end -- class HISTORY_STATE_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
