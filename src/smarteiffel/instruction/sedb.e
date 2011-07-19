-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class SEDB
   --
   -- Such a pseudo instruction is added to produce `sedb' viewpoint calls or to add code position 
   -- information in non -boost mode.
   --

inherit
	NON_WRITTEN_INSTRUCTION

creation {CODE_ACCUMULATOR}
	make

feature {ANY}
	start_position: POSITION
			-- To be shown at run-time (the one of the `sedb' call or the `ds.p' assignment).

	simplify (type: TYPE): INSTRUCTION is
		do
			if ace.boost then
				check
					Result = Void
				end
			else
				Result := Current
			end
		end
	
	collect (type: TYPE): TYPE is
		do
		end

	use_current (type: TYPE): BOOLEAN is
		do
		end

	side_effect_free (type: TYPE): BOOLEAN is
		do
			Result := True
		end

	safety_check (type: TYPE) is
		do
		end

	adapt_for (type: TYPE): like Current is
		do
			Result := Current
		end

	compile_to_c (type: TYPE) is
		do
			if start_position.sedb_trace then
				cpp.pending_c_function_body.append(once "sedb(&ds,")
				put_start_position
				cpp.pending_c_function_body.append(once ",'")
				cpp.pending_c_function_body.extend(info_code)
				cpp.pending_c_function_body.append(once "')")
			else
				cpp.pending_c_function_body.append(once "ds.p=")
				put_start_position
			end
			cpp.pending_c_function_body.append(once ";%N")
		end

	accept (visitor: SEDB_VISITOR) is
		do
			visitor.visit_sedb(Current)
		end

feature {CODE, EFFECTIVE_ARG_LIST}
	inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
		do
			if not ace.boost then
				code_accumulator.current_context.add_last(Current)
			end
		end
	
feature {}
	info_code: CHARACTER
	
	make (sp: like start_position; ic: like info_code) is
		require
			not sp.is_unknown
			not ace.boost
		do
			start_position := sp
			info_code := ic
		ensure
			start_position = sp
			info_code = ic
		end

	put_start_position is
		do
			cpp.pending_c_function_body.append(once "0x")
			start_position.mangling.to_hexadecimal_in(cpp.pending_c_function_body)
			cpp.put_position_comment_in(cpp.pending_c_function_body, start_position)
		end

invariant
	not ace.boost
	not start_position.is_unknown
	
end -- class SEDB
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
