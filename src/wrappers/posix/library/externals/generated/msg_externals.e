-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class MSG_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	msgctl (a_msqid: INTEGER; a_cmd: INTEGER; a_buf: POINTER): INTEGER 

		-- function msgctl (in `/usr/include/x86_64-linux-gnu/sys/msg.h')
               -- msgctl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "msgctl"
               }"
               end

	msgget (a_key: INTEGER; a_msgflg: INTEGER): INTEGER 

		-- function msgget (in `/usr/include/x86_64-linux-gnu/sys/msg.h')
               -- msgget
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "msgget"
               }"
               end

	msgrcv (a_msqid: INTEGER; a_msgp: POINTER; a_msgsz: like size_t; a_msgtyp: like long; a_msgflg: INTEGER): like ssize_t 

		-- function msgrcv (in `/usr/include/x86_64-linux-gnu/sys/msg.h')
               -- msgrcv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "msgrcv"
               }"
               end

	msgsnd (a_msqid: INTEGER; a_msgp: POINTER; a_msgsz: like size_t; a_msgflg: INTEGER): INTEGER 

		-- function msgsnd (in `/usr/include/x86_64-linux-gnu/sys/msg.h')
               -- msgsnd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "msgsnd"
               }"
               end


end -- class MSG_EXTERNALS
