-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class FOREIGN_TYPE

insert
   ANY
      redefine
         is_equal
      end

feature {ANY}
   ffi_type: POINTER

   is_equal (other: like Current): BOOLEAN
      do
         Result := ffi_type = other.ffi_type
      end

feature {FOREIGN_TYPES}
   set_ffi_type (a_ffi_type: like ffi_type; a_factory: like factory; a_name: like name)
      do
         ffi_type := a_ffi_type
         factory := a_factory
         name := a_name
      end

feature {FOREIGN_AGENT}
   new: FOREIGN_OBJECT
      do
         Result := factory.item([])
      end

feature {}
   factory: FUNCTION[TUPLE, FOREIGN_OBJECT]
   name: STRING

end -- class FOREIGN_TYPE
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
