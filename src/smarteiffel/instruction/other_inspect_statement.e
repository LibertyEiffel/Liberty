-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class OTHER_INSPECT_STATEMENT
	--
	-- See INSPECT_STATEMENT for explanations.
	--
	
inherit
	INSPECT_STATEMENT

creation
	make, with_when_list, make_strippable

feature {ANY}
	accept (visitor: OTHER_INSPECT_STATEMENT_VISITOR) is
		do
			visitor.visit_other_inspect_statement(Current)
		end

	dynamic_dispatch_flag: BOOLEAN is
			-- Indicate that the intent of `Current' is to implement dynamic dispatch.
		do
			Result := dynamic_dispatch_temporary1 /= Void
		end
	
feature {PROCEDURE_CALL, FUNCTION_CALL}
	set_dynamic_dispatch_flag (ddt1: like dynamic_dispatch_temporary1) is
		require
			ddt1 /= Void
		do
			dynamic_dispatch_temporary1 := ddt1
		ensure
			dynamic_dispatch_temporary1 = ddt1
		end

feature {INSPECT_STATEMENT}
	validity_check (type, expression_type: TYPE) is
		local
			i: INTEGER
		do
			if when_list /= Void then
				-- Validity check first:
				from
					i := when_list.lower
				until
					i > when_list.upper
				loop
					when_list.item(i).validity_check(type, expression_type, Current)
					i := i + 1
				end
			end
		end

end -- class OTHER_INSPECT_STATEMENT
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
