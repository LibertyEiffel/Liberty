-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class FAKE_ARGUMENT
   --
   -- This pseudo expression is used to simulate some argument. (Used for example for -cecil calls.)
   --

inherit
   EXPRESSION

create {ANY}
   make

feature {ANY}
   is_current: BOOLEAN False

   is_implicit_current: BOOLEAN False

   is_writable: BOOLEAN False

   is_static: BOOLEAN False

   is_manifest_string: BOOLEAN False

   is_result: BOOLEAN False

   is_void: BOOLEAN False

   use_current (type: TYPE): BOOLEAN
      do
      end

   side_effect_free (type: TYPE): BOOLEAN
      do
         Result := True
      end

   declaration_type: TYPE

   written_declaration_type_mark: TYPE_MARK
      do
         Result := result_type
      end

   precedence: INTEGER
      do
         Result := atomic_precedence
      end

   result_type: TYPE_MARK

   start_position: POSITION

   specialize_in (type: TYPE): like Current
      do
         if declaration_type = Void then
            declaration_type := result_type.resolve_in(type)
         end
         Result := Current
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      do
         Result := Current
      end

   has_been_specialized: BOOLEAN True

   specialize_and_check (type: TYPE): like Current
      do
         Result := Current
      end

   resolve_in (type: TYPE): TYPE
      do
         Result := result_type.resolve_in(type)
      end

   collect (type: TYPE): TYPE
      do
         Result := result_type.resolve_in(type)
      end

   adapt_for (type: TYPE): like Current
      do
         Result := Current
      end

   safety_check (type: TYPE)
      do
      end

   non_void_no_dispatch_type (type: TYPE): TYPE
      do
      end

   simplify (type: TYPE): FAKE_ARGUMENT
      do
         Result := Current
      end

   pretty, pretty_target, bracketed_pretty (indent_level: INTEGER)
      do
         check
            False
         end
      end

   extra_bracket_flag: BOOLEAN False

   short (type: TYPE)
      do
         check
            False
         end
      end

   short_target (type: TYPE)
      do
         check
            False
         end
      end

   accept (visitor: FAKE_ARGUMENT_VISITOR)
      do
         visitor.visit_fake_argument(Current)
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      do
         code_accumulator.current_context.add_last(Current)
      end

feature {FAKE_ARGUMENT_VISITOR}
   rank: INTEGER

feature {}
   make (target_type: TYPE; sp: like start_position; rt: like result_type; r: like rank)
      require
         not sp.is_unknown
         rt /= Void
         target_type /= Void
         r > 0
      do
         start_position := sp
         result_type := rt.to_static(target_type, False)
         rank := r
      ensure
         result_type.is_static
         rank = r
      end

invariant
   not start_position.is_unknown

   rank > 0

   result_type.is_static

end -- class FAKE_ARGUMENT
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
