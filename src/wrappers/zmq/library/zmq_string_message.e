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
         ensure_capacity,
         set_count,
         set_storage,
         storage
      end

create {ANY}
   default_create, from_string

create {ZMQ_MESSAGE}
   from_message

create {ZMQ_SOCKET}
   from_external_pointer

feature {} -- Creation
   from_message (a_message: ZMQ_MESSAGE) is
         -- Initialize a text message with the same memory area of `a_message'
      do
         not_yet_implemented
         allocate
         if zmq_msg_copy(handle, a_message.handle)/=0 then

         end
      end

   from_string (a_string: ABSTRACT_STRING) is
         -- Initialize a ØMQ message with the content of `a_string'.

         -- Actually the message will be built using the intern of `a_string'.
         -- This allows proper and optimal memory handling minimizing data copy.
      require
         a_string /= Void
      do
         allocate
         -- Intern `a_string' to get a plain memory area containing the actual
         -- content and store the interned string to avoid it being collected.

         is_successful := zmq_msg_init_size(handle, integer_to_size_t (a_string.count + 1))=0
         -- the +1 needs to account for the trailing terminating zero
         if not is_successful then --handle error
            not_yet_implemented
         end
         storage.copy_from(a_string.intern.storage, a_string.count)
         count := a_string.count
         capacity := count
      end

feature {ANY}
   update is
      do
         count := size.to_integer_32
         capacity := count
      end

feature {ANY} -- Specializing natively stored string
   set_count (new_count: like count) is
      do
         count := new_count
      end

   ensure_capacity (needed_capacity: like capacity) is
         -- local new: like handle; rc: INTEGER_32
      do
         if needed_capacity > count then
            not_yet_implemented
            -- new := malloc(struct_size)
            --rc := zmq_msg_init_size(handle,needed_capacity)
         end
      end

   set_storage (new_storage: like storage; new_capacity: like capacity) is
      do
         not_yet_implemented
      end

   storage: NATIVE_ARRAY[CHARACTER] is
      do
         Result := Result.from_pointer(zmq_msg_data(handle))
      end

   hash_code: INTEGER_32 is
      do
      end

   recycle is
      do
         -- nothing
      end

   to_external: POINTER is
      do
         Result := zmq_msg_data(handle)
      end

   intern: FIXED_STRING is
      do
         create Result.from_external_sized_copy(zmq_msg_data(handle), zmq_msg_size(handle).to_integer_32)
      end

   substring (start_index, end_index: INTEGER): like Current is
      do
         not_yet_implemented
      end

end -- class ZMQ_STRING_MESSAGE

-- Zero MQ Liberty Wrappers

-- Copyright (C) 2010, 2012 Paolo Redaelli

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
