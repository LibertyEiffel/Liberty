-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class MSGBUF_STRUCT
-- Wrapper of struct msgbuf defined in file /usr/include/x86_64-linux-gnu/sys/msg.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   msgbuf_struct_set_mtype (a_structure: POINTER; a_value: like long) 
         -- Setter for mtype field of MSGBUF_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msgbuf_struct_set_mtype"
      }"
      end

   msgbuf_struct_set_mtext (a_structure: POINTER; a_value: POINTER) 
         -- Setter for mtext field of MSGBUF_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msgbuf_struct_set_mtext"
      }"
      end

feature {} -- Low-level queries

   msgbuf_struct_get_mtype (a_structure: POINTER): like long 
         -- Query for mtype field of MSGBUF_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msgbuf_struct_get_mtype"
      }"
      end

   msgbuf_struct_get_mtext (a_structure: POINTER): POINTER 
         -- Query for mtext field of MSGBUF_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msgbuf_struct_get_mtext"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_msgbuf"
               }"
               end

end -- class MSGBUF_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
