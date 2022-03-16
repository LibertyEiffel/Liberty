-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class LOOP_VARIANT
   --
   -- The variant part of a loop instruction. This class is mostly syntactic sugar (see
   -- LOOP_INSTRUCTION). Also note that, a LOOP_VARIANT is not really an ordinary EXPRESSION, but it
   -- is convenient to inherit EXPRESSION.
   --

inherit
   EXPRESSION

create {EIFFEL_PARSER}
   make

feature {ANY}
   comment1: COMMENT
         -- If any the one after the %"variant%" keyword.

   tag: TAG_NAME
         -- If any, the optional tag name.

   comment2: COMMENT
         -- If any the one which can be between `tag' and `expression'.

   expression: EXPRESSION
         -- The variant INTEGER expression itself.

   start_position: POSITION
      do
         if tag /= Void then
            Result := tag.start_position
         else
            Result := expression.start_position
         end
      end

   is_implicit_current: BOOLEAN False

   is_current: BOOLEAN False

   is_manifest_string: BOOLEAN False

   is_void: BOOLEAN False

   is_static: BOOLEAN False

   is_result: BOOLEAN False

   is_writable: BOOLEAN False

   precedence: INTEGER
      do
         check
            False -- Not really an expression.
         end
      end

   extra_bracket_flag: BOOLEAN
      do
         check
            False -- Not in target position.
         end
      end

   declaration_type: TYPE
      do
         Result := expression.declaration_type
      ensure then
         Result.is_integer
      end

   written_declaration_type_mark: TYPE_MARK
      do
         Result := expression.written_declaration_type_mark
      end

   non_void_no_dispatch_type (type: TYPE): TYPE
      do
         check
            False -- Not in target position.
         end
      end

   collect (t: TYPE): TYPE
      do
         Result := expression.collect(t)
      end

   adapt_for (t: TYPE): like Current
      do
         check
            False -- Already moved as an EXPRESSION into the enclosing LOOP_INSTRUCTION.
         end
      end

   use_current (type: TYPE): BOOLEAN
      do
         Result := expression.use_current(type)
      end

   pretty (indent_level: INTEGER)
      do
         if comment1 /= Void then
            comment1.pretty(indent_level)
         end
         if tag /= Void then
            pretty_printer.set_indent_level(indent_level)
            pretty_printer.put_string(tag.to_string)
            pretty_printer.put_string(": ")
         end
         if comment2 /= Void then
            comment2.pretty(indent_level)
         end
         expression.pretty(indent_level)
      end

   bracketed_pretty (indent_level: INTEGER)
      do
         check
            False -- Not in target position.
         end
      end

   pretty_target (indent_level: INTEGER)
      do
         check
            False -- Not in target position.
         end
      end

   short (type: TYPE)
      do
         check
            False -- Not visible in contracts.
         end
      end

   short_target (type: TYPE)
      do
         check
            False -- Not visible in contracts.
         end
      end

   specialize_in (type: TYPE): like Current
      local
         exp: like expression
      do
         exp := expression.specialize_in(type)
         if exp /= expression then
            Result := twin
            Result.init(exp)
         else
            Result := Current
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         exp: like expression
      do
         exp := expression.specialize_thru(parent_type, parent_edge, new_type)
         if exp /= expression then
            Result := twin
            Result.init(exp)
         else
            Result := Current
         end
      end

   specialize_and_check (type: TYPE): like Current
      local
         exp: like expression
      do
         exp := expression.specialize_and_check(type)
         if exp /= expression then
            Result := twin
            Result.init(exp)
         else
            Result := Current
         end
         Result.specialize_check(type)
      end

   has_been_specialized: BOOLEAN
      do
         Result := expression.has_been_specialized
      end

   resolve_in (type: TYPE): TYPE
      do
         Result := expression.resolve_in(type)
      ensure then
         Result.is_integer
      end

   accept (visitor: LOOP_VARIANT_VISITOR)
      do
         visitor.visit_loop_variant(Current)
      end

   side_effect_free (type: TYPE): BOOLEAN
      do
         Result := expression.side_effect_free(type)
      end

   safety_check (type: TYPE)
      do
         expression.safety_check(type)
      end

   simplify (type: TYPE): EXPRESSION
      do
         smart_eiffel.magic_count_increment
         Result := expression.simplify(type)
      end

feature {LOOP_VARIANT}
   init (exp: like expression)
      require
         exp /= Void
      do
         expression := exp
      ensure
         expression = exp
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      do
         expression.inline_dynamic_dispatch_(code_accumulator, type)
      end

   specialize_check (type: TYPE)
      local
         dt: TYPE
      do
         dt := expression.declaration_type
         if not dt.is_integer then
            error_handler.add_position(expression.start_position)
            error_handler.append(once "Expression of the loop variant must be of INTEGER type. (The actual ")
            error_handler.append(dt.name.to_string)
            error_handler.append(once " type is not allowed as a variant type.)")
            error_handler.print_as_error
            error_handler.add_position(start_position)
            error_handler.add_position(expression.start_position)
            error_handler.append(once "Error in variant part of loop definition.")
            error_handler.print_as_fatal_error
         end
      end

feature {}
   make (c1: COMMENT; t: like tag; c2: COMMENT; exp: like expression)
      require
         exp /= Void
      do
         comment1 := c1
         tag := t
         comment2 := c2
         expression := exp
      ensure
         comment1 = c1
         tag = t
         comment2 = c2
         expression = exp
      end

invariant
   expression /= Void

end -- class LOOP_VARIANT
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
