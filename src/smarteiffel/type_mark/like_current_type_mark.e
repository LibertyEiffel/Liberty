-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class LIKE_CURRENT_TYPE_MARK

inherit
   ANCHORED_TYPE_MARK
      redefine resolve_in
      end
   
creation {EIFFEL_PARSER, CREATE_INSTRUCTION}
   make

feature {ANY}
   has_been_specialized: BOOLEAN is True

   declaration_type: TYPE_MARK is
      local
         ct: CLASS_TEXT
      do
         ct := start_position.class_text
         Result := ct.declaration_type_of_like_current.canonical_type_mark
      end

   specialize_in (new_type: TYPE) is
      do
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      do
         Result := Current
      end

   to_static (new_type: TYPE): TYPE_MARK is
      do
         Result := new_type.canonical_type_mark
      end

   resolve_in, signature_resolve_in (new_type: TYPE): TYPE is
      do
         Result := new_type
      end

   written_name: HASHED_STRING is
         -- (Is always the same one.)
      once
         Result := string_aliaser.hashed_string(as_like_current)
      end

   accept (visitor: LIKE_CURRENT_TYPE_MARK_VISITOR) is
      do
         visitor.visit_like_current_type_mark(Current)
      end

feature {TYPE_MARK}
   short_ (shorted_type: TYPE) is
      do
         short_printer.hook_or(once "like", once "like ")
         short_printer.hook_or(as_current, as_current)
      end

feature {}
   make (sp: like start_position) is
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
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
