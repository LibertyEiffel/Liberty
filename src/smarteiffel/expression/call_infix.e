-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class CALL_INFIX
   --
   -- For all sort of infix operators (root of all CALL_INFIX_*).
   --

inherit
   CALL_1
      redefine pretty_target
      end

feature {ANY}
   extra_bracket_flag: BOOLEAN True

   left_brackets: BOOLEAN
      deferred
      end

   right_brackets: BOOLEAN
      do
         Result := not left_brackets
      end

   operator: STRING
      deferred
      ensure
         Result.count >= 1
      end

   frozen short (type: TYPE)
      do
         if target.precedence = atomic_precedence then
            target.short(type)
         elseif precedence > target.precedence then
            target.bracketed_short(type)
         elseif precedence < target.precedence then
            target.short(type)
         elseif left_brackets then
            target.bracketed_short(type)
         else
            target.short(type)
         end
         short_print_feature_name
         if arg1.precedence = atomic_precedence then
            arg1.short(type)
         elseif precedence > arg1.precedence then
            arg1.bracketed_short(type)
         elseif precedence < arg1.precedence then
            arg1.short(type)
         elseif right_brackets then
            arg1.bracketed_short(type)
         else
            arg1.short(type)
         end
      end

   frozen short_target (type: TYPE)
      do
         bracketed_short(type)
         short_printer.put_dot
      end

   frozen pretty_target (indent_level: INTEGER)
      do
         pretty_printer.put_character('(')
         pretty(indent_level)
         pretty_printer.put_character(')')
         pretty_printer.put_character('.')
      end

   frozen bracketed_pretty (indent_level: INTEGER)
      do
         pretty_printer.put_character('(')
         pretty(indent_level)
         pretty_printer.put_character(')')
      end

   frozen pretty (indent_level: INTEGER)
      do
         -- The `target' first:
         if target.precedence = atomic_precedence then
            target.pretty(indent_level)
         elseif precedence > target.precedence then
            target.bracketed_pretty(indent_level)
         elseif precedence < target.precedence then
            target.pretty(indent_level)
         elseif left_brackets then
            target.bracketed_pretty(indent_level)
         else
            target.pretty(indent_level)
         end
         -- The operator:
         pretty_printer.put_character(' ')
         feature_name.pretty(indent_level)
         pretty_printer.put_character(' ')
         -- The argument, `arg1':
         if arg1.precedence = atomic_precedence then
            arg1.pretty(indent_level)
         elseif precedence > arg1.precedence then
            arg1.bracketed_pretty(indent_level)
         elseif precedence < arg1.precedence then
            arg1.pretty(indent_level)
         elseif right_brackets then
            arg1.bracketed_pretty(indent_level)
         else
            arg1.pretty(indent_level)
         end
      end

feature {}
   frozen with (t: like target; fn: like feature_name; a: like arguments)
      require
         t /= Void
         fn /= Void
         a.count = 1
      do
         target := t
         feature_name := fn
         arguments := a
      ensure
         target = t
         feature_name = fn
         arguments = a
      end

   frozen short_print_feature_name
      do
         short_printer.put_infix_name(once "Binfix", once " ", once "Ainfix", once " ", feature_name)
      end

invariant
   feature_name.is_infix_name

end -- class CALL_INFIX
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
