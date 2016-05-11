-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class STR_MLIST_STRUCT
-- Wrapper of struct str_mlist defined in file /usr/include/x86_64-linux-gnu/bits/stropts.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   str_mlist_struct_set_l_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for l_name field of STR_MLIST_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "str_mlist_struct_set_l_name"
      }"
      end

feature {} -- Low-level queries

   str_mlist_struct_get_l_name (a_structure: POINTER): POINTER 
         -- Query for l_name field of STR_MLIST_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "str_mlist_struct_get_l_name"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_str_mlist"
               }"
               end

end -- class STR_MLIST_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
