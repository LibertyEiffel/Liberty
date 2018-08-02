-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class INSTRUCTION_VISITOR

inherit
   AGENT_INSTRUCTION_VISITOR
   ASSERTION_LIST_VISITOR
   ASSIGNMENT_ATTEMPT_VISITOR
   ASSIGNMENT_CALL_ASSIGNER_VISITOR
   ASSIGNMENT_VISITOR
   CHECK_COMPOUND_VISITOR
   C_INLINE_VISITOR
   COMMENT_VISITOR
   COMPOUND_VISITOR
   CREATE_INSTRUCTION_VISITOR
   DEBUG_COMPOUND_VISITOR
   IFTHENELSE_VISITOR
   IFTHEN_VISITOR
   INSPECT_STATEMENT_VISITOR
   LOOP_INSTRUCTION_VISITOR
   NO_INVARIANT_WRAPPER_VISITOR
   NON_WRITTEN_INSTRUCTION_VISITOR
   PRECURSOR_INSTRUCTION_VISITOR
   PROCEDURE_CALL_VISITOR
   REQUIRE_ASSERTION_VISITOR
   RETRY_INSTRUCTION_VISITOR
   WHEN_CLAUSE_VISITOR

end -- class INSTRUCTION_VISITOR
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
