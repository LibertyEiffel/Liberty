-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_TEMPLATE_INPUT_STREAM

inherit
   TEMPLATE_RESOLVER

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         in: TEMPLATE_INPUT_STREAM
         ins: STRING_INPUT_STREAM
         outs: STRING_OUTPUT_STREAM
         o: STRING
      do
         o := ""
         create outs.connect_to(o)
         create ins.from_string("#(*more) #(foo) #(bar) ## #(more*)")
         create in.connect_to(ins, Current)

         from
            in.read_character
         until
            in.end_of_input
         loop
            outs.put_character(in.last_character)
            in.read_character
         end

         assert(o.is_equal(" FOO BAR #  FOO BAR #  FOO BAR # "))

         outs.disconnect
         ins.disconnect
      end

feature {TEMPLATE_INPUT_STREAM}
   item (s: STRING): STRING
      do
         inspect
            s
         when "foo" then
            Result := "FOO"
         when "bar" then
            Result := "BAR"
         else
            assert(False)
         end
      end

   while (s: STRING): BOOLEAN
      do
         inspect
            s
         when "more" then
            more_count := more_count + 1
            Result := more_count <= 3
         else
            assert(False)
         end
      end

feature {}
   more_count: INTEGER

end -- class TEST_TEMPLATE_INPUT_STREAM
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
