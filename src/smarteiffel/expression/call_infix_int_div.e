-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CALL_INFIX_INT_DIV
   --
   -- Infix operator : "//".
   --

inherit
   CALL_INFIX
      redefine
         static_simplify
      end

create {EIFFEL_PARSER}
   make

create {AGENT_CREATION}
   with

feature {ANY}
   precedence: INTEGER 8

   left_brackets: BOOLEAN False

   operator: STRING
      do
         Result := as_slash_slash
      end

   static_simplify: EXPRESSION
      local
         ic1, ic2: INTEGER_CONSTANT; v1, v2, r: INTEGER_64
      do
         target := target.static_simplify
         arguments.static_simplify
         ic2 ?= arg1
         if ic2 = Void then
            Result := Current
         else
            v2 := ic2.value_memory
            if v2 = 0 then
               error_handler.append(once "Division by zero.")
               error_handler.add_position(feature_name.start_position)
               error_handler.print_as_fatal_error
            end
            ic1 ?= target
            if ic1 = Void then
               Result := Current
            else
               v1 := ic1.value_memory
               r := v1 // v2
               create {INTEGER_CONSTANT}
               Result.make(r, feature_name.start_position)
            end
         end
      end

feature {ANY}
   accept (visitor: CALL_INFIX_INT_DIV_VISITOR)
      do
         visitor.visit_call_infix_int_div(Current)
      end

feature {}
   make (lp: like target; operator_position: POSITION; rp: like arg1)
      require
         lp /= Void
         not operator_position.is_unknown
         rp /= Void
      do
         target := lp
         create feature_name.infix_name(eiffel_parser.slash_slash_name, operator_position)
         create {EFFECTIVE_ARG_LIST_N} arguments.make_1(start_position, rp)
      ensure
         target = lp
         start_position = operator_position
         arguments.first = rp
      end

end -- class CALL_INFIX_INT_DIV
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
