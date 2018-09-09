-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class HASHED_BIJECTIVE_DICTIONARY_NODE[V_, K_]
   --
   -- Auxiliary class to implement HASHED_BIJECTIVE_DICTIONARY.
   --

inherit
   ANY_HASHED_BIJECTIVE_DICTIONARY_NODE

create {HASHED_BIJECTIVE_DICTIONARY}
   make

feature {HASHED_BIJECTIVE_DICTIONARY}
   val: V_

   key: K_

   next_key: like Current
         -- The forward link to the next `key' in case of hash-code clash.

   next_val: like Current
         -- The forward link to the next `val' in case of hash-code clash.

   make (v: like val; nv: like next_val; k: like key; nk: like next_key)
      require
         v /= Void
         k /= Void
      do
         val := v
         next_val := nv
         key := k
         next_key := nk
      ensure
         val = v
         next_val = nv
         key = k
         next_key = nk
      end

   set_val (v: like val)
      do
         val := v
      ensure
         val = v
      end

   set_next_val (nv: like next_val)
      do
         next_val := nv
      ensure
         next_val = nv
      end

   set_key (k: like key)
      do
         key := k
      ensure
         key = k
      end

   set_next_key (nk: like next_key)
      do
         next_key := nk
      ensure
         next_key = nk
      end

   set_val_and_key (v: like val; k: like key)
      do
         val := v
         key := k
      ensure
         val = v
         key = k
      end

invariant
   key /= Void
   val /= Void

end -- class HASHED_BIJECTIVE_DICTIONARY_NODE
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
