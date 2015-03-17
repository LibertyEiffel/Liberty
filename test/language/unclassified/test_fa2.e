-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_FA2
   -- From a bug report of Franck ARNAUD

create {}
   make

feature {ANY}
   make
      local
         strings: AUX_FA2DICO[STRING, INTEGER]; streams: AUX_FA2DICO[INPUT_STREAM, INTEGER]
         bidon1: AUX_FA2MY_SET[AUX_FA2DICO_NODE[STRING, INTEGER]]; bidon2: AUX_FA2DICO[STRING, INTEGER]
         bidon3: AUX_FA2DICO[INPUT_STREAM, INTEGER]
         bidon4: AUX_FA2MY_LINKED_LIST[AUX_FA2DICO_NODE[INPUT_STREAM, INTEGER]]
         bidon5: AUX_FA2MY_LINKED_LIST[AUX_FA2DICO_NODE[STRING, INTEGER]]
         bidon6: AUX_FA2MY_SET[AUX_FA2DICO_NODE[INPUT_STREAM, INTEGER]]; bobool: BOOLEAN
      do
         if bobool then
            strings.remove
            streams.remove
         end
         create bidon1
         create bidon2
         create bidon3
         create bidon4
         create bidon5
         create bidon6
      end

end -- class TEST_FA2
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
