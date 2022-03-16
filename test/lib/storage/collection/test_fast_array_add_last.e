-- This file is part of Liberty Eiffel, the new incarnation of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.

class TEST_FAST_ARRAY_ADD_LAST

insert EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   fai: FAST_ARRAY[INTEGER]

   make
      do
         create fai
         assert(fai.count = 0);
         fai.add_last(42)
         assert(fai.count = 1);
         3.times(agent is do
                 fai.add_last(42)
             end)
         assert (fai.count = 4)
      end

end -- class TEST_FAST_ARRAY_ADD_LAST

-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright (C) 2013-2022: Paolo Redaelli
