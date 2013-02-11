deferred class ZMQ_STATUS
	-- Status reporting of øMQ sockets, messages, contextes 
insert 
	EXCEPTIONS undefine copy, is_equal, default_create end
	ERRNO undefine default_create end

feature -- Status
	is_successful: BOOLEAN 
	-- Was last command successful?

	is_unsuccessful: BOOLEAN is
		do
			Result:=not is_successful
		end


feature 
	handle_return_value (a_return_value: INTEGER_32) is
		do
			if a_return_value/=0 then
				throw(zmq_exception)
			end
		end

	zmq_exception: ZMQ_EXCEPTION is
		do
			create Result.from_errno
		end
end

