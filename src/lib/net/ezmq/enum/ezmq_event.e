-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
expanded class EZMQ_EVENT

insert
   HASHABLE
      redefine
         default_create
      end

feature {ANY}
   value_of (a_type: INTEGER): EZMQ_EVENT
      do
         if map.has(a_type) then
            Result := map.at(type)
         end
      ensure
         Result.is_valid implies Result.type = a_type
      end

   is_set (a_value: INTEGER): BOOLEAN
      do
         Result := type & a_value = type
      end

feature {ANY} -- The only valid values:
   Pollin: EZMQ_EVENT
         -- ZMQ_POLLIN
      once
         Result.make(Type_pollin)
      end

   Pollout: EZMQ_EVENT
         -- ZMQ_POLLOUT
      once
         Result.make(Type_pollout)
      end

   Pollerr: EZMQ_EVENT
         -- ZMQ_POLLERR
      once
         Result.make(Type_pollerr)
      end

feature {ANY}
   is_valid: BOOLEAN
      do
         Result := type /= 0
      end

   type: INTEGER

   hash_code: INTEGER
      do
         Result := type
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := type = other.type
      end

feature {EZMQ_EVENT}
   make (a_type: like type)
      require
         a_type /= 0
      do
         type := a_type
         map.add(Current, type)
      ensure
         type = a_type
         is_valid
      end

feature {}
   default_create
      do
         init
      end

   init
      local
         e: EZMQ_EVENT
      once
         e := Pollin
         e := Pollout
         e := Pollerr
      end

   map: HASHED_DICTIONARY[EZMQ_EVENT, INTEGER]
      once
         create Result.make
      end

feature {}
   Type_pollin: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "ZMQ_POLLIN"
         }"
      end

   Type_pollout: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "ZMQ_POLLOUT"
         }"
      end

   Type_pollerr: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "ZMQ_POLLERR"
         }"
      end

end -- class EZMQ_EVENT
--
-- Copyright (C) 2009-2017: by all the people cited in the AUTHORS file.
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
