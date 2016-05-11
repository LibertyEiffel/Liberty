-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class MQ_ATTR_STRUCT
-- Wrapper of struct mq_attr defined in file /usr/include/x86_64-linux-gnu/bits/mqueue.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   mq_attr_struct_set_mq_flags (a_structure: POINTER; a_value: like long) 
         -- Setter for mq_flags field of MQ_ATTR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "mq_attr_struct_set_mq_flags"
      }"
      end

   mq_attr_struct_set_mq_maxmsg (a_structure: POINTER; a_value: like long) 
         -- Setter for mq_maxmsg field of MQ_ATTR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "mq_attr_struct_set_mq_maxmsg"
      }"
      end

   mq_attr_struct_set_mq_msgsize (a_structure: POINTER; a_value: like long) 
         -- Setter for mq_msgsize field of MQ_ATTR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "mq_attr_struct_set_mq_msgsize"
      }"
      end

   mq_attr_struct_set_mq_curmsgs (a_structure: POINTER; a_value: like long) 
         -- Setter for mq_curmsgs field of MQ_ATTR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "mq_attr_struct_set_mq_curmsgs"
      }"
      end

feature {} -- Low-level queries

   mq_attr_struct_get_mq_flags (a_structure: POINTER): like long 
         -- Query for mq_flags field of MQ_ATTR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "mq_attr_struct_get_mq_flags"
      }"
      end

   mq_attr_struct_get_mq_maxmsg (a_structure: POINTER): like long 
         -- Query for mq_maxmsg field of MQ_ATTR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "mq_attr_struct_get_mq_maxmsg"
      }"
      end

   mq_attr_struct_get_mq_msgsize (a_structure: POINTER): like long 
         -- Query for mq_msgsize field of MQ_ATTR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "mq_attr_struct_get_mq_msgsize"
      }"
      end

   mq_attr_struct_get_mq_curmsgs (a_structure: POINTER): like long 
         -- Query for mq_curmsgs field of MQ_ATTR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "mq_attr_struct_get_mq_curmsgs"
      }"
      end

	-- Unwrapped private field __pad.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_mq_attr"
               }"
               end

end -- class MQ_ATTR_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
