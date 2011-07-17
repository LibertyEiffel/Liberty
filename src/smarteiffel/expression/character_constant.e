-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CHARACTER_CONSTANT
	--
	-- For Manifest Constant CHARACTER.
	--

inherit
	BASE_TYPE_CONSTANT

creation {EIFFEL_PARSER}
	make

creation {ANY}
	with

feature {ANY}
	extra_bracket_flag: BOOLEAN is False

	value: CHARACTER

	pretty_view: STRING
			-- To be used for `pretty'.
	
	declaration_type: TYPE is
		once
			Result := smart_eiffel.type_character
		end
	
	frozen resolve_in (type: TYPE): TYPE is
		do
			Result := declaration_type
		end
	
	compile_to_c (type: TYPE) is
		do
			cpp.pending_c_function_body.append(once "((T3)%'")
			if value.is_letter or else value.is_digit then
				cpp.pending_c_function_body.extend(value)
			elseif value = '%N' then
				cpp.pending_c_function_body.append(once "\n")
			else
				cpp.pending_c_function_body.extend('\')
				value.code.low_8.to_octal_in(cpp.pending_c_function_body)
			end
			cpp.pending_c_function_body.append(once "%')")
		end

	compile_to_jvm, compile_target_to_jvm (type: TYPE) is
		do
			code_attribute.opcode_push_integer(value.code)
		end

	jvm_branch_if_false, jvm_branch_if_true (type: TYPE): INTEGER is
		do
			check
				False
			end
		end

	to_string: STRING is
		do
			if pretty_view /= Void then
				Result := pretty_view.twin
			else
				check
					(not smart_eiffel.pretty_flag) and then (not smart_eiffel.short_or_class_check_flag)
				end
				-- Probably trying to report an error. So we just rebuild 
				-- a standard 
				Result := once "......."
				Result.clear_count
				Result.extend('%'')
				inspect
					value
				when '@' .. '~' then
					Result.extend(value)
				else
					character_coding(value, Result)
				end
				Result.extend('%'')
			end
		end

	simplify_1_, simplify_2: like Current is
		do
			Result := Current
		end

feature {ANY}
	accept (visitor: CHARACTER_CONSTANT_VISITOR) is
		do
			visitor.visit_character_constant(Current)
		end

feature {}
	make (sp: like start_position; v: like value; pv: like pretty_view) is
		require
			not sp.is_unknown
		do
			start_position := sp
			value := v
			pretty_view := pv
		ensure
			start_position = sp
			value = v
			pretty_view = pv
		end

	with (sp: like start_position; v: like value) is
		require
			not sp.is_unknown
		do
			make(sp, v, Void)
		end

end -- class CHARACTER_CONSTANT
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
