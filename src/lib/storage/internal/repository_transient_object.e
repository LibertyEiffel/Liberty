-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class REPOSITORY_TRANSIENT_OBJECT

inherit
   HASHABLE
   COMPARABLE
      redefine is_equal
      end

insert
   RECYCLABLE
      redefine is_equal
      end
   INTERNALS_HANDLER
      redefine is_equal
      end

create {REPOSITORY_TRANSIENT}
   make, set

feature {ANY}
   hash_code: INTEGER
      do
         if internals /= Void then
            Result := internals.object_as_pointer.hash_code
         end
      end

   infix "<" (other: like Current): BOOLEAN
      do
         Result := hash_code < other.hash_code
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := hash_code = other.hash_code
      end

feature {REPOSITORY_TRANSIENT}
   set (a_internals: like internals; a_key: like key)
      require
         not a_internals.type_is_expanded
         a_internals.object_as_pointer /= default_pointer
         a_key /= Void
      do
         internals := a_internals
         key := a_key
      ensure
         internals = a_internals
         key = a_key
      end

   internals: INTERNALS

   key: STRING

   reset
      do
         internals := Void
         key := Void
      ensure
         internals = Void
         key = Void
      end

feature {RECYCLING_POOL}
   recycle
      do
         reset
      end

feature {}
   make
      do
      end

invariant
   internals /= Void implies not internals.type_is_expanded
   internals /= Void implies internals.object_as_pointer /= default_pointer
   internals /= Void = (key /= Void)

end -- class REPOSITORY_TRANSIENT_OBJECT
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
