-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class INTERNAL_LOCAL2
	--
	-- An object of this class holds a special local variable that is internally generated when simplifying some
	-- code. Such variables don't need to be initialized.
	--

inherit
	NON_WRITTEN_EXPRESSION
		redefine
			written_declaration_type_mark
		end
	
creation {INSPECT_STATEMENT, FUNCTION_CALL, MANIFEST_STRING_INSPECTOR, IFTHEN}
	make

feature {ANY}
	start_position: POSITION

	original_expression: EXPRESSION
			-- The original expression which is stored in `Current'.

	collect_flag: BOOLEAN
			-- Indicate that `original_expression' must be collected.
	
	is_result: BOOLEAN is False
	
	side_effect_free (type: TYPE): BOOLEAN is
		do
			Result := True
		end

	use_current (type: TYPE): BOOLEAN is
		do
		end

	safety_check (type: TYPE) is
		do
		end

	accept (visitor: INTERNAL_LOCAL2_VISITOR) is
		do
			visitor.visit_internal_local2(Current)
		end

	non_void_no_dispatch_type (type: TYPE): TYPE is
		do
			-- Could be better when `result_type' is a leaf.
		end

	written_declaration_type_mark: TYPE_MARK is
		do
			Result := original_expression.written_declaration_type_mark
		end

	is_writable: BOOLEAN is True

	resolve_in (type: TYPE): TYPE is
		do
			Result := original_expression.resolve_in(type)
		end

	declaration_type: TYPE is
		do
			Result := original_expression.declaration_type
		end

	collect (type: TYPE): TYPE is
		do
			if collect_flag then
				Result := original_expression.collect(type)
			else
				Result := original_expression.resolve_in(type)
			end
		end

	adapt_for (type: TYPE): like Current is
		do
			Result := Current
		end

	is_static: BOOLEAN is False

	compile_to_c (type: TYPE) is
		do
			if internal_c_local = Void	or else
				pending_c_function_counter /= cpp.pending_c_function_counter
			 then
				internal_c_local := cpp.pending_c_function_lock_local(resolve_in(type), tag)
				pending_c_function_counter := cpp.pending_c_function_counter
			end
			internal_c_local.append_in(cpp.pending_c_function_body)
		end

	mapping_c_target (type, formal_target_type: TYPE) is
		do
			if formal_target_type.is_reference then
				cpp.pending_c_function_body.append(once "((T")
				formal_target_type.id.append_in(cpp.pending_c_function_body)
				cpp.pending_c_function_body.append(once "*)")
				compile_to_c(type)
				cpp.pending_c_function_body.extend(')')
			elseif formal_target_type.is_user_expanded then
				if not formal_target_type.is_empty_expanded then
					cpp.pending_c_function_body.extend('&')
				end
				compile_to_c(type)
			else
				compile_to_c(type)
			end
		end

	mapping_c_arg (type: TYPE) is
		do
			compile_to_c(type)
		end

	simplify (type: TYPE): EXPRESSION is
		do
			Result := Current
		end

	compile_to_jvm (type: TYPE) is
		do
			not_yet_implemented
		end

	compile_target_to_jvm (type: TYPE) is
		do
			standard_compile_target_to_jvm(type)
		end

	jvm_branch_if_false (type: TYPE): INTEGER is
		do
			compile_to_jvm(type)
			Result := code_attribute.opcode_ifeq
		end

	jvm_branch_if_true (type: TYPE): INTEGER is
		do
			compile_to_jvm(type)
			Result := code_attribute.opcode_ifne
		end

	jvm_assign, jvm_assign_creation (type: TYPE) is
		do
			not_yet_implemented
		end

feature {ASSIGNMENT}
	unlock is
		do
		end
	
feature {CODE, EFFECTIVE_ARG_LIST}
	inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
		do
			code_accumulator.current_context.add_last(Current)
		end
	
feature {}
	pending_c_function_counter: INTEGER
	
	internal_c_local: INTERNAL_C_LOCAL

	tag: STRING
	
	make (sp: like start_position; oe: like original_expression; t: like tag; cf: like collect_flag) is
		require
			not sp.is_unknown
			oe /= Void
		do
			start_position := sp
			original_expression := oe
			tag := t
			collect_flag := cf
		ensure
			start_position = sp
			original_expression = oe
			tag = t
			collect_flag = cf
		end

invariant
	not start_position.is_unknown

	original_expression /= Void

end -- class INTERNAL_LOCAL2
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
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
