class ZMQ_MESSAGE
	-- ØMQ message

	-- Note: current design is a sketch. Most probably we want to make it a generic class allowing data to be of specific types instead of being ANY.
inherit 
	C_STRUCT redefine default_create end 
	EIFFEL_OWNED redefine default_create, dispose end 
insert
	ZMQEXTERNALS redefine default_create end
	EXCEPTIONS undefine copy, default_create, is_equal end
	ERRNO redefine default_create end

creation {ANY} default_create, with, with_size, with_string

feature {} -- Creation
	default_create is
		-- Initialize an empty ØMQ message
		local res: INTEGER_32
		do
			allocate
			res:=zmq_msg_init(handle)
		end

	with_size (a_size: NATURAL_32) is
		-- Initialize a ØMQ message `a_size' bytes long. The implementation
		-- chooses whether it is more efficient to store message content on the
		-- stack (small  messages) or  on  the  heap  (large  messages).

		-- TODO: a_size: like size_t
	local res: INTEGER_32
	do
		allocate
		res:=zmq_msg_init_size(handle,a_size)
	end

	with (some_data: ANY) is
		-- Initialize a ØMQ message with `some_data'; the
		-- physical piece of memory is referred by and NOT copied. This means
		-- that 
		
		-- * if you change `some_data' the changes will also affect Current
		--   message.

		-- * object references in `some_data' are not part of the message; in
		-- particular the native array composing the body of a STRING is not
		-- part of the message.

		-- * expanded object may not be put into a message.

		-- * `some_data' will no be disposed until Current message is alive.
	require some_data/=Void
	local res: INTEGER_32
	do
		allocate
		-- Keep a reference to some_data; we do not want it to be freed or garbage-collected.
		any_data := some_data
		res:=zmq_msg_init_data(handle, some_data.to_pointer, some_data.object_size.to_natural_32, default_pointer, default_pointer)
	ensure
		implementation: data=some_data.to_pointer and size=some_data.object_size.to_natural_32
	end

	with_string (a_string: FIXED_STRING) is
		-- Initialize a ØMQ message with the content of `a_string'; the data is NOT
		-- copied only referred by with a pointer. Current minimalist design of the
		-- wrapper requires `a_string' at least not to change size during Current
		-- message lifetime (TODO: check if it shall also not be changed).
		-- FIXED_STRING ensures this.
	require a_string/=Void
	local res: INTEGER_32; 
	do
		allocate
		-- Keep a reference to `a_string'
		any_data:=a_string
		res:=zmq_msg_init_data(handle,a_string.to_external,a_string.count.to_natural_32,default_pointer, default_pointer)
	ensure
		implementation: data=a_string.to_external and size=a_string.count.to_natural_32
	end
feature {ANY} -- Disposing
	dispose is
		local rc: INTEGER_32
		do
			any_data := Void
			rc:=zmq_msg_close(handle)
			check rc=0 end
		end
	
	close is
		local rc: INTEGER_32
		do
			rc:=zmq_msg_close(handle)
			check rc=0 end
		end
	
feature {ANY} -- Command
	initialize is
		-- Initialize message
	local rc: INTEGER_32
	do
		rc := zmq_msg_init(handle)
		check rc/=0 end
		-- Note: It is debatable whenever the following style is reccomendedable:
		-- if rc /= 0 then
		-- 	raise(create {STRING}.from_external_copy(zmq_strerror(errno)))
		-- end
	end

feature {ANY} -- SIze 
	size: NATURAL_32 is
		-- the size of message content
	
		-- TODO: shall be like size_t
	do
		Result := zmq_msg_size(handle)
	end

	data: POINTER is
		do
			Result:=zmq_msg_data(handle)
		end
feature {} -- Implementation
	any_data: ANY is
		-- Reference to the data feed at creation time using `with_data'
		attribute
	end

	struct_size: INTEGER is
		external "C inline"
		alias "sizeof(zmq_msg_t)"
		end
end -- ZMQ_MESSAGE
