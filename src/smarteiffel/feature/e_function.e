-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class E_FUNCTION

inherit
	EFFECTIVE_ROUTINE
		redefine specialize_signature_in, specialize_signature_thru,
			inline_expression_0, inline_expression_1, inline_expression_n
		end

creation {ANY}
	make

feature {ANY}
	side_effect_free (target_type: TYPE): BOOLEAN is
		do
		end

	result_type: TYPE_MARK

feature {CALL_0}
	inline_expression_0 (type: TYPE; feature_stamp: FEATURE_STAMP; call_site: POSITION
								target_type: TYPE; target: EXPRESSION;	return_type: TYPE): INLINE_MEMO is
		local
			assignment: ASSIGNMENT; built_in_eq_neq: BUILT_IN_EQ_NEQ; call_0: CALL_0
			direct_non_void_call_flag, no_rescue_no_local_expanded: BOOLEAN
			expression: EXPRESSION; t: TYPE; call_1: CALL_1
		do
			direct_non_void_call_flag := target_type.direct_non_void_call_flag
			no_rescue_no_local_expanded := no_rescue_no_local_expanded_in(target_type)
			if routine_body = Void and then direct_non_void_call_flag and then no_rescue_no_local_expanded then
				-- To handle function with an empty body:
				if target.side_effect_free(type) then
					if return_type.is_user_expanded and then not return_type.is_empty_expanded then
						-- Because of the strange behavior of user's expanded, it is not possible to inline here.
					else
						-- The result is the default value of the corresponding result type:
						Result := smart_eiffel.get_inline_memo
						Result.set_expression(return_type.canonical_type_mark.default_expression(start_position))
					end
				end
			end
			
			-- To handle non Void `routine_body' which is a single ASSIGNMENT:
			if Result = Void and then routine_body /= Void then
				if direct_non_void_call_flag and then no_rescue_no_local_expanded then
					assignment ?= routine_body
					if assignment /= Void then
						if assignment.left_side.is_result then
							if assignment.right_side.is_current then
								-- The "Result := Current" inline:
								if target_type = return_type then
									Result := smart_eiffel.get_inline_memo
									Result.set_expression(target)
								elseif target_type.is_expanded then
									-- May be one {INTEGER_GENERAL}.to_integer_*:
									Result := smart_eiffel.get_inline_memo
									Result.set_expression(assignment_handler.implicit_cast(target, target_type, return_type))
								end
							elseif assignment.right_side.is_static and then target.side_effect_free(type) then
								-- The "Result := <static>" situation:
								expression := assignment.right_side
								if not expression.is_void then
									t := expression.resolve_in(target_type)
									if return_type /= t then
										expression := assignment_handler.implicit_cast(expression, t, return_type)
									end
								end
								Result := smart_eiffel.get_inline_memo
								Result.set_expression(expression)
							else
								built_in_eq_neq ?= assignment.right_side
								if built_in_eq_neq /= Void then
									-- (This pattern includes the BOOLEAN not definition.)
									built_in_eq_neq := inline_eq_neq0(type, built_in_eq_neq, target_type, target)
									if built_in_eq_neq /= Void then
										Result := smart_eiffel.get_inline_memo
										Result.set_expression(built_in_eq_neq)
									end
								else
									call_0 ?= assignment.right_side
									if call_0 /= Void and then call_0.target.is_current then
										-- The "Result := Current.foo" inlining:
										if call_0.resolve_in(target_type).can_be_assigned_to(return_type) then
											-- The result type is correct too:
											Result := smart_eiffel.get_inline_memo
											Result.set_expression(call_0.inline_with(target))
										end
									else
										call_0 := left_most_current_direct_call_0_sequence(target_type, assignment.right_side)
										if call_0 /= Void then
											call_0 := left_most_current_direct_call_0_sequence_inline(type, call_0, target_type, target)
											-- The "Result := Current.foo.bar" inlining:
											Result := smart_eiffel.get_inline_memo
											Result.set_expression(call_0)
										end
									end
								end
							end
						end
					end
				end
			end

			-- Looking for: f: X is do Result := Current.f(<static>) end
			if Result = Void and then
				direct_non_void_call_flag and then
				routine_body /= Void
			 then
				assignment ?= routine_body
				if assignment /= Void and then assignment.left_side.is_result then
					call_1 ?= assignment.right_side
					if call_1 /= Void and then
						call_1.target.is_current and then
						call_1.arg1.is_static
					 then
						Result := smart_eiffel.get_inline_memo
						Result.set_expression(call_1.inline_with(target, call_1.arg1))
					end
				end
			end
			if Result /= Void then
				smart_eiffel.magic_count_increment
			end
		end

feature {CALL_1}
	inline_expression_1 (type: TYPE; feature_stamp: FEATURE_STAMP; call_site: POSITION
		target_type: TYPE; target, arg: EXPRESSION; return_type: TYPE): INLINE_MEMO is
		local
			direct_non_void_call_flag, no_rescue_no_local_expanded: BOOLEAN; assignment: ASSIGNMENT
			built_in_eq_neq: BUILT_IN_EQ_NEQ; call_1: CALL_1; bc: BOOLEAN_CONSTANT; name: STRING
			integer_constant: INTEGER_CONSTANT
		do
			direct_non_void_call_flag := target_type.direct_non_void_call_flag
			no_rescue_no_local_expanded := no_rescue_no_local_expanded_in(target_type)
			if routine_body = Void and then direct_non_void_call_flag and then no_rescue_no_local_expanded then
				-- To handle function with an empty body:
				if target.side_effect_free(type) and then arg.side_effect_free(type) then
					if return_type.is_user_expanded and then not return_type.is_empty_expanded then
						-- Because of the strange behavior of user's expanded, it is not possible to inline here.
					else
						-- The result is the default value of the corresponding result type:
						Result := smart_eiffel.get_inline_memo
						Result.set_expression(return_type.canonical_type_mark.default_expression(start_position))
					end
				end
			end

			if Result = Void and then routine_body /= Void and then
				direct_non_void_call_flag and then no_rescue_no_local_expanded
			 then
				assignment ?= routine_body
				if assignment /= Void then
					if assignment.left_side.is_result then
						call_1 ?= assignment.right_side
						if call_1 /= Void then
							if call_1.resolve_in(target_type) = return_type then
								call_1 := inline_call_1(type, call_1, target_type, target, arg)
								if call_1 /= Void then
									name := first_name.to_string
									if target_type.is_boolean and then (name = as_and or else name = as_or) then
										-- We must not inline BOOLEAN infix "and" and infix "or":
										if arg.side_effect_free(type) then
											-- Except if there is no side effects for the right side:
											Result := smart_eiffel.get_inline_memo
											Result.set_expression(call_1)
										end
									else
										Result := smart_eiffel.get_inline_memo
										Result.set_expression(call_1)
									end
								end
							end
						elseif assignment.right_side.is_static then
							if target.side_effect_free(type) and then arg.side_effect_free(type) then
								Result := smart_eiffel.get_inline_memo
								Result.set_expression(assignment.right_side)
							end
						elseif assignment.right_side.is_current and then arg.side_effect_free(type) then
							-- The "Result := Current" inline:
							if target_type = return_type then
								Result := smart_eiffel.get_inline_memo
								Result.set_expression(target)
							end
						elseif return_type.is_boolean then
							built_in_eq_neq ?= assignment.right_side
							if built_in_eq_neq /= Void then
								built_in_eq_neq := inline_eq_neq1(type, built_in_eq_neq, target_type, target, arg)
								if built_in_eq_neq /= Void then
									Result := smart_eiffel.get_inline_memo
									Result.set_expression(built_in_eq_neq)
								end
							end
						end
					end
				end
			end

			if Result = Void and then target_type.is_integer and then first_name.to_string = as_pow then
				integer_constant := smart_eiffel.simplify_integer_infix_power(call_site, target, arg)
				if integer_constant /= Void then
					Result := smart_eiffel.get_inline_memo
					Result.set_expression(integer_constant)
				end
			end
			
			-- Finally, we must not inline BOOLEAN infix "and" and infix "or".
			if Result /= Void and then target_type.is_boolean then
				name := first_name.to_string
				if name = as_and or else name = as_or then
					bc ?= target
					if bc = Void then
						-- (Except when the target is known.)
						smart_eiffel.dispose_inline_memo(Result)
						Result := Void
					end
				end
			end
			if Result /= Void then
				smart_eiffel.magic_count_increment
			end
		end

feature {FUNCTION_CALL_N}
	inline_expression_n (type: TYPE; feature_stamp: FEATURE_STAMP; target_type: TYPE; target: EXPRESSION
								args: EFFECTIVE_ARG_LIST; return_type: TYPE): INLINE_MEMO is
		local
			direct_non_void_call_flag, no_rescue_no_local_expanded: BOOLEAN; assignment: ASSIGNMENT
			argument_name2: ARGUMENT_NAME2; built_in_eq_neq: BUILT_IN_EQ_NEQ
		do
			direct_non_void_call_flag := target_type.direct_non_void_call_flag
			no_rescue_no_local_expanded := no_rescue_no_local_expanded_in(target_type)
			if routine_body = Void and then direct_non_void_call_flag and then no_rescue_no_local_expanded then
				-- To handle function with an empty body:
				if target.side_effect_free(type) and then args.side_effect_free(type) then
					if return_type.is_user_expanded and then not return_type.is_empty_expanded then
						-- Because of the strange behavior of user's expanded, it is not possible to inline here.
					else
						-- The result is the default value of the corresponding result type:
						Result := smart_eiffel.get_inline_memo
						Result.set_expression(return_type.canonical_type_mark.default_expression(start_position))
					end
				end
			end

			if Result = Void and then routine_body /= Void and then
				direct_non_void_call_flag and then no_rescue_no_local_expanded
			 then
				assignment ?= routine_body
				if assignment /= Void then
					if assignment.left_side.is_result then
						if assignment.right_side.is_static then
							if target.side_effect_free(type) and then args.side_effect_free(type) then
								Result := smart_eiffel.get_inline_memo
								Result.set_expression(assignment.right_side)
							end
						elseif assignment.right_side.is_current and then args.side_effect_free(type) then
							-- The "Result := Current" inline:
							if target_type = return_type then
								Result := smart_eiffel.get_inline_memo
								Result.set_expression(target)
							end
						end
					end
				end
			end

			-- Looking for: f (a, b: X): BOOLEAN is do Result := a = b end
			if Result = Void and then
				direct_non_void_call_flag and then
				routine_body /= Void and then
				args.count = 2 and then
				target.side_effect_free(type)
			 then
				assignment ?= routine_body
				if assignment /= Void and then assignment.left_side.is_result then
					built_in_eq_neq ?= assignment.right_side
					if built_in_eq_neq /= Void then
						argument_name2 ?= built_in_eq_neq.left_side
						if argument_name2 /= Void and then argument_name2.rank = 1 then
							argument_name2 ?= built_in_eq_neq.right_side
							if argument_name2 /= Void and then argument_name2.rank = 2 then
								Result := smart_eiffel.get_inline_memo
								Result.set_expression(built_in_eq_neq.inline_with(args.expression(1), args.expression(2)))
							end
						end
					end
				end
			end
			if Result /= Void then
				smart_eiffel.magic_count_increment
			end
		end

feature {}
	new_run_feature_for (t: TYPE; fn: FEATURE_NAME): RUN_FEATURE_4 is
		do
			create Result.for(t.live_type, Current, fn)
		end

feature {ANY}
	accept (visitor: E_FUNCTION_VISITOR) is
		do
			visitor.visit_e_function(Current)
		end

feature {ANONYMOUS_FEATURE_MIXER}
	specialize_signature_in (new_type: TYPE): like Current is
		local
			args: like arguments
		do
			result_type.specialize_in(new_type)
			if arguments /= Void then
				args := arguments.specialize_in(new_type)
			end
			if args = arguments then
				Result := Current
			else
				Result := twin
				Result.set_arguments(args)
			end
		end

	specialize_signature_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
		local
			args: like arguments; rt: like result_type
		do
			rt := result_type.specialize_thru(parent_type, parent_edge, new_type)
			if arguments /= Void then
				args := arguments.specialize_thru(parent_type, parent_edge, new_type)
			end
			if result_type = rt and then args = arguments then
				Result := Current
			else
				Result := twin
				Result.set_arguments(args)
				Result.set_result_type(rt)
			end
		end

feature {E_FUNCTION}
	set_result_type (rt: like result_type) is
		require
			rt /= Void
		do
			result_type := rt
		end

feature {}
	make (fa: like arguments; rt: like result_type; om: like obsolete_mark; hc: like header_comment
		ra: like require_assertion; lv: like local_vars; rb: like routine_body) is
		require
			rt /= Void
		do
			make_effective_routine(fa, om, hc, ra, lv, rb)
			result_type := rt
		end

	try_to_undefine_aux (fn: FEATURE_NAME; bc: CLASS_TEXT): DEFERRED_ROUTINE is
		do
			create {DEFERRED_FUNCTION} Result.from_effective(fn, arguments, result_type, require_assertion, ensure_assertion, bc, permissions)
		end

	pretty_print_once_or_do (indent_level: INTEGER) is
		do
			pretty_printer.set_indent_level(indent_level)
			pretty_printer.keyword(once "do")
		end

	inline_call_1 (type: TYPE; call_1: CALL_1; target_type: TYPE; target: EXPRESSION; arg1: EXPRESSION): CALL_1 is
		require
			target /= Void
			arg1 /= Void
		local
			argument_name2: ARGUMENT_NAME2; call_0: CALL_0; call_1_arg1: CALL_1
		do
			argument_name2 ?= call_1.arg1
			if argument_name2 /= Void then
				-- The argument is passed as it is:
				if call_1.target.is_current then
					-- Simple "Result := Current.foo(arg1)" relay routine now replaced:
					Result := call_1.inline_with(target, arg1)
				else
					call_0 := left_most_current_direct_call_0_sequence(target_type, call_1.target)
					if call_0 /= Void then
						call_0 := left_most_current_direct_call_0_sequence_inline(type, call_0, target_type, target)
						-- Direct call on attribute now replaced:
						Result := call_1.inline_with(call_0, arg1)
					end
				end
			else
				call_1_arg1 ?= call_1.arg1
				if False and then call_1_arg1 /= Void and then call_1_arg1.arg1.is_static then
					--*** (PR 01/05/08) Sorry, it's too complex (and wrong 
					--as shown by test_fast_array6). We test here if the 
					--argument of the call is a call with a static 
					--argument! f(i*j+1), here 1 is static. Now, what is 
					--the possible inlining?
					--***Turned off with "if False"

					-- The modification on the argument can be inlined:
					call_0 := left_most_current_direct_call_0_sequence(target_type, call_1.target)
					if call_0 /= Void then
						call_0 := left_most_current_direct_call_0_sequence_inline(type, call_0, target_type, target)
						call_1_arg1 := call_1_arg1.inline_with(arg1, call_1_arg1.arg1)
						-- Direct call on attribute now replaced:
						Result := call_1.inline_with(call_0, call_1_arg1)
					end
				end
			end
		end

	inline_eq_neq1 (type: TYPE; built_in_eq_neq: BUILT_IN_EQ_NEQ; target_type: TYPE; target: EXPRESSION; arg1: EXPRESSION): BUILT_IN_EQ_NEQ is
		require
			target /= Void
			arg1 /= Void
		local
			argument_name2: ARGUMENT_NAME2; call_0: CALL_0; call_1: CALL_1
		do
			argument_name2 ?= built_in_eq_neq.right_side
			if argument_name2 /= Void then
				-- The argument is passed as it is:
				if built_in_eq_neq.left_side.is_current then
					-- Simple "Result := Current = arg1" now replaced:
					Result := built_in_eq_neq.inline_with(target, arg1)
				else
					call_0 := left_most_current_direct_call_0_sequence(target_type, built_in_eq_neq.left_side)
					if call_0 /= Void then
						call_0 := left_most_current_direct_call_0_sequence_inline(type, call_0, target_type, target)
						-- Direct call on attribute now replaced:
						Result := built_in_eq_neq.inline_with(call_0, arg1)
					end
				end
			else
				call_1 ?= built_in_eq_neq.right_side
				if call_1 /= Void and then call_1.arg1.is_static then
					-- The modification on the argument can be inlined:
					call_0 := left_most_current_direct_call_0_sequence(target_type, built_in_eq_neq.left_side)
					if call_0 /= Void then
						call_0 := left_most_current_direct_call_0_sequence_inline(type, call_0, target_type, target)
						call_1 := call_1.inline_with(arg1, call_1.arg1) -- Direct call on attribute now replaced:
						Result := built_in_eq_neq.inline_with(call_0, call_1)
					end
				end
			end
		end

	inline_eq_neq0 (type: TYPE; built_in_eq_neq: BUILT_IN_EQ_NEQ; target_type: TYPE; target: EXPRESSION): BUILT_IN_EQ_NEQ is
		do
			Result := inline_eq_neq0_(type, built_in_eq_neq, built_in_eq_neq.left_side, built_in_eq_neq.right_side, target_type, target)
			if Result = Void then
				Result := inline_eq_neq0_(type, built_in_eq_neq, built_in_eq_neq.right_side, built_in_eq_neq.left_side, target_type, target)
			end
		end

	inline_eq_neq0_ (type: TYPE; built_in_eq_neq: BUILT_IN_EQ_NEQ; e1, e2: EXPRESSION; target_type: TYPE; target: EXPRESSION): BUILT_IN_EQ_NEQ is
		local
			call_0: CALL_0
		do
			if e1.is_current then
				if e2.is_static then
					Result := built_in_eq_neq.inline_with(target, e2)
				end
			else
				call_0 := left_most_current_direct_call_0_sequence(target_type, e1)
				if call_0 /= Void then
					if e2.is_static then
						call_0 := left_most_current_direct_call_0_sequence_inline(type, call_0, target_type, target)
						Result := built_in_eq_neq.inline_with(call_0, e2)
					end
				else
					call_0 ?= e1
					if call_0 /= Void and then call_0.target.is_current then
						if e2.is_static then
							call_0 := call_0.inline_with(target)
							Result := built_in_eq_neq.inline_with(call_0, e2)
						end
					end
				end
			end
		end

end -- class E_FUNCTION
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
