-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class MANIFEST_STRING_INSPECT_STATEMENT
   --
   -- See INSPECT_STATEMENT for explanations as well as the class invariant.
   --

inherit
   INSPECT_STATEMENT

create {ANY}
   with_when_list

feature {ANY}
   dynamic_dispatch_flag: BOOLEAN False

   accept (visitor: MANIFEST_STRING_INSPECT_STATEMENT_VISITOR)
      do
         visitor.visit_manifest_string_inspect_statement(Current)
      end

feature {INSPECT_STATEMENT}
   validity_check (type, expression_type: TYPE)
      do
         if not expression_type.is_string and then not expression_type.is_fixed_string then
            error_handler.add_position(expression.start_position)
            error_handler.append(once "Such an %"inspect%" statement is for type STRING or FIXED_STRING. (The type of ")
            error_handler.add_expression(expression)
            error_handler.append(once " is ")
            error_handler.append(expression_type.name.to_string)
            error_handler.append(once ".)")
            error_handler.print_as_fatal_error
         end
      end

feature {}
   canonical_form (wl: like when_list): BOOLEAN
         -- To summarize: the `when_list' is never empty and each "when" clause has
         -- only MANIFEST_STRING as members.
      require
         not wl.is_empty
         canonical_form(wl)
      local
         i, j: INTEGER; when_item_1: WHEN_ITEM_1; constant: EXPRESSION
         when_clause_list: FAST_ARRAY[WHEN_ITEM]
      do
         Result := True
         from
            i := wl.lower
         until
            not Result or else i > wl.upper
         loop
            from
               when_clause_list := wl.item(i).list
               j := when_clause_list.lower
            until
               not Result or else j > when_clause_list.upper
            loop
               when_item_1 ::= when_clause_list.item(j)
               constant := when_item_1.expression
               Result := (constant /= Void) and then {MANIFEST_STRING} ?:= constant
               j := j + 1
            end
            i := i + 1
         end
      ensure
         assertion_check_only: Result
      end

invariant
   not when_list.is_empty

   canonical_form(when_list)

end -- class MANIFEST_STRING_INSPECT_STATEMENT
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
