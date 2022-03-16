-- This file is part of Liberty Eiffel Libraries.
-- See the Copyright notice at the end of this file.
class TEST_BOUNDED_BY
   -- Testing COMPARABLE.bounded_by

insert
   EIFFELTEST_TOOLS

create {ANY}
   make

feature {ANY}
   make
      local
         a, b, c: INTEGER_8; d, e, f: INTEGER_16
      do
         assert(10.bounded_by(5, 20) = 10)
         assert(2.bounded_by(5, 20) = 5)
         assert((-2).bounded_by(5, 20) = 5)
         assert(22.bounded_by(5, 20) = 20)

         assert((3 / 4).bounded_by(2 / 3, 4 / 5) = 3 / 4)
         assert((2 / 3).bounded_by(3 / 4, 4 / 5) = 3 / 4)
         assert((4 / 5).bounded_by(2 / 3, 3 / 4) = 3 / 4)

         a := 5
         b := 10
         c := 20
         assert(a.bounded_by(b, c) = b)
         assert(b.bounded_by(a, c) = b)
         assert(c.bounded_by(a, b) = b)

         d := 1005
         e := 1010
         f := 1020
         assert(d.bounded_by(e, f) = e)
         assert(e.bounded_by(d, f) = e)
         assert(f.bounded_by(d, e) = e)

         test_dates
      end

   test_dates
      local
         a, b, c, d: TIME
      do
         a.update
         b.copy(a)
         c.copy(a)
         b.add_hour(2)
         c.add_day(1)

         assert(a.bounded_by(b, c) ~ b)
         assert(c.bounded_by(a, b) ~ b)
         assert(b.bounded_by(a, c) ~ b)
         d := a.bounded_by(b, c)
         assert(d ~ b)
         d := c.bounded_by(a, b)
         assert(d ~ b)
         d := b.bounded_by(a, c)
         assert(b.bounded_by(a, c) ~ b)
      end

end -- class TEST_BOUNDED_BY
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright (C) 2013-2022: Paolo Redaelli
