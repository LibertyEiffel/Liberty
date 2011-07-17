-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class E_TRUE
	--
	-- When using explicit constant `True'.
	--

inherit
	BOOLEAN_CONSTANT

creation {ANY}
	make

feature {ANY}
	value: BOOLEAN is True

	to_string: STRING is
		do
			Result := fz_true
		end

	compile_to_c (type: TYPE) is
		do
			cpp.pending_c_function_body.extend('1')
		end

	compile_target_to_jvm, compile_to_jvm (type: TYPE) is
		do
			code_attribute.opcode_bipush(1)
		end

	jvm_branch_if_false (type: TYPE): INTEGER is
		do
			code_attribute.opcode_iconst_1
			Result := code_attribute.opcode_ifeq
		end

	jvm_branch_if_true (type: TYPE): INTEGER is
		do
			Result := code_attribute.opcode_goto
		end

feature {ANY}
	accept (visitor: E_TRUE_VISITOR) is
		do
			visitor.visit_e_true(Current)
		end

end -- class E_TRUE
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
