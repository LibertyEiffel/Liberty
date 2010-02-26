class ZMQ_SOCKET
	-- A ØMQ socket

inherit 
	C_STRUCT
	EIFFEL_OWNED
		redefine 
			dispose
		end

insert
	ZMQEXTERNALS
	ERRNO
	EXCEPTIONS undefine copy, is_equal end

creation {ZMQ_CONTEXT} from_external_pointer

feature {} -- Disposing
	dispose is
		local res: INTEGER
		do
			res := zmq_close(handle)	
			-- TODO: handle return value
		end

feature {ANY} -- Binding
	bind (an_address: ABSTRACT_STRING) is 
		-- Bind Current socket to a particular transport.
	require an_address/=Void
	local res: INTEGER_32
	do
		res := zmq_bind(handle,an_address.to_external)
		if res/=0 then 
			raise(create {STRING}.from_external_copy(zmq_strerror(errno)))
		end
	end

	connect (an_address: ABSTRACT_STRING) is
		-- Connect Current socket to the peer identified by `an_address'.  Actual semantics of the  command depend on the underlying transport mechanism, how‐ ever, in cases where peers connect in an asymetric manner, zmq_bind should be called first, zmq_connect afterwards. Formats of the addr  parameter are defined by individual transports. For a list of supported transports have a look at zmq(7) manual page.

		-- Note that single socket can be connected (and bound) to arbitrary number of peers using different transport mechanisms.
	require an_address/=Void
	local rc: INTEGER_32
	do
		rc:=zmq_connect(handle,an_address.to_external)
		check
			-- TODO: proper error handling
			rc=0
		end
	end
	
	flush is
		-- Flushes pre-sent messages to Current sockect i.e. those that have
		-- been sent with ZMQ_NOFLUSH flag - to the socket. This functionality
		-- improves performance in cases  where  several  messages are sent
		-- during a single business operation.  It should not be used as a
		-- transaction - ACID properties are not guaranteed.  Note  that
		-- calling  zmq_send without ZMQ_NOFLUSH flag automatically flushes all
		-- previously pre-sent messages.
	local res: INTEGER_32
	do
		res:=zmq_flush(handle)
		if res/=0 then
			raise(create {STRING}.from_external_copy(zmq_strerror(errno)))
		end
	end
feature {ANY} -- Receiving messages
	receive (a_message: ZMQ_MESSAGE) is
		-- Receive `a_message' from Current socket; any previous content of
		-- `a_message' will be properly deallocated. Program is blocked until a
		-- message is received; see also `receive_now'.
	local rc: INTEGER_32
	do
		rc:=zmq_recv(handle,a_message.handle,0)
		if rc/=0 then 
			raise("ZMQ_SOCKET.receive error not handled") 
		end
	end

	receive_now (a_message: ZMQ_MESSAGE) is
		-- Receive `a_message' from Current socket; any previous content of
		-- `a_message' will be properly deallocated. If it cannot be processed immediately, errno is set to EAGAIN.

		-- TODO: perhaps non_blocking_receive is a better name?
	local rc: INTEGER_32
	do
		rc:=zmq_recv(handle,a_message.handle,zmq_noblock)
		if rc/=0 then 
			raise("ZMQ_SOCKET.receive error not handled") 
		end
	end
feature {ANY} -- Sending
	send (a_message: ZMQ_MESSAGE) is
		-- Send `a_message'. Blocking call
	require a_message/=Void
	local rc: INTEGER_32
	do
		rc:=zmq_send(handle,a_message.handle,0)
		check rc=0 end
	end
feature {} -- Implementation
	struct_size: INTEGER is
		do
			raise("ØMQ design hides the size of its structures")
		end

feature {} -- Constants
	zmq_noblock: INTEGER_32 is 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ZMQ_NOBLOCK"
		}"
		end


end -- class ZMQ_SOCKET

