-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class INSTRUCTION
   --
   -- For all different kinds of Eiffel instructions.
   --

inherit
   CODE

feature {ANY}
   eiffel_parser_stamp: INTEGER
         -- Value greater than 0 strictly given by the `eiffel_parser'. Internally generated pseudo
         -- code (i.e. non-written or inlined code) is supposed to have a 0 value. When comparing
         -- two instructions (created by the `eiffel_parser'), a greater value indicates that the
         -- instruction was parsed after the other. The `eiffel_parser_stamp' is used to `unlock'
         -- temporary INTERNAL_C_LOCAL.

   specialize_and_check (type: TYPE): INSTRUCTION
      deferred
      end

   collect (type: TYPE): TYPE
      deferred
      ensure
         Result = Void
      end

   end_mark_comment: BOOLEAN
         -- True for instructions which may have a possible "end" mark comment.
         -- As an example, it is True for a "loop", or an "inspect" statement.
         -- It is False for an assignment or for a simple procedure call.
      deferred
      end

   accept (visitor: VISITOR)
      deferred
      end

   frozen inline_dynamic_dispatch (code_accumulator: CODE_ACCUMULATOR; type: TYPE): INSTRUCTION
      require
         code_accumulator /= Void
         type /= Void
      do
         code_accumulator.open_new_context
         Current.inline_dynamic_dispatch_(code_accumulator, type)
         Result := code_accumulator.current_context_to_instruction
         code_accumulator.close_current_context
      ensure
         code_accumulator.context_level = old code_accumulator.context_level
      end

feature {ANONYMOUS_FEATURE, CODE, INTROSPECTION_HANDLER}
   simplify (type: TYPE): INSTRUCTION
      deferred
      end

feature {EIFFEL_PARSER, COMPOUND, ASSIGNMENT, PROCEDURE_CALL}
   set_eiffel_parser_stamp (eps: like eiffel_parser_stamp)
      do
         eiffel_parser_stamp := eps
      end

end -- class INSTRUCTION
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
