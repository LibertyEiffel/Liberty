-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class MMSGHDR_STRUCT
-- Wrapper of struct mmsghdr defined in file /usr/include/x86_64-linux-gnu/sys/socket.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   mmsghdr_struct_set_msg_len (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for msg_len field of MMSGHDR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "mmsghdr_struct_set_msg_len"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field msg_hdr.
   mmsghdr_struct_get_msg_len (a_structure: POINTER): NATURAL 
         -- Query for msg_len field of MMSGHDR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "mmsghdr_struct_get_msg_len"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_mmsghdr"
               }"
               end

end -- class MMSGHDR_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
