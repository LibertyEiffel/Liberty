-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class MQUEUE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	mq_close (a_mqdes: INTEGER): INTEGER 

		-- function mq_close (in `/usr/include/mqueue.h')
               -- mq_close
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mq_close"
               }"
               end

	mq_getattr (a_mqdes: INTEGER; a_mqstat: POINTER): INTEGER 

		-- function mq_getattr (in `/usr/include/mqueue.h')
               -- mq_getattr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mq_getattr"
               }"
               end

	mq_notify (a_mqdes: INTEGER; a_notification: POINTER): INTEGER 

		-- function mq_notify (in `/usr/include/mqueue.h')
               -- mq_notify
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mq_notify"
               }"
               end

	mq_open (a_name: POINTER; an_oflag: INTEGER): INTEGER 

		-- function mq_open (in `/usr/include/mqueue.h')
               -- mq_open (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mq_open"
               }"
               end

	mq_receive (a_mqdes: INTEGER; a_msg_ptr: POINTER; a_msg_len: like size_t; a_msg_prio: POINTER): like ssize_t 

		-- function mq_receive (in `/usr/include/mqueue.h')
               -- mq_receive
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mq_receive"
               }"
               end

	mq_send (a_mqdes: INTEGER; a_msg_ptr: POINTER; a_msg_len: like size_t; a_msg_prio: NATURAL): INTEGER 

		-- function mq_send (in `/usr/include/mqueue.h')
               -- mq_send
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mq_send"
               }"
               end

	mq_setattr (a_mqdes: INTEGER; a_mqstat: POINTER; an_omqstat: POINTER): INTEGER 

		-- function mq_setattr (in `/usr/include/mqueue.h')
               -- mq_setattr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mq_setattr"
               }"
               end

	mq_timedreceive (a_mqdes: INTEGER; a_msg_ptr: POINTER; a_msg_len: like size_t; a_msg_prio: POINTER; an_abs_timeout: POINTER): like ssize_t 

		-- function mq_timedreceive (in `/usr/include/mqueue.h')
               -- mq_timedreceive
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mq_timedreceive"
               }"
               end

	mq_timedsend (a_mqdes: INTEGER; a_msg_ptr: POINTER; a_msg_len: like size_t; a_msg_prio: NATURAL; an_abs_timeout: POINTER): INTEGER 

		-- function mq_timedsend (in `/usr/include/mqueue.h')
               -- mq_timedsend
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mq_timedsend"
               }"
               end

	mq_unlink (a_name: POINTER): INTEGER 

		-- function mq_unlink (in `/usr/include/mqueue.h')
               -- mq_unlink
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mq_unlink"
               }"
               end


end -- class MQUEUE_EXTERNALS
