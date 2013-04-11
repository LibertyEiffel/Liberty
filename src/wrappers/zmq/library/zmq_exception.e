class ZMQ_EXCEPTION
	-- An exception caused by the ZMQ library
inherit EXCEPTION
insert 
	ERRNO
	ZMQ_EXTERNALS

creation {ZMQ_STATUS, ZMQ_CONTEXT, ZMQ_SOCKET, ZMQ_MESSAGE} from_errno
feature {} -- Creation
	from_errno is 
		do
			error_code := errno
			create description.from_external(zmq_strerror(error_code))
			-- Perhaps creating a FIXED_STRING with from_external using a const char* will end up in freeing the const memory which is clearly wrong.
		end
feature {ANY} 
	description: FIXED_STRING 
	error_code: like errno
end -- class ZMQ_EXCEPTION
