-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class GENERATOR_GENERATING_TYPE
   --
   -- To represent `generator' and `generating_type' calls.
   --

inherit
   EXPRESSION

create {INTROSPECTION_HANDLER}
   make_generating_type, make_generator

feature {ANY}
   start_position: POSITION

   target_type: TYPE

   array_name: CHARACTER

   is_writable: BOOLEAN False

   is_static: BOOLEAN True

   is_current: BOOLEAN False

   is_implicit_current: BOOLEAN False

   is_void: BOOLEAN False

   is_result: BOOLEAN False

   is_manifest_string: BOOLEAN False

   precedence: INTEGER
      do
         Result := atomic_precedence
      end

   specialize_in (type: TYPE): like Current
      do
         Result := Current
      end

   has_been_specialized: BOOLEAN
      do
         Result := True
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      do
         Result := Current
      end

   specialize_and_check (type: TYPE): like Current
      do
         Result := Current
      end

   resolve_in (type: TYPE): TYPE
      do
         Result := smart_eiffel.type_string
      end

   side_effect_free (type: TYPE): BOOLEAN
      do
         Result := True
      end

   non_void_no_dispatch_type (type: TYPE): TYPE
      do
         Result := smart_eiffel.type_string
      end

   use_current (type: TYPE): BOOLEAN
      do
         Result := False
      end

   safety_check (type: TYPE)
      do
      end

   collect (type: TYPE): TYPE
      local
         live_type: LIVE_TYPE
      do
         live_type := target_type.live_type
         if live_type /= Void then
            smart_eiffel.set_generator_used
            if array_name = 't' then
               smart_eiffel.set_generating_type_used
               live_type.set_generating_type_used
            else
               live_type.set_generator_used
            end
         end
         Result := smart_eiffel.type_string
      end

   simplify (type: TYPE): EXPRESSION
      do
         Result := Current
      end

   adapt_for (type: TYPE): like Current
      do
         Result := Current
      end

   declaration_type: TYPE
      once
         Result := smart_eiffel.type_string
      end

   written_declaration_type_mark: TYPE_MARK
      once
         Result := declaration_type.canonical_type_mark
      end

   accept (visitor: GENERATOR_GENERATING_TYPE_VISITOR)
      do
         visitor.visit_generator_generating_type(Current)
      end

   extra_bracket_flag: BOOLEAN False

   pretty (indent_level: INTEGER)
      do
         check
            False
         end
      end

   pretty_target (indent_level: INTEGER)
      do
         check
            False
         end
      end

   bracketed_pretty (indent_level: INTEGER)
      do
         check
            False
         end
      end

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

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      do
         code_accumulator.current_context.add_last(Current)
      end

feature {}
   make_generating_type (sp: like start_position; tt: like target_type)
      require
         not sp.is_unknown
         tt /= Void
      do
         start_position := sp
         target_type := tt
         array_name := 't'
      ensure
         start_position = sp
         target_type = tt
      end

   make_generator (sp: like start_position; tt: like target_type)
      require
         not sp.is_unknown
         tt /= Void
      do
         start_position := sp
         target_type := tt
         array_name := 'g'
      ensure
         start_position = sp
         target_type = tt
      end

end -- class GENERATOR_GENERATING_TYPE
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
