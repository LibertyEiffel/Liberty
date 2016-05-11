-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class MSGHDR_STRUCT
-- Wrapper of struct msghdr defined in file /usr/include/x86_64-linux-gnu/bits/socket.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   msghdr_struct_set_msg_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for msg_name field of MSGHDR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msghdr_struct_set_msg_name"
      }"
      end

   msghdr_struct_set_msg_namelen (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for msg_namelen field of MSGHDR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msghdr_struct_set_msg_namelen"
      }"
      end

   msghdr_struct_set_msg_iov (a_structure: POINTER; a_value: POINTER) 
         -- Setter for msg_iov field of MSGHDR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msghdr_struct_set_msg_iov"
      }"
      end

   msghdr_struct_set_msg_iovlen (a_structure: POINTER; a_value: like size_t) 
         -- Setter for msg_iovlen field of MSGHDR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msghdr_struct_set_msg_iovlen"
      }"
      end

   msghdr_struct_set_msg_control (a_structure: POINTER; a_value: POINTER) 
         -- Setter for msg_control field of MSGHDR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msghdr_struct_set_msg_control"
      }"
      end

   msghdr_struct_set_msg_controllen (a_structure: POINTER; a_value: like size_t) 
         -- Setter for msg_controllen field of MSGHDR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msghdr_struct_set_msg_controllen"
      }"
      end

   msghdr_struct_set_msg_flags (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for msg_flags field of MSGHDR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msghdr_struct_set_msg_flags"
      }"
      end

feature {} -- Low-level queries

   msghdr_struct_get_msg_name (a_structure: POINTER): POINTER 
         -- Query for msg_name field of MSGHDR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msghdr_struct_get_msg_name"
      }"
      end

   msghdr_struct_get_msg_namelen (a_structure: POINTER): NATURAL 
         -- Query for msg_namelen field of MSGHDR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msghdr_struct_get_msg_namelen"
      }"
      end

   msghdr_struct_get_msg_iov (a_structure: POINTER): POINTER 
         -- Query for msg_iov field of MSGHDR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msghdr_struct_get_msg_iov"
      }"
      end

   msghdr_struct_get_msg_iovlen (a_structure: POINTER): like size_t 
         -- Query for msg_iovlen field of MSGHDR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msghdr_struct_get_msg_iovlen"
      }"
      end

   msghdr_struct_get_msg_control (a_structure: POINTER): POINTER 
         -- Query for msg_control field of MSGHDR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msghdr_struct_get_msg_control"
      }"
      end

   msghdr_struct_get_msg_controllen (a_structure: POINTER): like size_t 
         -- Query for msg_controllen field of MSGHDR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msghdr_struct_get_msg_controllen"
      }"
      end

   msghdr_struct_get_msg_flags (a_structure: POINTER): INTEGER 
         -- Query for msg_flags field of MSGHDR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msghdr_struct_get_msg_flags"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_msghdr"
               }"
               end

end -- class MSGHDR_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
