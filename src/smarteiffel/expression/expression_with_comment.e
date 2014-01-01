-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EXPRESSION_WITH_COMMENT
   --
   -- To wrap an expression with a following comment.
   --

inherit
   EXPRESSION

create {EIFFEL_PARSER}
   make

feature {ANY}
   expression: EXPRESSION

   comment: COMMENT
         -- the associated one.

   specialize_in (type: TYPE): like Current is
      local
         e: like expression
      do
         e := expression.specialize_in(type)
         Result := current_or_twin_init(e)
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      local
         e: like expression
      do
         e := expression.specialize_thru(parent_type, parent_edge, new_type)
         Result := current_or_twin_init(e)
      end

   has_been_specialized: BOOLEAN is
      do
         Result := expression.has_been_specialized
      end

   specialize_and_check (type: TYPE): like Current is
      local
         e: like expression
      do
         e := expression.specialize_and_check(type)
         Result := current_or_twin_init(e)
      end

   resolve_in (type: TYPE): TYPE is
      do
         Result := expression.resolve_in(type)
      end

   collect (type: TYPE): TYPE is
      do
         Result := expression.collect(type)
      end

   adapt_for (type: TYPE): like Current is
      local
         e: like expression
      do
         e := expression.adapt_for(type)
         Result := current_or_twin_init(e)
      end

   declaration_type: TYPE is
      do
         Result := expression.declaration_type
      end

   is_writable: BOOLEAN is
      do
         Result := expression.is_writable
      end

   is_manifest_string: BOOLEAN is
      do
         Result := expression.is_manifest_string
      end

   is_void: BOOLEAN is
      do
         Result := expression.is_void
      end

   is_result: BOOLEAN is
      do
         Result := expression.is_result
      end

   is_current: BOOLEAN is
      do
         Result := expression.is_current
      end

   is_implicit_current: BOOLEAN is
      do
         Result := expression.is_implicit_current
      end

   is_static: BOOLEAN is
      do
         Result := expression.is_static
      end

   safety_check (type: TYPE) is
      do
         expression.safety_check(type)
      end

   use_current (type: TYPE): BOOLEAN is
      do
         Result := expression.use_current(type)
      end

   side_effect_free (type: TYPE): BOOLEAN is
      do
         Result := expression.side_effect_free(type)
      end

   non_void_no_dispatch_type (type: TYPE): TYPE is
      do
         Result := expression.non_void_no_dispatch_type(type)
      end

   simplify (type: TYPE): EXPRESSION is
      do
         smart_eiffel.magic_count_increment
         Result := expression.simplify(type)
      end

   start_position: POSITION is
      do
         Result := expression.start_position
      end

   extra_bracket_flag: BOOLEAN is
      do
         Result := expression.extra_bracket_flag
      end

   pretty (indent_level: INTEGER) is
      do
         expression.pretty(indent_level)
         comment.pretty(indent_level)
      end

   bracketed_pretty (indent_level: INTEGER) is
      do
         expression.bracketed_pretty(indent_level)
         comment.pretty(indent_level)
      end

   pretty_target (indent_level: INTEGER) is
      do
         expression.pretty_target(indent_level)
         comment.pretty(indent_level)
      end

   short (type: TYPE) is
      do
         expression.short(type)
      end

   short_target (type: TYPE) is
      do
         expression.short_target(type)
      end

   precedence: INTEGER is
      do
         Result := expression.precedence
      end

   accept (visitor: EXPRESSION_WITH_COMMENT_VISITOR) is
      do
         visitor.visit_expression_with_comment(Current)
      end

feature {EXPRESSION_WITH_COMMENT}
   init (e: like expression) is
      require
         e /= Void
      do
         expression := e
      ensure
         expression = e
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      do
         expression.inline_dynamic_dispatch_(code_accumulator, type)
      end

feature {}
   make (e: like expression; c: like comment) is
      require
         e /= Void
         really_a_comment: c.count > 0
      do
         expression := e
         comment := c
      ensure
         expression = e
         comment = c
      end

   current_or_twin_init (e: like expression): like Current is
      require
         e /= Void
      do
         if e = expression then
            Result := Current
         else
            Result := twin
            Result.init(e)
         end
      ensure
         Result.expression = e
      end

invariant
   comment /= Void

   expression /= Void

end -- class EXPRESSION_WITH_COMMENT
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
-- Copyright(C) 2011-2014: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
