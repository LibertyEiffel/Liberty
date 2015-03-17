-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_BIJECTIVE_DICTIONARY1

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   test_with (bd: BIJECTIVE_DICTIONARY[STRING, STRING])
      local
         bd_twin: like bd
      do
         bd_twin := bd.twin
         assert(bd.at("k1").is_equal("v1"))
         assert(bd.at("k2").is_equal("v2"))
         assert(bd.at("k3").is_equal("v3"))
         assert(bd.at("k4").is_equal("v4"))
         assert(bd.at("k5").is_equal("v5"))
         assert(bd.internal_key("k1").is_equal("k1"))
         assert(bd.internal_key("k2").is_equal("k2"))
         assert(bd.internal_key("k3").is_equal("k3"))
         assert(bd.internal_key("k4").is_equal("k4"))
         assert(bd.internal_key("k5").is_equal("k5"))
         bd.put("v1", "k1")
         assert(bd.count = 5)
         bd.remove("k6")
         assert(bd.count = 5)
         bd.remove("k3")
         assert(bd.count = 4)
         assert(not bd.has("k3"))
         assert(not bd.has_value("v3"))
         bd.clear_count
         assert(bd.count = 0)
         assert(bd_twin.at("k1").is_equal("v1"))
         assert(bd_twin.at("k2").is_equal("v2"))
         assert(bd_twin.at("k3").is_equal("v3"))
         assert(bd_twin.at("k4").is_equal("v4"))
         assert(bd_twin.at("k5").is_equal("v5"))
      end

   make
      do
         test_with({HASHED_BIJECTIVE_DICTIONARY[STRING, STRING] << "v1", "k1";
                                                                   "v2", "k2";
                                                                   "v3", "k3";
                                                                   "v4", "k4";
                                                                   "v5", "k5" >> })
      end

end -- class TEST_BIJECTIVE_DICTIONARY1
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
