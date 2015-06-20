-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GOPTION_ENTRY_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

   goption_entry_struct_set_long_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for long_name field of GOPTION_ENTRY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "goption_entry_struct_set_long_name"
      }"
      end

   goption_entry_struct_set_short_name (a_structure: POINTER; a_value: CHARACTER) 
         -- Setter for short_name field of GOPTION_ENTRY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "goption_entry_struct_set_short_name"
      }"
      end

   goption_entry_struct_set_flags (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for flags field of GOPTION_ENTRY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "goption_entry_struct_set_flags"
      }"
      end

   goption_entry_struct_set_arg (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for arg field of GOPTION_ENTRY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "goption_entry_struct_set_arg"
      }"
      end

   goption_entry_struct_set_arg_data (a_structure: POINTER; a_value: POINTER) 
         -- Setter for arg_data field of GOPTION_ENTRY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "goption_entry_struct_set_arg_data"
      }"
      end

   goption_entry_struct_set_description (a_structure: POINTER; a_value: POINTER) 
         -- Setter for description field of GOPTION_ENTRY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "goption_entry_struct_set_description"
      }"
      end

   goption_entry_struct_set_arg_description (a_structure: POINTER; a_value: POINTER) 
         -- Setter for arg_description field of GOPTION_ENTRY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "goption_entry_struct_set_arg_description"
      }"
      end

feature {} -- Low-level queries

   goption_entry_struct_get_long_name (a_structure: POINTER): POINTER 
         -- Query for long_name field of GOPTION_ENTRY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "goption_entry_struct_get_long_name"
      }"
      end

   goption_entry_struct_get_short_name (a_structure: POINTER): CHARACTER 
         -- Query for short_name field of GOPTION_ENTRY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "goption_entry_struct_get_short_name"
      }"
      end

   goption_entry_struct_get_flags (a_structure: POINTER): INTEGER 
         -- Query for flags field of GOPTION_ENTRY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "goption_entry_struct_get_flags"
      }"
      end

   goption_entry_struct_get_arg (a_structure: POINTER): INTEGER 
         -- Query for arg field of GOPTION_ENTRY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "goption_entry_struct_get_arg"
      }"
      end

   goption_entry_struct_get_arg_data (a_structure: POINTER): POINTER 
         -- Query for arg_data field of GOPTION_ENTRY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "goption_entry_struct_get_arg_data"
      }"
      end

   goption_entry_struct_get_description (a_structure: POINTER): POINTER 
         -- Query for description field of GOPTION_ENTRY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "goption_entry_struct_get_description"
      }"
      end

   goption_entry_struct_get_arg_description (a_structure: POINTER): POINTER 
         -- Query for arg_description field of GOPTION_ENTRY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "goption_entry_struct_get_arg_description"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GOptionEntry"
               }"
               end

end -- class GOPTION_ENTRY_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
