class ZMQ_STRING_MESSAGE
	-- A ØMQ message made by a string.

inherit 
	ZMQ_MESSAGE

creation
	default_create, with_string

feature {} -- Creation
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
		string:=a_string
		res:=zmq_msg_init_data(handle,a_string.to_external,a_string.count.to_natural_32,default_pointer, default_pointer)
		-- The two default-pointers means that ØMQ will not free the data buffer, so we may use STRING.from_external and avoid a copy
	ensure
		implementation: string=a_string --.to_external --and size = a_string.count.to_natural_32
	end

feature -- 
	to_string: ABSTRACT_STRING is
		-- The actual content of the message
	local s: STRING
	do
		if string=Void then
			create s.from_external(data)
			string := s.intern
		end
		Result:=string
	end

feature {} -- Implementation
	string: FIXED_STRING is
		-- The actual content of the message
		attribute
	end
	
end -- class ZMQ_STRING_MESSAGE

