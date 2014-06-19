-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_STRING15

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      do
         assert(not ("").is_integer)
         assert(("153548").is_integer)
         assert(("2147483647").is_integer)
         assert(("+2147483647").is_integer)
         assert(not ("2147483648").is_integer)
         assert(not ("2247483647").is_integer)
         assert(not ("21474836470").is_integer)
         assert(not ("+21474836470").is_integer)
         assert(not ("30000000000").is_integer)
         assert(("-105240").is_integer)
         assert(("-2147483648").is_integer)
         assert(not ("-2147483649").is_integer)
         assert(not ("-21474836480").is_integer)
         assert(not ("-40000000000").is_integer)
         assert(not ("").is_integer_64)
         assert(("153548").is_integer_64)
         assert(("2147483647").is_integer_64)
         assert(("+2147483647").is_integer_64)
         assert(("2147483648").is_integer_64)
         assert(("2247483647").is_integer_64)
         assert(("21474836470").is_integer_64)
         assert(("+21474836470").is_integer_64)
         assert(("30000000000").is_integer_64)
         assert(("-105240").is_integer_64)
         assert(("-2147483648").is_integer_64)
         assert(("-2147483649").is_integer_64)
         assert(("-21474836480").is_integer_64)
         assert(("-40000000000").is_integer_64)
         assert(("9223372036854775807").is_integer_64)
         assert(("-9223372036854775808").is_integer_64)
         assert(not ("9223372036854775808").is_integer_64)
         assert(not ("-9223372036854775809").is_integer_64)
         assert(not ("-9300000000000000000").is_integer_64)
         assert(not ("9300000000000000000").is_integer_64)
         assert(not ("-100000000000000000000").is_integer_64)
         assert(not ("100000000000000000000").is_integer_64)
      end

end -- class TEST_STRING15
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
