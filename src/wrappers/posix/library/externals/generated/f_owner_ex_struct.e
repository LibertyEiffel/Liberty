-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class F_OWNER_EX_STRUCT
-- Wrapper of struct f_owner_ex defined in file /usr/include/x86_64-linux-gnu/bits/fcntl-linux.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   f_owner_ex_struct_set_type (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for type field of F_OWNER_EX_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "f_owner_ex_struct_set_type"
      }"
      end

   f_owner_ex_struct_set_pid (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for pid field of F_OWNER_EX_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "f_owner_ex_struct_set_pid"
      }"
      end

feature {} -- Low-level queries

   f_owner_ex_struct_get_type (a_structure: POINTER): INTEGER 
         -- Query for type field of F_OWNER_EX_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "f_owner_ex_struct_get_type"
      }"
      end

   f_owner_ex_struct_get_pid (a_structure: POINTER): INTEGER 
         -- Query for pid field of F_OWNER_EX_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "f_owner_ex_struct_get_pid"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_f_owner_ex"
               }"
               end

end -- class F_OWNER_EX_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
