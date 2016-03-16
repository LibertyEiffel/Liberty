-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class ZMQ_POLLITEM_T_STRUCT
-- Wrapper of struct  defined in file /usr/include/zmq.h

insert STANDARD_C_LIBRARY_TYPES

	ZMQ_TYPES
feature {} -- Low-level setters

   zmq_pollitem_t_struct_set_socket (a_structure: POINTER; a_value: POINTER) 
         -- Setter for socket field of ZMQ_POLLITEM_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "zmq_pollitem_t_struct_set_socket"
      }"
      end

   zmq_pollitem_t_struct_set_fd (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for fd field of ZMQ_POLLITEM_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "zmq_pollitem_t_struct_set_fd"
      }"
      end

   zmq_pollitem_t_struct_set_events (a_structure: POINTER; a_value: INTEGER_16) 
         -- Setter for events field of ZMQ_POLLITEM_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "zmq_pollitem_t_struct_set_events"
      }"
      end

   zmq_pollitem_t_struct_set_revents (a_structure: POINTER; a_value: INTEGER_16) 
         -- Setter for revents field of ZMQ_POLLITEM_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "zmq_pollitem_t_struct_set_revents"
      }"
      end

feature {} -- Low-level queries

   zmq_pollitem_t_struct_get_socket (a_structure: POINTER): POINTER 
         -- Query for socket field of ZMQ_POLLITEM_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "zmq_pollitem_t_struct_get_socket"
      }"
      end

   zmq_pollitem_t_struct_get_fd (a_structure: POINTER): INTEGER 
         -- Query for fd field of ZMQ_POLLITEM_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "zmq_pollitem_t_struct_get_fd"
      }"
      end

   zmq_pollitem_t_struct_get_events (a_structure: POINTER): INTEGER_16 
         -- Query for events field of ZMQ_POLLITEM_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "zmq_pollitem_t_struct_get_events"
      }"
      end

   zmq_pollitem_t_struct_get_revents (a_structure: POINTER): INTEGER_16 
         -- Query for revents field of ZMQ_POLLITEM_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "zmq_pollitem_t_struct_get_revents"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_zmq_pollitem_t"
               }"
               end

end -- class ZMQ_POLLITEM_T_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
