-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_ONCE9
   -- A bug with dynamic dispatch and the inlining of precomputed once function.
   -- From Guillaume Lemaitre (sz 367)

insert
   ARGUMENTS

create {}
   make

feature {ANY}
   make
      local
         file: TEXT_FILE_READ
      do
         if argument_count = 1 then
            create file.connect_to(argument(1))
            if file.is_connected then
               load(file)
            end
         end
      end

   load (p_file: INPUT_STREAM)
      require
         p_file.is_connected
      do
         p_file.read_word
         if p_file.last_string.is_integer then
            std_output.put_integer(p_file.last_string.to_integer)
         else
            std_output.put_string("Can't read an integer!%N")
         end
      end

end -- class TEST_ONCE9
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
