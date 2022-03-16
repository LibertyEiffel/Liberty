-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class EZMQ_ZMQ_POLLITEMS
   --
   -- Management of the zmq array of zmq_pollitem_t
   --

insert
   EZMQ_ZMQ

create {ANY}
   make, with_capacity

feature {ANY}
   count: INTEGER

feature {EZMQ_SOCKET}
   set (socket: POINTER; event: EZMQ_EVENT)
      local
         item: POINTER
      do
         item := find(items, count, socket)
         if item.is_null then
            if count = capacity then
               capacity := grow_array(items, capacity)
            end
            if count < capacity then
               count := count + 1
               item := add(items, count, socket)
            end
         end
         if item.is_null then
            crash
         end
         set_event(item, event.type)
      end

   is_polled (socket: POINTER; event: EZMQ_EVENT): BOOLEAN
      do
         Result := check_event(items, count, socket, event.type) /= 0
      end

feature {EZMQ_HUB}
   poll (hub: EZMQ_HUB; timeout: INTEGER_64; data: EZMQ_DATA)
      local
         r: INTEGER
      do
         r := poll_events(items, count, timeout, hub, data)
         if r /= 0 then
            poll_error_action.call([r, hub])
         end
      end

feature {}
   with_capacity (needed_capacity: like capacity)
      require
         needed_capacity > 0
      do
         items := new_array(needed_capacity);
         capacity := needed_capacity
      end

   make
      do
         with_capacity(Default_capacity)
      end

   grow_array (a_items: like items; a_capacity: like capacity): like capacity
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "pollitem_grow"
         }"
      end

   new_array (a_capacity: like capacity): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "pollitem_new"
         }"
      end

   find (a_items: like items; a_count: like count; socket: POINTER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "pollitem_find"
         }"
      end

   add (a_items: like items; a_count: like count; socket: POINTER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "pollitem_add"
         }"
      end

   set_event (a_item: POINTER; event: INTEGER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "pollitem_event"
         }"
      end

   check_event (a_items: like items; a_count: like count; a_socket: POINTER; event: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "pollitem_event"
         }"
      end

   poll_events (a_items: like items; a_count: like count; a_timeout: INTEGER_64; hub: EZMQ_HUB; data: EZMQ_DATA): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "pollitem_poll"
         }"
      end

   items: POINTER
   capacity: INTEGER

   Default_capacity: INTEGER 4

end -- class EZMQ_ZMQ_POLLITEMS
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
