class ZMQ_STRING_MESSAGE
	-- A ØMQ message containing some human-readable text.

inherit
   ZMQ_MESSAGE
      rename
         is_equal as is_equal_message
      undefine
         fill_tagged_out_memory,
         out_in_tagged_out_memory,
         print_on
      redefine
         update
      end

   NATIVELY_STORED_STRING
      undefine
         default_create
      redefine
         ensure_capacity
      end

   -- TODO: actually this string should be OBSERVABLE from a ZMQ_RECEIVING_SOCKET, fulfilling the same purpose of the ad-hoc update feature 

create {ANY}
   default_create, from_string

create {ZMQ_MESSAGE}
   from_message

create {ZMQ_SOCKET}
   from_external_pointer

feature {} -- Creation
   from_message (a_message: ZMQ_MESSAGE)
         -- Initialize a text message with the same memory area of `a_message'
      do
         not_yet_implemented
         -- allocate
         -- if zmq_msg_copy(handle, a_message.handle)/=0 then
         -- end
      end

   from_string (a_string: ABSTRACT_STRING)
         -- Initialize a ØMQ message with the content of `a_string'.

         -- Actually the message will be built using the intern of `a_string'.
         -- This allows proper and optimal memory handling minimizing data copy.
      require
         a_string /= Void
      do
         allocate
         -- Intern `a_string' to get a plain memory area containing the actual
         -- content and store the interned string to avoid it being collected.
		 storage := storage.calloc(a_string.count+1)
         count := a_string.count
		 capacity := a_string.count+1
         storage.copy_from(a_string.intern.storage, capacity)
         is_successful := zmq_msg_init_data (handle, storage.to_pointer, integer_to_size_t (capacity),default_pointer,default_pointer)=0
		 -- TODO: use 4th and 5th arguments, free function and hint.
         if not is_successful then --handle error
            not_yet_implemented
         end
      end

feature {ANY}
   update
      do
         count := size.to_integer_32
         capacity := count
		 storage := storage.from_pointer(zmq_msg_data(handle))
      end

feature {ANY} -- Specializing natively stored string
   ensure_capacity (needed_capacity: like capacity)
	 local new: like handle; rc: INTEGER_32
      do
         if needed_capacity > count then
			 not_yet_implemented
             -- storage := storage.realloc(count, needed_capacity) if zmq_msg_init_size(handle, storage.to_pointer, 
         end
      end

   hash_code: INTEGER_32
      do
      end

   recycle
      do
         -- nothing
      end

   to_external: POINTER
      do
         Result := zmq_msg_data(handle)
      end

   intern: FIXED_STRING
      do
         create Result.from_external_sized_copy(zmq_msg_data(handle), zmq_msg_size(handle).to_integer_32)
      end

   substring (start_index, end_index: INTEGER): like Current
      do
         not_yet_implemented
      end

end -- class ZMQ_STRING_MESSAGE

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
