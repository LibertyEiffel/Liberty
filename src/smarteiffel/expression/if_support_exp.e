-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class IF_SUPPORT_EXP
   --
   -- Common ancestor of IFTHENELSE_EXP and IFTHEN_EXP.
   --

insert
   GLOBALS

feature {ANY}
   start_position: POSITION
         -- Of the "if" keyword or `start_position' of the "elseif" keyword.

   expression: EXPRESSION
         -- Which must be a boolean `expression'.

   then_expression: EXPRESSION
         -- Not Void if any.

   side_effect_free (type: TYPE): BOOLEAN
      do
         --|*** Could be better ***
      end

   end_mark_comment: BOOLEAN True

feature {ANY} -- EXPRESSION common properties
   is_void: BOOLEAN False
   is_static: BOOLEAN False
   is_result: BOOLEAN False
   is_current: BOOLEAN False
   is_writable: BOOLEAN False
   extra_bracket_flag: BOOLEAN False
   is_manifest_string: BOOLEAN False
   is_implicit_current: BOOLEAN False

   precedence: INTEGER 2

feature {IF_SUPPORT_EXP}
   frozen specialize_check_ (type: TYPE)
      local
         dt: TYPE
      do
         dt := expression.declaration_type
         if not dt.is_boolean then
            error_handler.append(once "%"if%" (or %"elseif%" as well) must be followed by a BOOLEAN expression.")
            error_handler.add_position(start_position)
            error_handler.print_as_error
            error_handler.append(once "The declaration type of this expression is ")
            error_handler.append(dt.name.to_string)
            error_handler.append(once " (this is not BOOLEAN).")
            error_handler.add_position(expression.start_position)
            error_handler.print_as_fatal_error
         end
      end

   frozen pretty_ (indent_level: INTEGER; first_keyword: STRING)
      require
         first_keyword.is_equal(once "if") or first_keyword.is_equal(once "elseif")
      do
         pretty_printer.set_indent_level(indent_level)
         pretty_printer.keyword(first_keyword)
         pretty_printer.set_semi_colon_flag(False)
         expression.pretty(indent_level + 1)
         pretty_printer.keyword(once "then")
         pretty_printer.set_indent_level(0)
         then_expression.pretty(indent_level + 1)
      end

   frozen pretty_end_if (indent_level: INTEGER)
      do
         pretty_printer.set_indent_level(indent_level)
         pretty_printer.keyword(once "end")
         if pretty_printer.print_end_of_statement then
            pretty_printer.put_end_of(once "if")
         end
         pretty_printer.set_indent_level(indent_level)
      end

invariant
   expression /= Void
   then_expression /= Void

end -- class IF_SUPPORT_EXP
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
