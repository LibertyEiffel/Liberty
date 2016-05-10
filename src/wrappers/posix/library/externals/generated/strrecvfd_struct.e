-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class STRRECVFD_STRUCT
-- Wrapper of struct strrecvfd defined in file /usr/include/x86_64-linux-gnu/bits/stropts.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   strrecvfd_struct_set_fd (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for fd field of STRRECVFD_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strrecvfd_struct_set_fd"
      }"
      end

   strrecvfd_struct_set_uid (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for uid field of STRRECVFD_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strrecvfd_struct_set_uid"
      }"
      end

   strrecvfd_struct_set_gid (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for gid field of STRRECVFD_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strrecvfd_struct_set_gid"
      }"
      end

feature {} -- Low-level queries

   strrecvfd_struct_get_fd (a_structure: POINTER): INTEGER 
         -- Query for fd field of STRRECVFD_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strrecvfd_struct_get_fd"
      }"
      end

   strrecvfd_struct_get_uid (a_structure: POINTER): NATURAL 
         -- Query for uid field of STRRECVFD_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strrecvfd_struct_get_uid"
      }"
      end

   strrecvfd_struct_get_gid (a_structure: POINTER): NATURAL 
         -- Query for gid field of STRRECVFD_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strrecvfd_struct_get_gid"
      }"
      end

	-- Unwrapped private field __fill.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_strrecvfd"
               }"
               end

end -- class STRRECVFD_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
