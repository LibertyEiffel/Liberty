-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GPOLL_FD_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

   gpoll_fd_struct_set_fd (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for fd field of GPOLL_FD_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gpoll_fd_struct_set_fd"
      }"
      end

   gpoll_fd_struct_set_events (a_structure: POINTER; a_value: NATURAL_16) 
         -- Setter for events field of GPOLL_FD_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gpoll_fd_struct_set_events"
      }"
      end

   gpoll_fd_struct_set_revents (a_structure: POINTER; a_value: NATURAL_16) 
         -- Setter for revents field of GPOLL_FD_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gpoll_fd_struct_set_revents"
      }"
      end

feature {} -- Low-level queries

   gpoll_fd_struct_get_fd (a_structure: POINTER): INTEGER 
         -- Query for fd field of GPOLL_FD_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gpoll_fd_struct_get_fd"
      }"
      end

   gpoll_fd_struct_get_events (a_structure: POINTER): NATURAL_16 
         -- Query for events field of GPOLL_FD_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gpoll_fd_struct_get_events"
      }"
      end

   gpoll_fd_struct_get_revents (a_structure: POINTER): NATURAL_16 
         -- Query for revents field of GPOLL_FD_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gpoll_fd_struct_get_revents"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GPollFD"
               }"
               end

end -- class GPOLL_FD_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
