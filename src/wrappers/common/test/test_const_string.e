class TEST_CONST_STRING

inherit
   EIFFELTEST_TOOLS

create {ANY}
   make

feature {ANY}
   make
      local
         cs: CONST_STRING; s: STRING
      do
         s := "teststring"
         create cs.from_external(const_s_ptr)

         assert(cs.count = 10)
         assert(s.is_equal(cs))
         assert(s <= cs)
         assert(s >= cs)
         assert(cs > "test")
         assert(cs >= "test")
         assert(cs <= "teststring-long")
         assert(cs < "teststring-long")
         assert(cs.in_range(create {CONST_STRING}.from_external(short_const_s_ptr), create {CONST_STRING}.from_external(long_const_s_ptr)))
      end

feature {} -- externals
   const_s_ptr: POINTER
      external "C macro"
      alias "%"teststring%""
      end

   short_const_s_ptr: POINTER
      external "C macro"
      alias "%"test%""
      end

   long_const_s_ptr: POINTER
      external "C macro"
      alias "%"teststring-long%""
      end

end -- class TEST_CONST_STRING

-- Copyright (C) 2009-2016: , 2013 Paolo Redaelli, 2013 Cyril Adrian

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
 
