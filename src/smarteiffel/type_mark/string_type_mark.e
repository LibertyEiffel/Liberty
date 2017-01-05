-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class STRING_TYPE_MARK
   --
   -- Handling of the "STRING" type mark.
   --

inherit
   STATIC_TYPE_MARK
      redefine
         resolve_in
      end

insert
   NON_GENERIC_TYPE_MARK
      redefine
         resolve_in
      end

create {ANY}
   make

feature {ANY}
   id: INTEGER 7

   is_reference: BOOLEAN True

   is_expanded, is_user_expanded: BOOLEAN False

   written_name: HASHED_STRING
         -- (Is always the same one.)
      once
         Result := string_aliaser.hashed_string(as_string)
      end

   class_text_name: CLASS_NAME

   type: TYPE
         --|*** TYPE creation can be quite recursive, so this cannot be a once function <FM-14/10/2004>
      do
         Result := smart_eiffel.type_string
      end

   resolve_in (new_type: TYPE): TYPE
      do
         Result := type
      end

   run_type: TYPE_MARK
      do
         Result := Current
      end

   accept (visitor: STRING_TYPE_MARK_VISITOR)
      do
         visitor.visit_string_type_mark(Current)
      end

   start_position: POSITION
      do
         Result := class_text_name.start_position
      end

feature {LIVE_TYPE, TYPE_MARK}
   is_empty_expanded: BOOLEAN False

feature {TYPE, TYPE_MARK, SMART_EIFFEL}
   long_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_string)
      end

feature {TYPE_MARK}
   short_ (shorted_type: TYPE)
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

feature {}
   make (sp: like start_position)
      do
         create class_text_name.make(written_name, sp, False)
      end

invariant
   written_mark = as_string

end -- class STRING_TYPE_MARK
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
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
