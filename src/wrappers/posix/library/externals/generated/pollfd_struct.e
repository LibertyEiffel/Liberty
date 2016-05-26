-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class POLLFD_STRUCT
-- Wrapper of struct pollfd defined in file /usr/include/x86_64-linux-gnu/sys/poll.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   pollfd_struct_set_fd (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for fd field of POLLFD_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "pollfd_struct_set_fd"
      }"
      end

   pollfd_struct_set_events (a_structure: POINTER; a_value: INTEGER_16) 
         -- Setter for events field of POLLFD_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "pollfd_struct_set_events"
      }"
      end

   pollfd_struct_set_revents (a_structure: POINTER; a_value: INTEGER_16) 
         -- Setter for revents field of POLLFD_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "pollfd_struct_set_revents"
      }"
      end

feature {} -- Low-level queries

   pollfd_struct_get_fd (a_structure: POINTER): INTEGER 
         -- Query for fd field of POLLFD_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "pollfd_struct_get_fd"
      }"
      end

   pollfd_struct_get_events (a_structure: POINTER): INTEGER_16 
         -- Query for events field of POLLFD_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "pollfd_struct_get_events"
      }"
      end

   pollfd_struct_get_revents (a_structure: POINTER): INTEGER_16 
         -- Query for revents field of POLLFD_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "pollfd_struct_get_revents"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_pollfd"
               }"
               end

end -- class POLLFD_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
