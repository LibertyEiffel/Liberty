-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class ANCHORED_TYPE_MARK
   --
   -- Root of anchored declaration type marks: TYPE_LIKE_CURRENT,
   -- LIKE_FEATURE_TYPE_MARK and LIKE_ARGUMENT_TYPE_MARK.
   --

inherit
   NON_STATIC_TYPE_MARK

feature {ANY}
   start_position: POSITION
         -- Of first letter of `like'.

feature {TYPE_MARK}
   set_start_position (sp: like start_position)
      do
         start_position := sp
      end

feature {}
   written_mark_buffer: STRING
      once
         create Result.make(128)
      end

   anchor_cycle_start
      local
         i: INTEGER
      do
         if visited.upper < 0 then
            visited.add_last(start_position)
         elseif visited.fast_has(start_position) and then visited.occurrences(start_position) > 2
            -- Note: this second strange condition appears to be useful to detect
            -- wrong type marks or to give a second chance to some complex
            -- anchored definitions.
            then
            error_handler.add_position(visited.first)
            error_handler.append(once "Unable to compute this anchored type mark (see next message).")
            error_handler.print_as_warning
            from
               i := visited.lower
            until
               i > visited.upper
            loop
               error_handler.add_position(visited.item(i))
               i := i + 1
            end
            error_handler.append(fz_cad)
            error_handler.print_as_fatal_error
         else
            visited.add_last(start_position)
         end
      ensure
         not visited.is_empty
      end

   anchor_cycle_end
      do
         if start_position = visited.first then
            visited.clear_count
         end
      end

   visited: FAST_ARRAY[POSITION]
         -- Cycle detection.
      once
         create Result.with_capacity(4)
      end

invariant
   not is_static

end -- class ANCHORED_TYPE_MARK
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
