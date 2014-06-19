-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_MUTABLE_BIG_INTEGER20
   -- Test of `negate'.

insert
   AUX_MUTABLE_BIG_INTEGER1

create {}
   make

feature {ANY}
   make
      local
         i: INTEGER
      do
         from
            i := numbers1.lower
         until
            i > numbers1.upper
         loop
            numbers1.item(i).negate
            assert(numbers1.item(i).is_equal(res.item(i)))
            i := i + 1
         end
      end

   res: FAST_ARRAY[MUTABLE_BIG_INTEGER]
         -- Expected results.
      once
         Result := {FAST_ARRAY[MUTABLE_BIG_INTEGER] << create {MUTABLE_BIG_INTEGER}.from_integer(0), create {MUTABLE_BIG_INTEGER}.from_integer(-1), create {MUTABLE_BIG_INTEGER}.from_integer(1), create {MUTABLE_BIG_INTEGER}.from_integer(-2), create {MUTABLE_BIG_INTEGER}.from_integer(2), create {MUTABLE_BIG_INTEGER}.from_integer(-3), create {MUTABLE_BIG_INTEGER}.from_integer(3), create {MUTABLE_BIG_INTEGER}.from_integer(-1000), create {MUTABLE_BIG_INTEGER}.from_integer(1000), create {MUTABLE_BIG_INTEGER}.from_integer(-1000000000), create {MUTABLE_BIG_INTEGER}.from_integer(1000000000), create {MUTABLE_BIG_INTEGER}.from_integer(-Maximum_integer), create {MUTABLE_BIG_INTEGER}.from_integer(Maximum_integer), create {MUTABLE_BIG_INTEGER}.from_integer(Minimum_integer), create {MUTABLE_BIG_INTEGER}.from_integer_64(-Minimum_integer.to_integer_64), create {MUTABLE_BIG_INTEGER}.from_integer_64(-Maximum_integer_64), create {MUTABLE_BIG_INTEGER}.from_integer_64(Maximum_integer_64), create {MUTABLE_BIG_INTEGER}.from_integer_64(Minimum_integer_64), create {MUTABLE_BIG_INTEGER}.from_string("9223372036854775808"), create {MUTABLE_BIG_INTEGER}.from_string("-1000000000000000000"), create {MUTABLE_BIG_INTEGER}.from_string("1000000000000000000"), create {MUTABLE_BIG_INTEGER}.from_string("-1000000000000000000000000000000"), create {MUTABLE_BIG_INTEGER}.from_string("1000000000000000000000000000000"), create {MUTABLE_BIG_INTEGER}.from_string("-100000000000000000000000000000000000000000000000000"), create {MUTABLE_BIG_INTEGER}.from_string("100000000000000000000000000000000000000000000000000"), create {MUTABLE_BIG_INTEGER}.from_string("-99999999999999999999999999999999999999999999999999"), create {MUTABLE_BIG_INTEGER}.from_string("99999999999999999999999999999999999999999999999999"), create {MUTABLE_BIG_INTEGER}.from_string("-100000000000000000000000000000000000000000000000001"), create {MUTABLE_BIG_INTEGER}.from_string("100000000000000000000000000000000000000000000000001") >> }
      end

end -- class TEST_MUTABLE_BIG_INTEGER20
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
