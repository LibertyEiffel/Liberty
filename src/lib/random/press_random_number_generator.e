-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PRESS_RANDOM_NUMBER_GENERATOR
   --
   -- Press' standard generator, which uses the MINIMAL_RANDOM_NUMBER_GENERATOR
   -- and then uses shuffling to break up short order correlations.
   --

inherit
   MINIMAL_RANDOM_NUMBER_GENERATOR
      redefine with_seed, last_integer, last_real, next
      end

insert
   MINIMAL_RANDOM_NUMBER_GENERATOR
      rename next as min_next
      export {} min_next
      redefine with_seed, last_integer, last_real
      end

create {ANY}
   make, with_seed

feature {}
   iv: ARRAY[INTEGER]

   ntab: INTEGER 32

   iy: INTEGER

feature {ANY}
   with_seed (seed_value: INTEGER)
      local
         i: INTEGER
      do
         seed := seed_value
         min_next
         create iv.make(1, ntab)
         from
            i := 1
         until
            i > 7
         loop
            min_next
            i := i + 1
         end
         from
            i := ntab
         until
            i = 0
         loop
            iv.put(seed, i)
            min_next
            i := i - 1
         end
         iy := iv.item(1)
         next
      end

   next
      local
         tmp: INTEGER
      do
         tmp := iy #\\ ntab + 1
         min_next
         iy := iv.item(tmp)
         iv.put(seed, tmp)
      end

   last_integer (n: INTEGER): INTEGER
      do
         Result := iy #\\ n + 1
      end

   last_real: REAL
      do
         Result := iy / im
      end

end -- class PRESS_RANDOM_NUMBER_GENERATOR
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
