-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
expanded class EZMQ_FLAGS

insert
   HASHABLE
      redefine
         default_create
      end

feature {ANY}
   value_of (a_flags: INTEGER): EZMQ_FLAGS
      do
         if map.has(a_flags) then
            Result := map.at(flags)
         end
      ensure
         Result.is_valid implies Result.flags = a_flags
      end

feature {ANY} -- The only valid values:
   Dontwait: EZMQ_FLAGS
         -- ZMQ_DONTWAIT
      once
         Result.make(Flags_dontwait, True)
      end

   Sndmore: EZMQ_FLAGS
         -- ZMQ_SNDMORE
      once
         Result.make(Flags_sndmore, True)
      end

   None: EZMQ_FLAGS
         -- no flags
      once
         Result.make(0, True)
      end

feature {ANY}
   is_valid: BOOLEAN

   flags: INTEGER

   hash_code: INTEGER
      do
         Result := flags
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := flags = other.flags
      end

   combine alias "and" (other: EZMQ_FLAGS): EZMQ_FLAGS
      require
         is_valid
         other.is_valid
      do
         Result.make(flags | other.flags, is_valid and then other.is_valid)
      end

feature {EZMQ_FLAGS}
   make (a_flags: like flags; valid: BOOLEAN)
      require
         a_flags /= 0
      do
         flags := a_flags
         is_valid := valid
         map.add(Current, flags)
      ensure
         flags = a_flags
         is_valid
      end

feature {}
   default_create
      do
         init
      end

   init
      local
         f: EZMQ_FLAGS
      once
         f := Dontwait
         f := Sndmore
      end

   map: HASHED_DICTIONARY[EZMQ_FLAGS, INTEGER]
      once
         create Result.make
      end

feature {}
   Flags_dontwait: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "ZMQ_DONTWAIT"
         }"
      end

   Flags_sndmore: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "net/ezmq"
         feature_name: "ZMQ_SNDMORE"
         }"
      end

end -- class EZMQ_FLAGS
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
