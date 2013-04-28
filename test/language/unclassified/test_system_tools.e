-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_SYSTEM_TOOLS

inherit
   SYSTEM_TOOLS

create {}
   runit

feature {ANY}
   runit is
      do
         c_compiler := gcc
         system_name := unix_system
         check_it(1, "f1.o")
         check_it(2, "f1.o f2.o")
         check_it(3, "f[1-3].o")
         check_it(4, "f[1-4].o")
         check_it(5, "f[1-5].o")
         check_it(6, "f[1-6].o")
         check_it(7, "f[1-7].o")
         check_it(8, "f[1-8].o")
         check_it(9, "f[1-9].o")
         check_it(10, "f[1-9].o f10.o")
         check_it(11, "f[1-9].o f1[0-1].o")
         check_it(12, "f[1-9].o f1[0-2].o")
         check_it(13, "f[1-9].o f1[0-3].o")
         check_it(14, "f[1-9].o f1[0-4].o")
         check_it(15, "f[1-9].o f1[0-5].o")
         check_it(16, "f[1-9].o f1[0-6].o")
         check_it(17, "f[1-9].o f1[0-7].o")
         check_it(18, "f[1-9].o f1[0-8].o")
         check_it(19, "f[1-9].o f1[0-9].o")
         check_it(20, "f[1-9].o f1[0-9].o f20.o")
         check_it(21, "f[1-9].o f1[0-9].o f2[0-1].o")
         check_it(22, "f[1-9].o f1[0-9].o f2[0-2].o")
         check_it(23, "f[1-9].o f1[0-9].o f2[0-3].o")
         check_it(24, "f[1-9].o f1[0-9].o f2[0-4].o")
         check_it(25, "f[1-9].o f1[0-9].o f2[0-5].o")
         check_it(26, "f[1-9].o f1[0-9].o f2[0-6].o")
         check_it(27, "f[1-9].o f1[0-9].o f2[0-7].o")
         check_it(28, "f[1-9].o f1[0-9].o f2[0-8].o")
         check_it(29, "f[1-9].o f[1-2][0-9].o")
         check_it(30, "f[1-9].o f[1-2][0-9].o f30.o")
         check_it(31, "f[1-9].o f[1-2][0-9].o f3[0-1].o")
         check_it(32, "f[1-9].o f[1-2][0-9].o f3[0-2].o")
         check_it(33, "f[1-9].o f[1-2][0-9].o f3[0-3].o")
         check_it(34, "f[1-9].o f[1-2][0-9].o f3[0-4].o")
         check_it(35, "f[1-9].o f[1-2][0-9].o f3[0-5].o")
         check_it(36, "f[1-9].o f[1-2][0-9].o f3[0-6].o")
         check_it(37, "f[1-9].o f[1-2][0-9].o f3[0-7].o")
         check_it(38, "f[1-9].o f[1-2][0-9].o f3[0-8].o")
         check_it(39, "f[1-9].o f[1-3][0-9].o")
         check_it(40, "f[1-9].o f[1-3][0-9].o f40.o")
         check_it(41, "f[1-9].o f[1-3][0-9].o f4[0-1].o")
         check_it(42, "f[1-9].o f[1-3][0-9].o f4[0-2].o")
         check_it(43, "f[1-9].o f[1-3][0-9].o f4[0-3].o")
         check_it(44, "f[1-9].o f[1-3][0-9].o f4[0-4].o")
         check_it(45, "f[1-9].o f[1-3][0-9].o f4[0-5].o")
         check_it(46, "f[1-9].o f[1-3][0-9].o f4[0-6].o")
         check_it(47, "f[1-9].o f[1-3][0-9].o f4[0-7].o")
         check_it(48, "f[1-9].o f[1-3][0-9].o f4[0-8].o")
         check_it(49, "f[1-9].o f[1-4][0-9].o")
         check_it(50, "f[1-9].o f[1-4][0-9].o f50.o")
         check_it(51, "f[1-9].o f[1-4][0-9].o f5[0-1].o")
         check_it(52, "f[1-9].o f[1-4][0-9].o f5[0-2].o")
         check_it(53, "f[1-9].o f[1-4][0-9].o f5[0-3].o")
         check_it(54, "f[1-9].o f[1-4][0-9].o f5[0-4].o")
         check_it(55, "f[1-9].o f[1-4][0-9].o f5[0-5].o")
         check_it(56, "f[1-9].o f[1-4][0-9].o f5[0-6].o")
         check_it(57, "f[1-9].o f[1-4][0-9].o f5[0-7].o")
         check_it(58, "f[1-9].o f[1-4][0-9].o f5[0-8].o")
         check_it(59, "f[1-9].o f[1-5][0-9].o")
         check_it(60, "f[1-9].o f[1-5][0-9].o f60.o")
         check_it(61, "f[1-9].o f[1-5][0-9].o f6[0-1].o")
         check_it(62, "f[1-9].o f[1-5][0-9].o f6[0-2].o")
         check_it(63, "f[1-9].o f[1-5][0-9].o f6[0-3].o")
         check_it(64, "f[1-9].o f[1-5][0-9].o f6[0-4].o")
         check_it(65, "f[1-9].o f[1-5][0-9].o f6[0-5].o")
         check_it(66, "f[1-9].o f[1-5][0-9].o f6[0-6].o")
         check_it(67, "f[1-9].o f[1-5][0-9].o f6[0-7].o")
         check_it(68, "f[1-9].o f[1-5][0-9].o f6[0-8].o")
         check_it(69, "f[1-9].o f[1-6][0-9].o")
         check_it(70, "f[1-9].o f[1-6][0-9].o f70.o")
         check_it(71, "f[1-9].o f[1-6][0-9].o f7[0-1].o")
         check_it(72, "f[1-9].o f[1-6][0-9].o f7[0-2].o")
         check_it(73, "f[1-9].o f[1-6][0-9].o f7[0-3].o")
         check_it(74, "f[1-9].o f[1-6][0-9].o f7[0-4].o")
         check_it(75, "f[1-9].o f[1-6][0-9].o f7[0-5].o")
         check_it(76, "f[1-9].o f[1-6][0-9].o f7[0-6].o")
         check_it(77, "f[1-9].o f[1-6][0-9].o f7[0-7].o")
         check_it(78, "f[1-9].o f[1-6][0-9].o f7[0-8].o")
         check_it(79, "f[1-9].o f[1-7][0-9].o")
      ensure
         Current = old Current
      end

   check_it (n: INTEGER; match: STRING) is
      local
         cmd: STRING
      do
         create cmd.make(4)
         add_objects(cmd, "f", n)
         assert(match.is_equal(cmd))
      end

   assert (b: BOOLEAN) is
      do
         cpt := cpt + 1
         if not b then
            sedb_breakpoint
            std_output.put_string("TEST_SYSTEM_TOOLS: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         end
      end

   cpt: INTEGER

end -- class TEST_SYSTEM_TOOLS
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
