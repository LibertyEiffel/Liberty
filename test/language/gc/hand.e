-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
expanded class HAND

create {ANY}
   make

feature {}
   make
      do
         create rank.make(1, 5)
         create suit.make(1, 5)
      end

feature {ANY} -- Queries
   is_3_aces: BOOLEAN
      local
         i: INTEGER; k: INTEGER
      do
         -- index
         -- count of aces
         from
         until
            i = 5
         loop
            i := i + 1
            if rank @ i = 1 then
               k := k + 1
            end
            -- if
         end
         -- loop
         Result := k = 3
      end

   is_straight: BOOLEAN
         -- true if no pairs and all cards are
         -- within 5 ranks of each other
      local
         i, j: INTEGER; a, b: INTEGER; flag: BOOLEAN
      do
         -- to break cycle
         from
         until
            i = 4 or else flag
         loop
            i := i + 1
            from
               j := i
            until
               j = 5 or else flag
            loop
               j := j + 1
               a := rank @ i
               b := rank @ j
               -- correct for ace high
               if a = 1 and b >= 10 then
                  a := 14
               elseif b = 1 and a >= 10 then
                  b := 14
               end
               -- if
               -- reject pairs
               if a = b then
                  flag := True
               elseif a - 4 > b then
                  -- reject if not within 5 ranks
                  flag := True
               elseif b - 4 > a then
                  flag := True
               end
               -- if
            end
            -- loop
         end
         -- loop
         Result := not flag
      end

   is_flush: BOOLEAN
      local
         i: INTEGER; flag: BOOLEAN
      do
         -- to break cycle
         from
            i := 1
         until
            i = 5 or else flag
         loop
            i := i + 1
            if suit @ i /= suit @ 1 then
               flag := True
            end
            -- if
         end
         -- loop
         Result := not flag
      end

   is_full_house_or_4: BOOLEAN
         -- true if no more than two ranks
      local
         i: INTEGER; a, b, c: INTEGER; flag: BOOLEAN
      do
         -- to break cycle
         a := rank @ 1
         -- b := 0 -- (b rank not yet found)
         from
            i := 1
         until
            i = 5 or else flag
         loop
            i := i + 1
            c := rank @ i
            if c /= a and c /= b then
               -- found new rank, c
               if b /= 0 then
                  flag := True
                  -- break
                  -- already have 2 ranks
               else
                  b := c -- b, 2nd rank, is the new one, c
               end
               -- if
            end
            -- if
         end
         -- loop
         Result := not flag
      end

   is_straight_flush: BOOLEAN
      do
         Result := is_straight or else is_flush
      end

   wins: BOOLEAN
         -- wins means beats 3 kings
      do
         Result := is_3_aces or else is_straight or else is_flush or else is_full_house_or_4 or else is_straight_flush
      end

feature {ANY} -- Operations
   deal (card1, card2, card3, card4, card5: INTEGER)
      local
         i: INTEGER; card: ARRAY[INTEGER]
      do
         card := {ARRAY[INTEGER] 1, << card1, card2, card3, card4, card5 >> }
         from
         until
            i = 5
         loop
            i := i + 1
            rank.put((card @ i - 1) \\ 13 + 1, i)
            suit.put((card @ i - 1) // 13 + 1, i)
         end
         -- loop
      end

feature {} -- Implementation
   rank: ARRAY[INTEGER] -- 1=ace, 13=king

   suit: ARRAY[INTEGER] -- 1=club, 2=diamond, 3=heart, 4=spade

end -- class HAND
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
