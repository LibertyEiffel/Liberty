-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class TAGGED

feature {TAGGER}
   tag (a_tag: FIXED_STRING): TAGGED_DATA
      require
         sensible_tag: a_tag.intern = a_tag
      do
         if tagged_data_map /= Void then
            Result := tagged_data_map.fast_reference_at(a_tag)
         end
      end

   set_tag (a_tag: FIXED_STRING; a_data: TAGGED_DATA)
      require
         sensible_tag: a_tag.intern = a_tag
         sensible_data: a_data /= Void
         no_previous_data: tag(a_tag) = Void
      do
         if tagged_data_map = Void then
            create tagged_data_map.make
         end
         tagged_data_map.add(a_data, a_tag)
      ensure
         tag(a_tag) = a_data
      end

feature {}
   tagged_data_map: HASHED_DICTIONARY[TAGGED_DATA, FIXED_STRING]

end -- class TAGGED
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright (C) 2011-2018: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
