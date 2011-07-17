-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CALL_INFIX_DIV
	--
	--   Infix operator : "/".
	--

inherit
	CALL_INFIX

creation {EIFFEL_PARSER}
	make

creation {AGENT_CREATION}
	with

feature {ANY}
	precedence: INTEGER is 8

	left_brackets: BOOLEAN is False
			--|*** simplify_1_: EXPRESSION is
			--|*** do
			--|*** target := target.simplify_1
			--|*** arguments.simplify_1
			--|*** -- Should we create a DOUBLE result ?
			--|*** -- Don't know yet. (4/4/2003) D.Colnet
			--|*** Result := Current
			--|*** end

	operator: STRING is
		do
			Result := as_slash
		end

	compile_to_jvm (type: TYPE) is
		do
			not_yet_implemented
		end

	jvm_branch_if_false (type: TYPE): INTEGER is
		do
			Result := jvm_standard_branch_if_false(type)
		end

	jvm_branch_if_true (type: TYPE): INTEGER is
		do
			Result := jvm_standard_branch_if_true(type)
		end

feature {ANY}
	accept (visitor: CALL_INFIX_DIV_VISITOR) is
		do
			visitor.visit_call_infix_div(Current)
		end

feature {}
	make (lp: like target; operator_position: POSITION; rp: like arg1) is
		require
			lp /= Void
			not operator_position.is_unknown
			rp /= Void
		do
			target := lp
			create feature_name.infix_name(eiffel_parser.slash_name, operator_position)
			create arguments.make_1(rp)
		ensure
			target = lp
			start_position = operator_position
			arguments.first = rp
		end

end -- class CALL_INFIX_DIV
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
