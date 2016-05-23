-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class UNDO_LIST_STRUCT
-- Wrapper of struct undo_list defined in file /usr/include/readline/readline.h

insert STANDARD_C_LIBRARY_TYPES

	READLINE_TYPES
feature {} -- Low-level setters

   undo_list_struct_set_next (a_structure: POINTER; a_value: POINTER) 
         -- Setter for next field of UNDO_LIST_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "undo_list_struct_set_next"
      }"
      end

   undo_list_struct_set_start (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for start field of UNDO_LIST_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "undo_list_struct_set_start"
      }"
      end

   undo_list_struct_set_end_field (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for end field of UNDO_LIST_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "undo_list_struct_set_end_field"
      }"
      end

   undo_list_struct_set_text (a_structure: POINTER; a_value: POINTER) 
         -- Setter for text field of UNDO_LIST_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "undo_list_struct_set_text"
      }"
      end

   undo_list_struct_set_what (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for what field of UNDO_LIST_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "undo_list_struct_set_what"
      }"
      end

feature {} -- Low-level queries

   undo_list_struct_get_next (a_structure: POINTER): POINTER 
         -- Query for next field of UNDO_LIST_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "undo_list_struct_get_next"
      }"
      end

   undo_list_struct_get_start (a_structure: POINTER): INTEGER 
         -- Query for start field of UNDO_LIST_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "undo_list_struct_get_start"
      }"
      end

   undo_list_struct_get_end_field (a_structure: POINTER): INTEGER 
         -- Query for end field of UNDO_LIST_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "undo_list_struct_get_end_field"
      }"
      end

   undo_list_struct_get_text (a_structure: POINTER): POINTER 
         -- Query for text field of UNDO_LIST_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "undo_list_struct_get_text"
      }"
      end

   undo_list_struct_get_what (a_structure: POINTER): INTEGER 
         -- Query for what field of UNDO_LIST_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "undo_list_struct_get_what"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_undo_list"
               }"
               end

end -- class UNDO_LIST_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
