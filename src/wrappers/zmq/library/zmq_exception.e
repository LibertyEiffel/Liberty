class ZMQ_EXCEPTION
	-- An exception caused by the ZMQ library
inherit EXCEPTION
insert 
	ERRNO
	ZMQ_EXTERNALS

create {ZMQ_STATUS, ZMQ_CONTEXT, ZMQ_SOCKET, ZMQ_MESSAGE} from_errno
feature {} -- Creation
	from_errno
		do
			error_code := errno
			create description.from_external(zmq_strerror(error_code))
			-- Perhaps creating a FIXED_STRING with from_external using a const char* will end up in freeing the const memory which is clearly wrong.
		end
feature {ANY} 
	description: FIXED_STRING 
	error_code: like errno
end -- class ZMQ_EXCEPTION

-- Zero MQ Liberty Wrappers

-- Copyright (C) 2012-2016: Paolo Redaelli, 2013 Cyril Adrian

-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public
-- License as published by the Free Software Foundation; either
-- version 3 of the License, or (at your option) any later version.
-- 
-- This library is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
-- 
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

