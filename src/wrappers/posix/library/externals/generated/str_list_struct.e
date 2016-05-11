-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class STR_LIST_STRUCT
-- Wrapper of struct str_list defined in file /usr/include/x86_64-linux-gnu/bits/stropts.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   str_list_struct_set_sl_nmods (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for sl_nmods field of STR_LIST_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "str_list_struct_set_sl_nmods"
      }"
      end

   str_list_struct_set_sl_modlist (a_structure: POINTER; a_value: POINTER) 
         -- Setter for sl_modlist field of STR_LIST_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "str_list_struct_set_sl_modlist"
      }"
      end

feature {} -- Low-level queries

   str_list_struct_get_sl_nmods (a_structure: POINTER): INTEGER 
         -- Query for sl_nmods field of STR_LIST_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "str_list_struct_get_sl_nmods"
      }"
      end

   str_list_struct_get_sl_modlist (a_structure: POINTER): POINTER 
         -- Query for sl_modlist field of STR_LIST_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "str_list_struct_get_sl_modlist"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_str_list"
               }"
               end

end -- class STR_LIST_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
