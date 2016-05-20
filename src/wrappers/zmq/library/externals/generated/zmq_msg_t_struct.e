-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class ZMQ_MSG_T_STRUCT
-- Wrapper of struct  defined in file /usr/include/zmq.h

insert STANDARD_C_LIBRARY_TYPES

	ZMQ_TYPES
feature {} -- Low-level setters

   zmq_msg_t_struct_set_content (a_structure: POINTER; a_value: POINTER) 
         -- Setter for content field of ZMQ_MSG_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "zmq_msg_t_struct_set_content"
      }"
      end

   zmq_msg_t_struct_set_flags (a_structure: POINTER; a_value: CHARACTER) 
         -- Setter for flags field of ZMQ_MSG_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "zmq_msg_t_struct_set_flags"
      }"
      end

   zmq_msg_t_struct_set_vsm_size (a_structure: POINTER; a_value: CHARACTER) 
         -- Setter for vsm_size field of ZMQ_MSG_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "zmq_msg_t_struct_set_vsm_size"
      }"
      end

   zmq_msg_t_struct_set_vsm_data (a_structure: POINTER; a_value: POINTER) 
         -- Setter for vsm_data field of ZMQ_MSG_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "zmq_msg_t_struct_set_vsm_data"
      }"
      end

feature {} -- Low-level queries

   zmq_msg_t_struct_get_content (a_structure: POINTER): POINTER 
         -- Query for content field of ZMQ_MSG_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "zmq_msg_t_struct_get_content"
      }"
      end

   zmq_msg_t_struct_get_flags (a_structure: POINTER): CHARACTER 
         -- Query for flags field of ZMQ_MSG_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "zmq_msg_t_struct_get_flags"
      }"
      end

   zmq_msg_t_struct_get_vsm_size (a_structure: POINTER): CHARACTER 
         -- Query for vsm_size field of ZMQ_MSG_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "zmq_msg_t_struct_get_vsm_size"
      }"
      end

   zmq_msg_t_struct_get_vsm_data (a_structure: POINTER): POINTER 
         -- Query for vsm_data field of ZMQ_MSG_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "zmq_msg_t_struct_get_vsm_data"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_zmq_msg_t"
               }"
               end

end -- class ZMQ_MSG_T_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
