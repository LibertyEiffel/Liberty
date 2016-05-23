-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class PACKRAT

feature {} -- Tune exports to your liking if need be
   one: INTEGER_8 0
   zero_or_one: INTEGER_8 1
   zero_or_more: INTEGER_8 2
   one_or_more: INTEGER_8 3

   seq (a_primaries: TRAVERSABLE[PACKRAT_PRIMARY]; a_how_many: INTEGER_8; a_tag: ABSTRACT_STRING; a_action: PROCEDURE[TUPLE]): PACKRAT_ALTERNATIVE
      require
         a_primaries /= Void
         a_how_many.in_range(one, one_or_more)
      do
         create {PACKRAT_SEQUENCE} Result.make(a_primaries, a_how_many, a_tag, a_action)
      end

   ref (a_atom_name: ABSTRACT_STRING): PACKRAT_PRIMARY
      require
         a_atom_name /= Void
      do
         create {PACKRAT_REFERENCE} Result.make(a_atom_name)
      end

end -- class PACKRAT
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
