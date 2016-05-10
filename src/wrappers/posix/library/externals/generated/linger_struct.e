-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class LINGER_STRUCT
-- Wrapper of struct linger defined in file /usr/include/x86_64-linux-gnu/bits/socket.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   linger_struct_set_l_onoff (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for l_onoff field of LINGER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "linger_struct_set_l_onoff"
      }"
      end

   linger_struct_set_l_linger (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for l_linger field of LINGER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "linger_struct_set_l_linger"
      }"
      end

feature {} -- Low-level queries

   linger_struct_get_l_onoff (a_structure: POINTER): INTEGER 
         -- Query for l_onoff field of LINGER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "linger_struct_get_l_onoff"
      }"
      end

   linger_struct_get_l_linger (a_structure: POINTER): INTEGER 
         -- Query for l_linger field of LINGER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "linger_struct_get_l_linger"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_linger"
               }"
               end

end -- class LINGER_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
