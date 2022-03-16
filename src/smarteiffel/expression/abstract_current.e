-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class ABSTRACT_CURRENT
   --
   -- Handling of the pseudo variable "Current".
   --

inherit
   EXPRESSION

feature {ANY}
   start_position: POSITION

   is_current: BOOLEAN True

   is_writable: BOOLEAN False

   is_manifest_string: BOOLEAN False

   is_static: BOOLEAN False

   is_result: BOOLEAN False

   is_void: BOOLEAN False

   extra_bracket_flag: BOOLEAN False

   declaration_type: TYPE

   written_declaration_type_mark: TYPE_MARK

   to_string, to_key: STRING
      do
         Result := as_current
      end

   frozen use_current (type: TYPE): BOOLEAN
      do
         Result := True
      end

   frozen safety_check (type: TYPE)
      do
      end

   specialize_in (type: TYPE): like Current
      do
         if declaration_type = Void then
            declaration_type := start_position.class_text.declaration_type_of_like_current
            create {LIKE_CURRENT_TYPE_MARK} written_declaration_type_mark.make(start_position)
         end
         check
            (not declaration_type_forced) implies declaration_type = start_position.class_text.declaration_type_of_like_current
         end
         Result := Current
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      do
         Result := Current
      end

   specialize_and_check (type: TYPE): like Current
      do
         Result := Current
      end

   has_been_specialized: BOOLEAN
      do
         Result := declaration_type /= Void
      end

   frozen side_effect_free (type: TYPE): BOOLEAN
      do
         Result := True
      end

   frozen adapt_for (type: TYPE): like Current
      do
         Result := Current
      end

   frozen non_void_no_dispatch_type (type: TYPE): TYPE
      do
         if type.live_type /= Void then
            Result := type
         end
      end

   frozen simplify (type: TYPE): ABSTRACT_CURRENT
      do
         Result := Current
      end

   frozen precedence: INTEGER
      do
         Result := atomic_precedence
      end

   frozen bracketed_pretty, frozen pretty (indent_level: INTEGER)
      do
         pretty_printer.put_string(once "Current")
      end

   frozen pretty_target (indent_level: INTEGER)
      do
         if is_written then
            pretty_printer.put_string(once "Current.")
         end
      end

   frozen short (type: TYPE)
      do
         short_printer.hook_or(as_current, as_current)
      end

   frozen short_target (type: TYPE)
      do
         if is_written then
            short(type)
            short_printer.put_dot
         end
      end

   frozen resolve_in (type: TYPE): TYPE
      do
         Result := type
      end

   frozen collect (type: TYPE): TYPE
      do
         Result := type
      end

feature {}
   is_written: BOOLEAN
         -- True when it is a really written Current.
      deferred
      end

   make (sp: like start_position)
      require
         not sp.is_unknown
      do
         start_position := sp
      ensure
         start_position = sp
      end

   declaration_type_forced: BOOLEAN

   set_type_forced: BOOLEAN
      do
         Result := declaration_type = Void
         declaration_type_forced := True
      end

feature {INTROSPECTION_HANDLER}
   force_declaration_type (dt: like declaration_type)
      do
         check
            set_type_forced
         end
         declaration_type := dt
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      do
         code_accumulator.current_context.add_last(Current)
      end

invariant
   not start_position.is_unknown

end -- class ABSTRACT_CURRENT
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
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
