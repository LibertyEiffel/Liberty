-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_INLINE
   --
   -- To implement `c_inline_c' and `c_inline_h'.
   --

inherit
	INSTRUCTION

creation {EIFFEL_PARSER}
	make_c_inline_c, make_c_inline_h

feature {ANY}
	is_c_inline_c: BOOLEAN
	
	c_code: STRING
			-- The C code to be inlined.

	end_mark_comment: BOOLEAN is False

	start_position: POSITION
			-- To be shown at run-time (the one of the `sedb' call or the `ds.p' assignment).

	specialize_in (new_type: TYPE): like Current is
		do
			Result := Current
		end
	
	specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
		do
			Result := Current
		end

	has_been_specialized: BOOLEAN is
		do
			Result := True
		end

	specialize_2 (type: TYPE): INSTRUCTION is
		do
			Result := Current
		end

	simplify (type: TYPE): INSTRUCTION is
		do
			Result := Current
		end
	
	accept (visitor: C_INLINE_VISITOR) is
		do
			visitor.visit_c_inline(Current)
		end

	collect (type: TYPE): TYPE is
		do
		end

	pretty (indent_level: INTEGER) is
		do
			not_yet_implemented
		end

	use_current (type: TYPE): BOOLEAN is
		do
			check
				is_c_inline_c
			end
			Result := c_code.has('C')
		end

	side_effect_free (type: TYPE): BOOLEAN is
		do
			check
				not Result
			end
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
			if is_c_inline_c then
				cpp.pending_c_function_body.append(c_code)
			else
				cpp.put_c_inline_h(c_code)
			end
		end

	compile_to_jvm (type: TYPE) is
		do
			error_handler.add_position(start_position)
			error_handler.append("Cannot use %"c_inline_c%" or %"c_inline_h%" to produce Java byte code.")
			error_handler.print_as_fatal_error
		end


feature {CODE, EFFECTIVE_ARG_LIST}
	inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
		do
			code_accumulator.current_context.add_last(Current)
		end
	
feature {}
	make_c_inline_c (sp: like start_position; cc: like c_code) is
		do
			is_c_inline_c := True
			c_code := cc
			start_position := sp
		ensure
			is_c_inline_c
			start_position = sp
		end
	
	make_c_inline_h (sp: like start_position; cc: like c_code) is
		do
			c_code := cc			
			start_position := sp
		ensure
			not is_c_inline_c
			start_position = sp
		end

invariant
	not start_position.is_unknown
	
end -- class C_INLINE
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
