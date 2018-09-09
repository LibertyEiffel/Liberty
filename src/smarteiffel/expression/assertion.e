-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ASSERTION
   --
   -- Stores one assertion whatever its positioning: require, ensure, class invariant, loop
   -- invariant, require else, etc.
   --

inherit
   EXPRESSION

create {ANY}
   make

feature {ANY}
   tag: TAG_NAME

   expression: EXPRESSION

   comment: COMMENT

   start_position: POSITION
      do
         if tag /= Void then
            Result := tag.start_position
         elseif expression /= Void then
            Result := expression.start_position
         else
            Result := comment.start_position
         end
      end

   is_void: BOOLEAN False

   is_manifest_string: BOOLEAN False

   is_implicit_current: BOOLEAN False

   is_current: BOOLEAN False

   is_result: BOOLEAN False

   is_writable: BOOLEAN False

   precedence: INTEGER
      do
         check
            False -- This one must never be called.
            -- Well, an ASSERTION is not really an ordinary EXPRESSION.
         end
      end

   is_static: BOOLEAN
      do
         Result := expression.is_static
      end

   pretty (indent_level: INTEGER)
      do
         pretty_printer.set_indent_level(indent_level)
         if tag /= Void then
            pretty_printer.put_string(tag.to_string)
            pretty_printer.put_string(once ": ")
         end
         if expression /= Void then
            expression.pretty(indent_level)
            if pretty_printer.semi_colon_flag then
               pretty_printer.put_character(';')
            end
         end
         if comment /= Void then
            comment.pretty(indent_level + 1)
         end
         pretty_printer.set_indent_level(0)
      end

   short (type: TYPE)
      do
         check
            False -- This one must never be called.
         end
         not_yet_implemented -- To be warned in -boost mode as well.
      end

   short_target (type: TYPE)
      do
         check
            False -- This one must never be called.
         end
         not_yet_implemented -- To be warned in -boost mode as well.
      end

   short_hooks (type: TYPE; h01, r01, h02, r02, h03, r03, h04, r04, h05, r05, h06, r06, h07, r07, h08, r08, h09,
                r09, h10, r10, h11, r11, h12, r12, h13, r13: STRING)
      do
         short_printer.hook_or(h01, r01)
         if tag = Void then
            short_printer.hook_or(h02, r02)
         else
            short_printer.hook_or(h03, r03)
            tag.short
            short_printer.hook_or(h04, r04)
         end
         if expression = Void then
            short_printer.hook_or(h05, r05)
         else
            short_printer.hook_or(h06, r06)
            expression.short(type)
            short_printer.hook_or(h07, r07)
         end
         if comment = Void then
            short_printer.hook_or(h08, r08)
         else
            short_printer.hook_or(h09, r09)
            comment.short(h10, r10, h11, r11)
            short_printer.hook_or(h12, r12)
         end
         short_printer.hook_or(h13, r13)
      end

   use_current (type: TYPE): BOOLEAN
      do
         if expression /= Void then
            Result := expression.use_current(type)
         end
      end

   simplify (type: TYPE): EXPRESSION
      do
         check
            False
         end
      end

   extra_bracket_flag: BOOLEAN
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

   pretty_target (indent_level: INTEGER)
      do
         check
            False
         end
      end

   non_void_no_dispatch_type (type: TYPE): TYPE
      do
         check
            False
         end
      end

   declaration_type: TYPE
      do
         check
            False
         end
      end

   written_declaration_type_mark: TYPE_MARK
      do
         check False end
      end

   is_always_true (type: TYPE): BOOLEAN
         -- Well, if we can avoid the cost of some assertions, it is better.
      local
-- ***         exp1, exp2: like expression
      do
         if expression = Void then
            Result := True
         elseif {E_TRUE} ?:= expression then
            Result := True
--*** Try the following one day... *** DOM April 21th 2008 ***
--***         elseif expression.side_effect_free(type) then
--***            exp1 := expression
--***            exp2 := exp1.simplify(type)
--***
--***            from
--***               exp1 := expression
--***               exp2 := exp1.simplify(type)
--***            until
--***               exp1 = exp2
--***            loop
--***               sedb_breakpoint
--***               exp1 := exp2
--***               exp2 := exp1.simplify(type)
--***            end
--***
--***            Result := ({E_TRUE} ?:= exp1)
         end
      end

   safety_check (type: TYPE)
      do
         if expression /= Void then
            expression.safety_check(type)
         end
      end

   accept (visitor: ASSERTION_VISITOR)
      do
         visitor.visit_assertion(Current)
      end

   collect (type: TYPE): TYPE
      local
         dummy: TYPE
      do
         if expression /= Void then
            dummy := expression.collect(type)
         end
      end

   resolve_in (type: TYPE): TYPE
      do
      end

   adapt_for (t: TYPE): like Current
      local
         exp: like expression
      do
         if expression /= Void then
            exp := expression.adapt_for(t)
         end
         Result := current_or_twin_init(exp)
      end

   side_effect_free (type: TYPE): BOOLEAN
      do
         Result := True
         if expression /= Void then
            Result := expression.side_effect_free(type)
         end
      end

   has_been_specialized: BOOLEAN
      do
         Result := expression /= Void implies expression.has_been_specialized
      end

   specialize_in (type: TYPE): like Current
      local
         exp: EXPRESSION
      do
         if expression /= Void then
            exp := expression.specialize_in(type)
         end
         Result := current_or_twin_init(exp)
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         exp: EXPRESSION
      do
         if expression /= Void then
            exp := expression.specialize_thru(parent_type, parent_edge, new_type)
         end
         Result := current_or_twin_init(exp)
      end

   specialize_and_check (type: TYPE): like Current
      local
         exp: EXPRESSION
      do
         if expression /= Void then
            exp := expression.specialize_and_check(type)
         end
         Result := current_or_twin_init(exp)
         Result.specialize_check(type)
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      local
         exp: like expression
      do
         if expression /= Void then
            if tag /= Void then
               -- No need to build `source_view'.
            elseif source_view = Void then
               source_view := once "... unique buffer ..."
               source_view.clear_count
               pretty_printer.expression_in(source_view, expression)
               source_view := source_view.twin
            end
            code_accumulator.open_new_context
            expression.inline_dynamic_dispatch_(code_accumulator, type)
            exp := code_accumulator.current_context_to_expression
            code_accumulator.close_current_context
         end
         code_accumulator.current_context.add_last(current_or_twin_init(exp))
      ensure then
         code_accumulator.current_context.count = 1
         {ASSERTION} ?:= code_accumulator.current_context.last
      end

feature {ASSERTION}
   specialize_check (type: TYPE)
      local
         rt: TYPE
      do
         if expression /= Void then
            rt := expression.resolve_in(type)
            if not rt.is_boolean then
               error_handler.append(once "An assertion must be a BOOLEAN expression.")
               error_handler.add_position(expression.start_position)
               error_handler.append(once "(The type of this expression is actually ")
               error_handler.append(rt.name.to_string)
               error_handler.append(once ".)")
               error_handler.print_as_fatal_error
            end
         end
      end

feature {ASSERTION}
   init (exp: like expression)
      require
         exp /= Void
      do
         expression := exp
      ensure
         expression = exp
      end

feature {ANY}
   source_view: STRING

feature {}
   current_or_twin_init (exp: like expression): like Current
      do
         if exp = expression then
            Result := Current
         else
            Result := twin
            Result.init(exp)
         end
      end

   make (t: like tag; exp: like expression; c: like comment)
      require
         t /= Void or exp /= Void or c /= Void
      do
         tag := t
         expression := exp
         comment := c
      ensure
         tag = t
         expression = exp
         comment = c
      end

invariant
   (tag /= Void) or (expression /= Void) or (comment /= Void)

end -- class ASSERTION
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
