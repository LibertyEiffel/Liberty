-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class KERNEL_EXPANDED_TYPE_MARK
   --
   -- Root of BOOLEAN_TYPE_MARK, CHARACTER_TYPE_MARK, INTEGER_TYPE_MARK, TYPE_REAL,
   -- TYPE_DOUBLE and POINTER_TYPE_MARK.
   --

inherit
   STATIC_TYPE_MARK

insert
   NON_GENERIC_TYPE_MARK

feature {ANY}
   is_expanded: BOOLEAN True

   is_reference, is_user_expanded: BOOLEAN False

   class_text_name: CLASS_NAME

   frozen start_position: POSITION
      do
         Result := class_text_name.start_position
      end

   frozen run_type: TYPE_MARK
      do
         Result := Current
      end

feature {LIVE_TYPE, TYPE_MARK}
   is_empty_expanded: BOOLEAN False

feature {LIVE_TYPE}
   structure_mark: CHARACTER
         -- 's' short
         -- 'i' int
         -- 'I' long
         -- 'f' float
         -- 'd' double
         -- 'D' long double
         -- 'c' char
         -- 'p' pointer
      deferred
      ensure "siIfdDcp".has(Result)
      end

feature {LIVE_TYPE, TYPE_MARK}
   frozen just_before_gc_mark_in (str: STRING)
      do
      end

feature {TYPE_MARK}
   frozen short_ (shorted_type: TYPE)
      do
         short_printer.put_class_name(class_text_name)
      end

   set_start_position (sp: like start_position)
      do
         if start_position /= sp then
            class_text_name := class_text_name.twin
            class_text_name.set_accurate_position(sp)
         end
      end

end -- class KERNEL_EXPANDED_TYPE_MARK
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
