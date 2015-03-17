-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class BAD_CALL7
--
-- To check warning about extra blank space between some manifest and the dot.
--

create {}
   make

feature {}
   make
      local
         string: STRING
      do
         string := "foo" .to_string                      -- <-- Warning #01 on this line.
         "foo" .print_on(io)                             -- <-- Warning #02 on this line.

         string := once "foo".to_string                  -- <-- Warning #03 on this line.
         once "foo".print_on(io)                         -- <-- Warning #04 on this line.

         string := (once "foo").to_string
         (once "foo").print_on(io)

         string := True .to_string                       -- <-- Warning #05 on this line.

         string := False .to_string                      -- <-- Warning #06 on this line.

         string := 7 .to_string                          -- <-- Warning #07 on this line.
         8 .print_on(io)                                 -- <-- Warning #08 on this line.

         string := {INTEGER_8 124} .to_string            -- <-- Warning #09 on this line.
         {INTEGER_64 8} .print_on(io)                    -- <-- Warning #10 on this line.

         string := 0xFF .to_string                       -- <-- Warning #11 on this line.
         0x00 .print_on(io)                              -- <-- Warning #12 on this line.

         string := 1.5 .to_string                        -- <-- Warning #13 on this line.
         1.5 .print_on(io)                               -- <-- Warning #14 on this line.

         string := {REAL_32 1.5 } .to_string             -- <-- Warning #15 on this line.
         {REAL_32 1.5 } .print_on(io)                    -- <-- Warning #16 on this line.

         string := 'a' .to_string                        -- <-- Warning #17 on this line.
         'a' .print_on(io)                               -- <-- Warning #18 on this line.

         string := {ARRAY[STRING] 1, <<"foo">> } .first  -- <-- Warning #19 on this line.
         {ARRAY[STRING] 1, <<"foo">> } .print_on(io)     -- <-- Warning #20 on this line.

         string := "foo". print_on(io)                   -- <-- Fatal error here.
      end

end -- class BAD_CALL7
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
