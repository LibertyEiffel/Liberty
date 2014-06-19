-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_SIMPLIFY05

create {}
   make

feature {ANY}
   make
      local
         bool: BOOLEAN
      do
         -- The generated code should only contains the following
         -- instruction:
         check_order(0)
         -- --------------------------------------------------------------------
         -- inspect statement:
         inspect
            1
         when 1 then
            check_order(1)
         when 2 then
            c_inline_c("#1 in boost_simplify05")
         when 3 then
            c_inline_c("#2 in boost_simplify05")
         end
         inspect
            2
         when 1 then
            c_inline_c("#3 in boost_simplify05")
         when 2 then
            check_order(2)
         when 3 then
            c_inline_c("#4 in boost_simplify05")
         end
         inspect
            3
         when 1 then
            c_inline_c("#5 in boost_simplify05")
         when 2 then
            c_inline_c("#6 in boost_simplify05")
         when 3 then
            check_order(3)
         end
         --
         inspect
            'a'
         when 'a' then
            check_order(4)
         when 'b' then
            c_inline_c("#7 in boost_simplify05")
         when 'c' then
            c_inline_c("#8 in boost_simplify05")
         end
         inspect
            'b'
         when 'a' then
            c_inline_c("#9 in boost_simplify05")
         when 'b' then
            check_order(5)
         when 'c' then
            c_inline_c("#10 in boost_simplify05")
         end
         inspect
            'c'
         when 'a' then
            c_inline_c("#11 in boost_simplify05")
         when 'b' then
            c_inline_c("#12 in boost_simplify05")
         when 'c' then
            check_order(6)
         end
         --
         inspect
            4
         when 1 then
            c_inline_c("#13 in boost_simplify05")
         when 2 then
            c_inline_c("#14 in boost_simplify05")
         when 3 then
            c_inline_c("#15 in boost_simplify05")
         else
            check_order(7)
         end
         inspect
            'd'
         when 'a' then
            c_inline_c("#16 in boost_simplify05")
         when 'b' then
            c_inline_c("#17 in boost_simplify05")
         when 'c' then
            c_inline_c("#18 in boost_simplify05")
         else
            check_order(8)
         end
         --
         inspect
            'd'
         when 'a' then
            c_inline_c("#19 in boost_simplify05")
         when 'b' then
            c_inline_c("#20 in boost_simplify05")
         when 'c' then
            c_inline_c("#21 in boost_simplify05")
         else
         end
         inspect
            4
         when 1 then
            c_inline_c("#22 in boost_simplify05")
         when 2 then
            c_inline_c("#23 in boost_simplify05")
         when 3 then
            c_inline_c("#24 in boost_simplify05")
         else
         end
         --
         inspect
            1
         when 1 .. 2 then
            check_order(9)
         when 3 .. 4 then
            c_inline_c("#25 in boost_simplify05")
         when 5 .. 6 then
            c_inline_c("#26 in boost_simplify05")
         end
         inspect
            'a'
         when 'a' .. 'b' then
            check_order(10)
         when 'c' .. 'd' then
            c_inline_c("#27 in boost_simplify05")
         when 'e' .. 'f' then
            c_inline_c("#28 in boost_simplify05")
         end
         --
         inspect
            7
         when 1 .. 2 then
            c_inline_c("#29 in boost_simplify05")
         when 3 .. 4 then
            c_inline_c("#30 in boost_simplify05")
         when 5 .. 6 then
            c_inline_c("#31 in boost_simplify05")
         else
            check_order(11)
         end
         inspect
            'g'
         when 'a' .. 'b' then
            c_inline_c("#32 in boost_simplify05")
         when 'c' .. 'd' then
            c_inline_c("#33 in boost_simplify05")
         when 'e' .. 'f' then
            c_inline_c("#34 in boost_simplify05")
         else
            check_order(12)
         end
         --
         inspect
            'g'
         when 'a' .. 'b' then
            c_inline_c("#35 in boost_simplify05")
         when 'c' .. 'd' then
            c_inline_c("#36 in boost_simplify05")
         when 'e' .. 'f' then
            c_inline_c("#37 in boost_simplify05")
         else
         end
         inspect
            7
         when 1 .. 2 then
            c_inline_c("#38 in boost_simplify05")
         when 3 .. 4 then
            c_inline_c("#39 in boost_simplify05")
         when 5 .. 6 then
            c_inline_c("#40 in boost_simplify05")
         else
         end
         -- --------------------------------------------------------------------
         -- if-then-else  statement:
         if True then
            check_order(13)
         end
         if True then
         end
         if False then
            c_inline_c("#41 in boost_simplify05")
         end
         --
         if True then
            check_order(14)
         else
            c_inline_c("#42 in boost_simplify05")
         end
         if True then
         else
            c_inline_c("#43 in boost_simplify05")
         end
         if False then
            c_inline_c("#44 in boost_simplify05")
         else
            check_order(15)
         end
         if False then
            c_inline_c("#45 in boost_simplify05")
         end
         --
         if True then
            check_order(16)
         elseif True then
            c_inline_c("#46 in boost_simplify05")
         else
            c_inline_c("#47 in boost_simplify05")
         end
         if True then
            check_order(17)
         elseif False then
            c_inline_c("#48 in boost_simplify05")
         else
            c_inline_c("#48 in boost_simplify05")
         end
         if False then
            c_inline_c("#50 in boost_simplify05")
         elseif True then
            check_order(18)
         else
            c_inline_c("#51 in boost_simplify05")
         end
         if False then
            c_inline_c("#52 in boost_simplify05")
         elseif True then
         else
            c_inline_c("#53 in boost_simplify05")
         end
         if False then
            c_inline_c("#54 in boost_simplify05")
         elseif False then
            c_inline_c("#55 in boost_simplify05")
         else
            check_order(19)
         end
         if False then
            c_inline_c("#56 in boost_simplify05")
         elseif False then
            c_inline_c("#57 in boost_simplify05")
         end
         --
         if True then
            check_order(20)
         elseif True then
            c_inline_c("#58 in boost_simplify05")
         elseif True then
            c_inline_c("#59 in boost_simplify05")
         else
            c_inline_c("#60 in boost_simplify05")
         end
         if True then
            check_order(21)
         elseif False then
            c_inline_c("#61 in boost_simplify05")
         elseif True then
            c_inline_c("#62 in boost_simplify05")
         else
            c_inline_c("#63 in boost_simplify05")
         end
         if True then
            check_order(22)
         elseif True then
            c_inline_c("#64 in boost_simplify05")
         elseif False then
            c_inline_c("#65 in boost_simplify05")
         else
            c_inline_c("#66 in boost_simplify05")
         end
         if True then
            check_order(23)
         elseif False then
            c_inline_c("#67 in boost_simplify05")
         elseif False then
            c_inline_c("#68 in boost_simplify05")
         else
            c_inline_c("#69 in boost_simplify05")
         end
         if True then
            check_order(24)
         elseif False then
            c_inline_c("#70 in boost_simplify05")
         elseif True then
            c_inline_c("#71 in boost_simplify05")
         else
            c_inline_c("#72 in boost_simplify05")
         end
         if False then
            c_inline_c("#73 in boost_simplify05")
         elseif True then
            check_order(25)
         elseif True then
            c_inline_c("#74 in boost_simplify05")
         else
            c_inline_c("#75 in boost_simplify05")
         end
         if False then
            c_inline_c("#76 in boost_simplify05")
         elseif True then
            check_order(26)
         elseif False then
            c_inline_c("#77 in boost_simplify05")
         else
            c_inline_c("#78 in boost_simplify05")
         end
         if False then
            c_inline_c("#79 in boost_simplify05")
         elseif False then
            c_inline_c("#80 in boost_simplify05")
         elseif True then
            check_order(27)
         else
            c_inline_c("#81 in boost_simplify05")
         end
         if False then
            c_inline_c("#82 in boost_simplify05")
         elseif False then
            c_inline_c("#83 in boost_simplify05")
         elseif True then
         else
            c_inline_c("#84 in boost_simplify05")
         end
         if False then
            c_inline_c("#85 in boost_simplify05")
         elseif False then
            c_inline_c("#86 in boost_simplify05")
         elseif False then
            c_inline_c("#87 in boost_simplify05")
         else
            check_order(28)
         end
         if False then
            c_inline_c("#88 in boost_simplify05")
         elseif False then
            c_inline_c("#89 in boost_simplify05")
         elseif False then
            c_inline_c("#90 in boost_simplify05")
         end
         --
         if is_order(bool, 29) then
            never_here
         end
         if is_order(bool, 30) then
            never_here
         else
            check_order(31)
         end
         --
         if is_order(bool, 32) then
            never_here
         elseif is_order(bool, 33) then
            never_here
         end
         if is_order(bool, 34) then
            never_here
         elseif is_order(bool, 35) then
            never_here
         else
            check_order(36)
         end
         if True then
            check_order(37)
         elseif is_order(bool, 37) then
            c_inline_c("#91 in boost_simplify05")
         else
            c_inline_c("#92 in boost_simplify05")
         end
         if False then
            c_inline_c("#93 in boost_simplify05")
         elseif is_order(bool, 38) then
            never_here
         else
            check_order(39)
         end
         if False then
            c_inline_c("#94 in boost_simplify05")
         elseif is_order(bool, 40) then
            never_here
         elseif is_order(bool, 41) then
            never_here
         else
            check_order(42)
         end
         if is_order(bool, 43) then
            never_here
         elseif False then
            c_inline_c("#95 in boost_simplify05")
         elseif True then
            check_order(44)
         end
         if 0.is_default then
            check_order(45)
         else
            c_inline_c("#96 in boost_simplify05")
         end
         if False.is_default then
            check_order(46)
         else
            c_inline_c("#97 in boost_simplify05")
         end
         if 0.0.is_default then
            check_order(47)
         else
            c_inline_c("#98 in boost_simplify05")
         end
         if '%U'.is_default then
            check_order(48)
         else
            c_inline_c("#99 in boost_simplify05")
         end
         if Current.to_pointer.is_default then
            never_here
         end
         if True = True then
            check_order(49)
         end
         if (True and True) = True then
            check_order(50)
         end
         if True = (True and True) then
            check_order(51)
         end
         if True /= False then
            check_order(52)
         else
            c_inline_c("#100 in boost_simplify05")
         end
         if False /= True then
            check_order(53)
         else
            c_inline_c("#101 in boost_simplify05")
         end
         if a_integer_3 = 3 then
            check_order(54)
         end
         if a_void_1 = Void then
            check_order(55)
         end
         if a_void_2 = Void then
            check_order(56)
         end
         if Current.is_default then
            never_here
         else
            check_order(57)
         end
         -- Testing implies:
         if True implies True then
            check_order(58)
         else
            c_inline_c("#102 in boost_simplify05")
         end
         if True implies False then
            c_inline_c("#103 in boost_simplify05")
         else
            check_order(59)
         end
         if False implies True then
            check_order(60)
         else
            c_inline_c("#104 in boost_simplify05")
         end
         if False implies False then
            check_order(61)
         else
            c_inline_c("#105 in boost_simplify05")
         end
         if False implies no_evaluation then
            check_order(62)
         else
            c_inline_c("#106 in boost_simplify05")
         end
         if False implies no_evaluation then
            check_order(63)
         else
            c_inline_c("#107 in boost_simplify05")
         end
         if 1.same_dynamic_type(2) then
            check_order(64)
         end
         if 1.same_dynamic_type(2) then
            check_order(65)
         end
         if same_dynamic_type(Current) then
            check_order(66)
         end
         if same_dynamic_type(Current) then
            check_order(67)
         end
         -- Last one:
         check_order(68)
      end

   no_evaluation: BOOLEAN
         -- Should never be called.
      do
         -- To make this function not computable.
         if previous_n = 10 then
            Result := True
         end
         sedb_breakpoint
         std_output.put_string("TEST_SIMPLIFY05: ERROR (no_evaluation).%N")
      end

   a_integer_3: INTEGER
      do
         Result := 1 + 2
      end

   a_void_1: ANY
      do
         Result := Void
      end

   a_void_2: ANY
      do
      end

   previous_n: INTEGER
         -- To check that `check_order' call are in the original
         -- order.

   check_order (n: INTEGER)
      do
         if n /= previous_n then
            sedb_breakpoint
            std_output.put_string("TEST_SIMPLIFY_2: ERROR Test # ")
            std_output.put_integer(previous_n)
            std_output.put_string("%N")
         end
         previous_n := previous_n + 1
      end

   is_order (r: BOOLEAN; n: INTEGER): BOOLEAN
      do
         check_order(n)
         Result := r
      end

   never_here
      do
         sedb_breakpoint
         std_output.put_string("TEST_SIMPLIFY_2: ERROR 'never_here' executed.%N")
      end

end -- class TEST_SIMPLIFY05
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
