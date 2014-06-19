-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_POPOF2

create {}
   make

feature {ANY}
   make
      local
         hand: HAND2; wins, losses: INTEGER; card1, card2, card3, card4, card5: INTEGER
      do
         from
            card1 := 1
         until
            card1 > 48
         loop
            from
               card2 := card1 + 1
            until
               card2 > 49
            loop
               from
                  card3 := card2 + 1
               until
                  card3 > 50
               loop
                  from
                     card4 := card3 + 1
                  until
                     card4 > 51
                  loop
                     from
                        card5 := card4 + 1
                     until
                        card5 > 52
                     loop
                        hand.deal(card1, card2, card3, card4, card5)
                        if hand.wins then
                           wins := wins + 1
                        else
                           losses := losses + 1
                        end
                        -- if
                        card5 := card5 + 1
                     end
                     -- loop
                     card4 := card4 + 1
                  end
                  -- loop
                  card3 := card3 + 1
               end
               -- loop
               card2 := card2 + 1
            end
            -- loop
            card1 := card1 + 1
         end
         -- loop
         if 23940 /= wins then
            std_error.put_string("Error #1 in TEST_POPOF2%N")
         end
         if 2598960 /= wins + losses then
            std_error.put_string("Error #2 in TEST_POPOF2%N")
         end
      end

end -- class TEST_POPOF2
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
