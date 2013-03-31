-- This file is part of LibertyEiffel Libraries.
-- See the Copyright notice at the end of this file.

class TEST_CLAMP
   -- Testing NUMERIC.clamp
insert EIFFELTEST_TOOLS

creation {ANY} make

feature {ANY}
   make is
      local
         a,b,c: INTEGER_8; d,e,f: INTEGER_16
      do
         assert((10).clamp(5,20) = 10)
         assert(( 2).clamp(5,20) =  5)
         assert((-2).clamp(5,20) =  5)
         assert((22).clamp(5,20) = 20)

         assert((3/4).clamp(2/3, 4/5) =  3/4)
         assert((2/3).clamp(3/4, 4/5) =  3/4)
         assert((4/5).clamp(2/3, 3/4) =  3/4)
      
         a := 5; b:= 10; c:= 20
         assert( a.clamp(b,c) = b)
         assert( b.clamp(a,c) = b)
         assert( c.clamp(a,b) = b)

         d:= 1005; e:= 1010; f:= 1020
         assert( d.clamp(e,f) = e)
         assert( e.clamp(d,f) = e)
         assert( f.clamp(d,e) = e)

      end
end -- class TEST_CLAMP

-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- LibertyEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- LibertyEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 2011: Paolo Redaelli
