-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_SIMPLIFY02
   --
   -- To check that the simplify work is actually done (for -boost mode only).
   --

inherit
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   null_pointer: POINTER
      do
      end

   make
      local
         b_true, b_false: BOOLEAN; local_pointer: POINTER
      do
         b_true := True
         b_false := False
         if True then
            always_run
         else
            c_inline_c("NoCcodeGenerated01")
         end
         if False then
            c_inline_c("NoCcodeGenerated02")
         else
            always_run
         end
         if False then
            c_inline_c("NoCcodeGenerated03")
         elseif True then
            always_run
         else
            c_inline_c("NoCcodeGenerated04")
         end
         if 3 = 3 then
            always_run
         else
            c_inline_c("NoCcodeGenerated05")
         end
         if always_false then
            c_inline_c("NoCcodeGenerated06")
         end
         if always_true then
            always_run
         end
         if True then
            always_run
         end
         if False then
         else
            always_run
         end
         if False then
            c_inline_c("NoCcodeGenerated07")
         elseif False then
            c_inline_c("NoCcodeGenerated08")
         elseif True then
            always_run
         elseif True then
            c_inline_c("NoCcodeGenerated09")
         else
            c_inline_c("NoCcodeGenerated10")
         end
         if False then
            c_inline_c("NoCcodeGenerated11")
         elseif False then
            c_inline_c("NoCcodeGenerated12")
         elseif True then
            always_run
         elseif b_true then
            c_inline_c("NoCcodeGenerated13")
         else
            c_inline_c("NoCcodeGenerated14")
         end
         if b_false then
            assert(False)
         elseif False then
            c_inline_c("NoCcodeGenerated15")
         elseif True then
            always_run
         elseif b_true then
            c_inline_c("NoCcodeGenerated16")
         else
            c_inline_c("NoCcodeGenerated17")
         end
         if False then
            c_inline_c("NoCcodeGenerated18")
         elseif always_false then
            c_inline_c("NoCcodeGenerated19")
         else
            always_run
         end
         if b_true then
            always_run
         elseif always_false then
            c_inline_c("NoCcodeGenerated20")
         elseif always_false then
            c_inline_c("NoCcodeGenerated21")
         else
            assert(False)
         end
         if 4 #\\ 2 = 0 then
            always_run
         else
            c_inline_c("NoCcodeGenerated22")
         end
         if 4 #// 2 = 2 then
            always_run
         else
            c_inline_c("NoCcodeGenerated23")
         end
         if not True then
            c_inline_c("NoCcodeGenerated24")
         end
         if 3 = 0 then
            c_inline_c("NoCcodeGenerated25")
         else
            always_run
         end
         if 3.6 = 3.6 then
            always_run
         else
            c_inline_c("NoCcodeGenerated26")
         end
         if 0 = 1 then
            c_inline_c("NoCcodeGenerated27")
         else
            always_run
         end
         if 1 = 0 then
            c_inline_c("NoCcodeGenerated28")
         else
            always_run
         end
         if 2 = 2 and 3 /= 3 then
            c_inline_c("NoCcodeGenerated29")
         end
         if True /= False then
            always_run
         else
            c_inline_c("NoCcodeGenerated30")
         end
         if null_pointer = default_pointer then
            always_run
         else
            c_inline_c("NoCcodeGenerated31")
         end
         if null_pointer /= default_pointer then
            c_inline_c("NoCcodeGenerated32")
         else
            assert(null_pointer = default_pointer)
         end
         if "foo" = Void then
            c_inline_c("NoCcodeGenerated33")
         else
            always_run
         end
         if {FAST_ARRAY[STRING] << "foo" >> } = Void then
            c_inline_c("NoCcodeGenerated34")
         else
            always_run
         end
         if True = False then
            c_inline_c("NoCcodeGenerated35")
         else
            always_run
         end
         if local_pointer /= is_void.to_pointer then
            assert(False)
            -- No data flow analysis at time being (july 12th 2004)
         else
            always_run
         end
         if local_pointer = is_void.to_pointer then
            assert(local_pointer = default_pointer)
         else
            assert(False)
            -- No data flow analysis at time being (july 12th 2004)
         end
         if "foo" /= Void then
            always_run
         else
            c_inline_c("NoCcodeGenerated38")
         end
         if {ARRAY[STRING] 1, << "foo" >> } /= Void then
            always_run
         else
            c_inline_c("NoCcodeGenerated39")
         end
         if 4 = 4 then
            always_run
         else
            c_inline_c("NoCcodeGenerated40")
         end
         if 2 + 2 - 2 = 2 then
            always_run
         else
            c_inline_c("NoCcodeGenerated41")
         end
         if two = 2 then
            always_run
         else
            c_inline_c("NoCcodeGenerated42")
         end
         if 2 + two = 4 then
            always_run
         else
            c_inline_c("NoCcodeGenerated43")
         end
         if is_void = Void then
            always_run
         else
            c_inline_c("NoCcodeGenerated44")
         end
         if is_void /= Void then
            c_inline_c("NoCcodeGenerated45")
         else
            always_run
         end
         assert(assert_counter.item = 34)
         -- Extra test for inspect statements on CHARACTERs:
         inspect
            'b'
         when 'a' then
            c_inline_c("NoCcodeGenerated46")
         else
            always_run
         end
         inspect
            'b'
         when 'a' then
            c_inline_c("NoCcodeGenerated47")
         when 'b' then
            always_run
         else
            c_inline_c("NoCcodeGenerated48")
         end
         inspect
            'b'
         when 'a' then
            c_inline_c("NoCcodeGenerated49")
         when 'b' then
            always_run
         when 'c' then
            c_inline_c("NoCcodeGenerated50")
         end
         inspect
            'e'
         when 'a' .. 'b' then
            c_inline_c("NoCcodeGenerated51")
         else
            always_run
         end
         inspect
            'e'
         when 'a' .. 'b' then
            c_inline_c("NoCcodeGenerated52")
         when 'c' .. 'e' then
            always_run
         else
            c_inline_c("NoCcodeGenerated53")
         end
         inspect
            'e'
         when 'a' .. 'd' then
            c_inline_c("NoCcodeGenerated54")
         when 'e' .. 'f' then
            always_run
         when 'g' then
            c_inline_c("NoCcodeGenerated55")
         end
         assert(assert_counter.item = 41)
         -- Extra test for inspect statements on INTEGERs:
         inspect
            2
         when 1 then
            c_inline_c("NoCcodeGenerated56")
         else
            always_run
         end
         inspect
            2
         when 1 then
            c_inline_c("NoCcodeGenerated57")
         when 2 then
            always_run
         else
            c_inline_c("NoCcodeGenerated58")
         end
         inspect
            2
         when 1 then
            c_inline_c("NoCcodeGenerated59")
         when 2 then
            always_run
         when 3 then
            c_inline_c("NoCcodeGenerated60")
         end
         inspect
            5
         when 1 .. 2 then
            c_inline_c("NoCcodeGenerated61")
         else
            always_run
         end
         inspect
            5
         when 1 .. 2 then
            c_inline_c("NoCcodeGenerated62")
         when 3 .. 5 then
            always_run
         else
            c_inline_c("NoCcodeGenerated63")
         end
         inspect
            5
         when 1 .. 4 then
            c_inline_c("NoCcodeGenerated64")
         when 5 .. 6 then
            always_run
         when 7 then
            c_inline_c("NoCcodeGenerated65")
         end
         assert(assert_counter.item = 48)
         assert(assert_counter.item = 49)
         if {RING_ARRAY[STRING] 1, << "foo" >> } /= Void then
            always_run
         else
            c_inline_c("NoCcodeGenerated66")
         end
         if 2 + {INTEGER_32 2 } = 4 then
            always_run
         else
            c_inline_c("NoCcodeGenerated67")
         end

      end

   is_void: ANY
      do
      end

   two: INTEGER
      do
         Result := 1 + 1
      end

   always_run
      do
         assert(True)
      end

   always_true: BOOLEAN
      do
         Result := True
      end

   always_false: BOOLEAN
      do
      end

end -- class TEST_SIMPLIFY02
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
