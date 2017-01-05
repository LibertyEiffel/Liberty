-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CALL_INFIX_GT
   --
   -- Infix operator : ">".
   --

inherit
   CALL_INFIX

create {EIFFEL_PARSER, EXTERNAL_PROCEDURE}
   make

create {AGENT_CREATION}
   with

feature {ANY}
   precedence: INTEGER 6

   left_brackets: BOOLEAN False

   operator: STRING
      do
         Result := as_gt
      end
      --|*** simplify_1_: EXPRESSION
      --|*** local
      --|*** ic1, ic2: INTEGER_CONSTANT
      --|*** do
      --|*** target := target.simplify_1
      --|*** arguments.simplify_1
      --|*** ic1 ?= target
      --|*** if ic1 = Void then
      --|*** Result := Current
      --|*** else
      --|*** ic2 ?= arg1
      --|*** if ic2 = Void then
      --|*** Result := Current
      --|*** else
      --|*** if ic1.value_memory > ic2.value_memory then
      --|*** create {E_TRUE} Result.make(feature_name.start_position)
      --|*** else
      --|*** create {E_FALSE} Result.make(feature_name.start_position)
      --|*** end
      --|*** end
      --|*** end
      --|*** end

feature {ANY}
   accept (visitor: CALL_INFIX_GT_VISITOR)
      do
         visitor.visit_call_infix_gt(Current)
      end

feature {}
   make (lp: like target; operator_position: POSITION; rp: like arg1)
      require
         lp /= Void
         not operator_position.is_unknown
         rp /= Void
      do
         target := lp
         create feature_name.infix_name(eiffel_parser.gt_name, operator_position)
         create {EFFECTIVE_ARG_LIST_N} arguments.make_1(start_position, rp)
      ensure
         target = lp
         start_position = operator_position
         arguments.first = rp
      end

end -- class CALL_INFIX_GT
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
