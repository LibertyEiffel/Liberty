-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_INPUT_STREAM1

insert
   SYSTEM
   EIFFELTEST_TOOLS

create {}
   main

feature {ANY}
   main
      local
         tfr: TEXT_FILE_READ; value: INTEGER; path: STRING
         last_character:CHARACTER
      do
         path := "test_input_stream1.e"
         create tfr.connect_to(path)
         assert(tfr.is_connected)
         tfr.reach_and_skip("YOO" -- ICI
                            )
         assert(tfr.last_character = 'O')
         assert(tfr.last_string.is_equal("YOO"))
         tfr.read_line
         assert(tfr.last_string.is_equal("%" -- ICI"))
         tfr.skip_separators
         last_character := tfr.last_character
         assert(tfr.last_character = ' ')
         tfr.read_word
         assert(tfr.last_string.is_equal(")"))
         tfr.skip_separators
         last_character := tfr.last_character
         assert(tfr.last_character = ' ')
         tfr.skip_separators
         assert(tfr.last_character = ' ')
         -- TEST01:12
         tfr.reach_and_skip("TEST01:")
         assert(tfr.last_character = ':')
         tfr.read_integer
         value := tfr.last_integer
         assert(value = 12)
         -- TEST02:3.5
         tfr.reach_and_skip("TEST02:")
         assert(tfr.last_character = ':')
         tfr.read_real
         assert(tfr.last_real = 3.5)
         tfr.reach_and_skip(path)
         assert(tfr.end_of_input)
         tfr.disconnect
      end

end -- class TEST_INPUT_STREAM1
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
