-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class AUX_PH01_SPLAY_DICTIONARY_ITERATOR[I -> COMPARABLE]
   --
   -- The iterator for AUX_PH01_SPLAY_DICTIONARY over the keys.
   --
   -- Copyright (C) Philip Malin 2000.
   --

create {ANY}
   make

feature {ANY}
   make (sd: AUX_PH01_SPLAY_DICTIONARY[INTEGER, I])
      do
         cont := sd
         start
      ensure
         cont = sd
      end

feature {ANY}
   start
         -- Positions the iterator to the first object in the
         -- aggregate to be traversed.
      do
      end

   is_off: BOOLEAN
         -- Returns true when there are no more objects in the
         -- sequence.
      do
         Result := node = Void
      end

   index: I
         -- Returns the index of the object at the current position in the
         -- sequence.
      require
         not is_off
      do
         Result := node.index
      end

   next
         -- Positions the iterator to the next object in the
         -- sequence.
      require
         not is_off
      do
         node := cont.next_highest(node)
      end

feature {}
   cont: AUX_PH01_SPLAY_DICTIONARY[INTEGER, I]

   node: AUX_PH01_SPLAY_DICTIONARY_ITEM[INTEGER, I]

end -- class AUX_PH01_SPLAY_DICTIONARY_ITERATOR
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
