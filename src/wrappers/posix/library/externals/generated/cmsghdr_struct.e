-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class CMSGHDR_STRUCT
-- Wrapper of struct cmsghdr defined in file /usr/include/x86_64-linux-gnu/bits/socket.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   cmsghdr_struct_set_cmsg_len (a_structure: POINTER; a_value: like size_t) 
         -- Setter for cmsg_len field of CMSGHDR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cmsghdr_struct_set_cmsg_len"
      }"
      end

   cmsghdr_struct_set_cmsg_level (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for cmsg_level field of CMSGHDR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cmsghdr_struct_set_cmsg_level"
      }"
      end

   cmsghdr_struct_set_cmsg_type (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for cmsg_type field of CMSGHDR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cmsghdr_struct_set_cmsg_type"
      }"
      end

feature {} -- Low-level queries

   cmsghdr_struct_get_cmsg_len (a_structure: POINTER): like size_t 
         -- Query for cmsg_len field of CMSGHDR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cmsghdr_struct_get_cmsg_len"
      }"
      end

   cmsghdr_struct_get_cmsg_level (a_structure: POINTER): INTEGER 
         -- Query for cmsg_level field of CMSGHDR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cmsghdr_struct_get_cmsg_level"
      }"
      end

   cmsghdr_struct_get_cmsg_type (a_structure: POINTER): INTEGER 
         -- Query for cmsg_type field of CMSGHDR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "cmsghdr_struct_get_cmsg_type"
      }"
      end

	-- Unwrapped private field __cmsg_data.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_cmsghdr"
               }"
               end

end -- class CMSGHDR_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
