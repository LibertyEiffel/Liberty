-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class LIKE_CURRENT_TYPE_MARK

inherit
   ANCHORED_TYPE_MARK
      redefine resolve_in
      end

create {EIFFEL_PARSER, CREATE_INSTRUCTION, ABSTRACT_CURRENT}
   make

feature {ANY}
   has_been_specialized: BOOLEAN True

   declaration_type: TYPE_MARK
      local
         ct: CLASS_TEXT
      do
         ct := start_position.class_text
         Result := ct.declaration_type_of_like_current.canonical_type_mark
      end

   specialize_in (new_type: TYPE)
      do
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      do
         Result := Current
      end

   to_static (new_type: TYPE; allow_raw_class_name: BOOLEAN): TYPE_MARK
      do
         Result := new_type.canonical_type_mark
      end

   resolve_in, signature_resolve_in (new_type: TYPE): TYPE
      do
         Result := new_type
      end

   written_name: HASHED_STRING
         -- (Is always the same one.)
      once
         Result := string_aliaser.hashed_string(as_like_current)
      end

   accept (visitor: LIKE_CURRENT_TYPE_MARK_VISITOR)
      do
         visitor.visit_like_current_type_mark(Current)
      end

feature {TYPE_MARK}
   short_ (shorted_type: TYPE)
      do
         short_printer.hook_or(once "like", once "like ")
         short_printer.hook_or(as_current, as_current)
      end

feature {}
   make (sp: like start_position)
      require
         not sp.is_unknown
      do
         start_position := sp
      ensure
         start_position = sp
      end

end -- class LIKE_CURRENT_TYPE_MARK
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
