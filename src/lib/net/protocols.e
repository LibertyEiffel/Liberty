-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
expanded class PROTOCOLS
--
-- The PROTOCOL factory. You may register your own protocols here.
--
-- See `register_protocol_factory'
--

insert
   ANY
      redefine
         default_create
      end

feature {ANY}
   register_protocol_factory (a_protocol_name: ABSTRACT_STRING; a_factory: FUNCTION[TUPLE, PROTOCOL])
      require
         a_protocol_name.count > 0
         not known_protocol(a_protocol_name)
      do
         factories.add(a_factory, a_protocol_name.intern)
      ensure
         known_protocol(a_protocol_name)
      end

feature {ANY}
   known_protocol (a_protocol_name: ABSTRACT_STRING): BOOLEAN
      require
         a_protocol_name.count > 0
      do
         Result := factories.fast_has(a_protocol_name.intern)
      end

   protocol (a_protocol_name: ABSTRACT_STRING): PROTOCOL
      require
         a_protocol_name.count > 0
         known_protocol(a_protocol_name)
      local
         u: RECYCLING_POOL[PROTOCOL]
         name: FIXED_STRING
      do
         name := a_protocol_name.intern
         u := unused_protocols(name)
         if u.is_empty then
            Result := factories.fast_at(name).item([])
         else
            Result := u.item
         end
      ensure
         not Result.is_connected
      end

   recycle (a_protocol: PROTOCOL)
      require
         not a_protocol.is_connected
      do
         unused_protocols(a_protocol.name).recycle(a_protocol)
      end

feature {}
   factories: DICTIONARY[FUNCTION[TUPLE, PROTOCOL], FIXED_STRING]
      once
         create {HASHED_DICTIONARY[FUNCTION[TUPLE, PROTOCOL], FIXED_STRING]} Result.make
      end

   init
      local
         http, https: FIXED_STRING
      once
         http := "http".intern
         https := "https".intern
         register_protocol_factory(http, agent new_http(http, 80))
         register_protocol_factory(https, agent new_http(https, 443)) -- that's wrong of course (where is the SSL layer?)
         register_protocol_factory("file".intern, agent new_file)
      end

   new_http (name: FIXED_STRING; port: INTEGER): HTTP_PROTOCOL
      require
         name = name.intern
      do
         create Result.make(name, port)
         Result.sync := True
      end

   new_file: FILE_PROTOCOL
      do
         create Result.make
      end

feature {} -- Protocol reuse
   unused: HASHED_DICTIONARY[RECYCLING_POOL[PROTOCOL], FIXED_STRING]
      once
         create Result.make
      end

   unused_protocols (a_protocol_name: FIXED_STRING): RECYCLING_POOL[PROTOCOL]
      do
         Result := unused.fast_reference_at(a_protocol_name)
         if Result = Void then
            create Result.make
            unused.add(Result, a_protocol_name)
         end
      ensure
         Result /= Void
      end

feature {} -- Creation
   default_create
      do
         init
      end

end -- class PROTOCOLS
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
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
