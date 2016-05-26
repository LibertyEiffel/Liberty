-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class UCRED_STRUCT
-- Wrapper of struct ucred defined in file /usr/include/x86_64-linux-gnu/bits/socket.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   ucred_struct_set_pid (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for pid field of UCRED_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ucred_struct_set_pid"
      }"
      end

   ucred_struct_set_uid (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for uid field of UCRED_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ucred_struct_set_uid"
      }"
      end

   ucred_struct_set_gid (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for gid field of UCRED_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ucred_struct_set_gid"
      }"
      end

feature {} -- Low-level queries

   ucred_struct_get_pid (a_structure: POINTER): INTEGER 
         -- Query for pid field of UCRED_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ucred_struct_get_pid"
      }"
      end

   ucred_struct_get_uid (a_structure: POINTER): NATURAL 
         -- Query for uid field of UCRED_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ucred_struct_get_uid"
      }"
      end

   ucred_struct_get_gid (a_structure: POINTER): NATURAL 
         -- Query for gid field of UCRED_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ucred_struct_get_gid"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_ucred"
               }"
               end

end -- class UCRED_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
