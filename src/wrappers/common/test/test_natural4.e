class TEST_NATURAL4

inherit
   EIFFELTEST_TOOLS

create {ANY}
   make

feature {ANY}
   make
      local
         n0, n1: NATURAL_8
      do
         n0.make_from_signed(4)
         n1 := {NATURAL_8 4, << 0 >> }

         assert(n0 = n1)
      end

end -- class TEST_NATURAL4

-- Copyright (C) 2009-2018: , 2013 Paolo Redaelli, 2013 Cyril Adrian

-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public License
-- as published by the Free Software Foundation; either version 2.1 of
-- the License, or (at your option) any later version.
--
-- This library is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-- 02110-1301 USA
 
