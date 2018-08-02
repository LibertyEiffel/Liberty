-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class UNUSED_EXPRESSION
   --
   -- To wrap some expression which appears to be unused but that cannot be dropped because
   -- of some possible side effect.
   --

inherit
   NON_WRITTEN_INSTRUCTION

create {ANY}
   make

feature {ANY}
   expression: EXPRESSION
         -- The unused one.

   start_position: POSITION
      do
         Result := expression.start_position
      end

   use_current (type: TYPE): BOOLEAN
      do
         Result := expression.use_current(type)
      end

   collect (type: TYPE): TYPE
      local
         dummy: TYPE
      do
         dummy := expression.collect(type)
      end

   side_effect_free (type: TYPE): BOOLEAN
      do
         Result := expression.side_effect_free(type)
      end

   safety_check (type: TYPE)
      do
         expression.safety_check(type)
      end

   adapt_for (type: TYPE): like Current
      local
         e: like expression
      do
         e := expression.adapt_for(type)
         if e = expression then
            Result := Current
         else
            create Result.make(e)
         end
      end

   simplify (type: TYPE): INSTRUCTION
      local
         e: like expression
      do
         e := expression.simplify(type)
         if e.side_effect_free(type) then
            check
               Result = Void
            end
         elseif e = expression then
            Result := Current
         else
            create {UNUSED_EXPRESSION} Result.make(e)
         end
      end

   accept (visitor: UNUSED_EXPRESSION_VISITOR)
      do
         visitor.visit_unused_expression(Current)
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      do
         if not expression.side_effect_free(type) then
            code_accumulator.current_context.add_last(Current)
         end
      end

feature {}
   make (e: like expression)
      require
         e /= Void
      do
         expression := e
      ensure
         expression = e
      end

end -- class UNUSED_EXPRESSION
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
