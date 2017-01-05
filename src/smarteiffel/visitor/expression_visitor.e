-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class EXPRESSION_VISITOR

inherit
   ABSTRACT_CURRENT_VISITOR
   ADDRESS_OF_VISITOR
   AGENT_CREATION_VISITOR
   AGENT_EXPRESSION_VISITOR
   ASSERTION_VISITOR
   ASSIGNMENT_TEST_VISITOR
   BUILT_IN_EQ_NEQ_VISITOR
   CLOSED_OPERAND_VISITOR
   CREATE_EXPRESSION_VISITOR
   CREATE_WRITABLE_VISITOR
   E_OLD_VISITOR
   EXPRESSION_WITH_COMMENT_VISITOR
   FAKE_ARGUMENT_VISITOR
   FAKE_TARGET_VISITOR
   FAKE_TUPLE_VISITOR
   FUNCTION_CALL_VISITOR
   GENERATOR_GENERATING_TYPE_VISITOR
   IFTHENELSE_EXP_VISITOR
   IFTHEN_EXP_VISITOR
   IMPLICIT_CAST_VISITOR
   LOCAL_ARGUMENT_REF_VISITOR
   LOOP_VARIANT_VISITOR
   MANIFEST_EXPRESSION_VISITOR
   MANIFEST_GENERIC_VISITOR
   MANIFEST_TUPLE_VISITOR
   NON_WRITTEN_EXPRESSION_VISITOR
   OLD_MANIFEST_ARRAY_VISITOR
   OPEN_OPERAND_VISITOR
   PRECURSOR_EXPRESSION_VISITOR
   RESULT_VISITOR
   WRITABLE_ATTRIBUTE_NAME_VISITOR

end -- class EXPRESSION_VISITOR
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
