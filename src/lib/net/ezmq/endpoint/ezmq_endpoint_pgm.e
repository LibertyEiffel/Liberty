-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class EZMQ_ENDPOINT_PGM

inherit
   EZMQ_ENDPOINT_IMPL

create {EZMQ}
   make

feature {EZMQ}
   to_external: POINTER
      do
         Result := ext.to_external
      end

feature {}
   make (a_interface, a_address: ABSTRACT_STRING; a_port: INTEGER)
      do
         interface := a_interface.intern
         address := a_address.intern
         port := a_port
         ext := interface.out
         ext.extend(';')
         ext.append(address)
         ext.extend(':')
         port.append_in(ext)
      end

   interface, address: FIXED_STRING; port: INTEGER
   ext: STRING

invariant
   ext.is_equal(once "#(1);#(2):#(3)" # interface # address # &port)

end -- class EZMQ_ENDPOINT_PGM
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
