class ZMQ_MESSAGE
	-- ØMQ message

	-- Note: current design is a sketch. Most probably we want to make it a generic class allowing data to be of specific types instead of being ANY.
inherit 
	C_STRUCT redefine default_create end 
	EIFFEL_OWNED redefine default_create, dispose end 
insert
	ZMQ_STATUS
	ZMQ_EXTERNALS redefine default_create end
	ZMQ_MSG_T_STRUCT redefine default_create end
	STDLIB_EXTERNALS redefine default_create end
	EXCEPTIONS undefine copy, default_create, is_equal end
	ERRNO redefine default_create end

create {ANY} copy,default_create, with_size

feature {} -- Creation
	default_create
		-- Initialize an empty ØMQ message
		do
			handle := malloc(struct_size)
			is_successful:=zmq_msg_init(handle)=0
			if is_unsuccessful then throw(zmq_exception) end
		end

	with_size (a_size: like size)
		-- Initialize a ØMQ message `a_size' bytes long. The implementation
		-- chooses whether it is more efficient to store message content on the
		-- stack (small  messages) or  on  the  heap  (large  messages).

		-- TODO: a_size: like size_t
	local res: INTEGER_32
	do
		handle := malloc(struct_size)
		is_successful:=zmq_msg_init_size(handle,a_size)=0
		if is_unsuccessful then throw(zmq_exception) end
	end

	--with (some_data: ANY)
	--	-- Initialize a ØMQ message with `some_data'; the
	--	-- physical piece of memory is referred by and NOT copied. This means
	--	-- that 
	--	
	--	-- * if you change `some_data' the changes will also affect Current
	--	--   message.

	--	-- * object references in `some_data' are not part of the message; in
	--	-- particular the native array composing the body of a STRING is not
	--	-- part of the message.

	--	-- * expanded object may not be put into a message.

	--	-- * `some_data' will no be disposed until Current message is alive.
	--require some_data/=Void
	--local res: INTEGER_32
	--do
	--	allocate
	--	-- Keep a reference to some_data; we do not want it to be freed or garbage-collected.
	--	any_data := some_data
	--	res:=zmq_msg_init_data(handle, some_data.to_pointer, some_data.object_size.to_natural_32, default_pointer, default_pointer)
	--ensure
	--	implementation: data=some_data.to_pointer and size=some_data.object_size.to_natural_32
	--end

feature {ANY} -- Queries
	size: like zmq_msg_size
		-- the size of message content
	
		-- TODO: shall be like size_t
	do
		Result := zmq_msg_size(handle)
	end

feature {ANY} -- Convertions.
	as_string_message: ZMQ_STRING_MESSAGE
		-- A string message with the same content of
	do
		create Result.from_message(Current)
	end

feature {ANY} -- Disposing
	dispose
		do
			close
			free(handle)
		end
	

feature {ANY} -- Command
	initialize
		-- Initialize message
	do
		is_successful := zmq_msg_init(handle)=0
		if is_unsuccessful then throw(zmq_exception) end
	end

feature {ZMQ_RECEIVING_SOCKET} 
	update
		-- Do whatever is needed to update the status of Current. Used by
		-- receive commands of a ZMQ_RECEIVING_SOCKET.  For example a
		-- ZMQ_STRING_MESSAGE will look for its actual lenght after being
		-- received.
	do end

feature {} -- Implementation
	close
		do
			handle_return_value(zmq_msg_close(handle))
		end
	
	data: POINTER
		do
			Result:=zmq_msg_data(handle)
		end

end -- ZMQ_MESSAGE

-- Zero MQ Liberty Wrappers

-- Copyright (C) 2010-2017: Paolo Redaelli 

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

