-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class INLINE_MEMO
   --
   -- Used to store the result of an inlining attempt. Just because a Void `Result' would be
   -- ambiguous: if the caller get an INLINE_MEMO, he knows that the inlining was possible,
   -- even, if the result of the inlining is a Void value!
   --

create {SMART_EIFFEL}
   make

feature {ANY}
   expression: EXPRESSION
      require
         is_expression_holder
      do
         Result ::= code
      ensure
         -- The inlining of an EXPRESSION cannot be Void:
         Result /= Void
      end

   instruction: INSTRUCTION
      require
         is_instruction_holder
      do
         Result ::= code
      end

   cleared: BOOLEAN
      do
         Result := code = Void
      end

   is_instruction_holder: BOOLEAN
      do
         Result := {INSTRUCTION} ?:= code
      end

   is_expression_holder: BOOLEAN
      do
         Result := {EXPRESSION} ?:= code
      end

feature {ANONYMOUS_FEATURE, EFFECTIVE_ARG_LIST}
   set_expression (e: like expression)
      require
         e /= Void
         code = Void
      do
         code := e
      ensure
         code = e
      end

   set_instruction (i: like instruction)
      require
         code = Void
      do
         code := i
      ensure
         code = i
      end

feature {SMART_EIFFEL}
   clear
      do
         code := Void
      end

feature {}
   code: CODE

   make
      do
      end

end -- class INLINE_MEMO
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
