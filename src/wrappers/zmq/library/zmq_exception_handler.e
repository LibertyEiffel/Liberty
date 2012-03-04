deferred class ZMQ_EXCEPTION_HANDLER
insert 
	EXCEPTIONS undefine copy, is_equal, default_create end
	ERRNO undefine default_create end

feature 
	handle_return_value (a_return_value: INTEGER_32) is
		do
			if a_return_value/=0 then
				throw(create {ZMQ_EXCEPTION}.from_errno(errno))
			end
		end
end

