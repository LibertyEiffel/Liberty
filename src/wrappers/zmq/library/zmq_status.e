deferred class ZMQ_STATUS
	-- Status reporting of øMQ sockets, messages, contextes 
insert 
	EXCEPTIONS undefine copy, is_equal, default_create end
	ERRNO undefine default_create end

feature {ANY} -- Status
	is_successful: BOOLEAN 
	-- Was last command successful?

	is_unsuccessful: BOOLEAN
		do
			Result:=not is_successful
		end


feature {ANY} 
	handle_return_value (a_return_value: INTEGER_32)
		do
			if a_return_value/=0 then
				throw(zmq_exception)
			end
		end

	zmq_exception: ZMQ_EXCEPTION
		do
			create Result.from_errno
		end
end

-- Zero MQ Liberty Wrappers

-- Copyright (C) 2012-2018: Paolo Redaelli, 2013 Cyril Adrian 

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

