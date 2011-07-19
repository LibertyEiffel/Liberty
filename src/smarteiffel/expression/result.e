-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RESULT
	--
	-- Handling of the pseudo variable `Result' (keep in mind that the
	-- `Result' variable can be inside a once function or inside an ordinary
	-- non-once function).
	--
	--|*** There are probably too many attributes in RESULT objects...
	--|*** (Dom feb 7th 2005) ***
	--

inherit
	EXPRESSION
		redefine written_declaration_type_mark
		end

creation {ANY}
	make

feature {ANY}
	start_position: POSITION

	is_result: BOOLEAN is True

	is_writable: BOOLEAN is True

	is_current: BOOLEAN is False

	is_implicit_current: BOOLEAN is False

	is_manifest_string: BOOLEAN is False

	is_void: BOOLEAN is False

	is_static: BOOLEAN is False

	use_current (type: TYPE): BOOLEAN is
		do
			check
				not Result
			end
		end

	extra_bracket_flag: BOOLEAN is False

	declaration_type: TYPE

	type_mark_memory: TYPE_MARK

	written_declaration_type_mark: TYPE_MARK

	resolve_in (type: TYPE): TYPE is
		do
			Result := type_mark_memory.resolve_in(type)
		end

	side_effect_free (type: TYPE): BOOLEAN is
		do
			Result := True
		end

	precedence: INTEGER is
		do
			Result := atomic_precedence
		end

	specialize_in (type: TYPE): like Current is
		local
			tmm: like type_mark_memory
		do
			tmm := feature_accumulator.current_mixer.result_type(type)
			check
				tmm /= Void
			end
			if type_mark_memory = Void then
				set_type_mark_memory(tmm)
			end
			if declaration_type = Void then
				declaration_type := tmm.declaration_type.type
				-- Note that it would not be clever to call `resolve_in' here because we are
				-- still in `specialize_in'.
			end
			Result := current_or_twin_init(tmm)
		end

	specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
		local
			tmm: like type_mark_memory
		do
			--|*** PH(14/04/04) Because some TYPE_MARK change in "specialize_thru". They
			--| should be all immutable (prototype should change).
			tmm := feature_accumulator.current_mixer.result_type(new_type)
			check
				tmm /= Void
			end
			Result := current_or_twin_init(tmm)
		end

	specialize_2 (type: TYPE): like Current is
		do
			Result := Current
		end

	has_been_specialized: BOOLEAN is
		do
			Result := type_mark_memory /= Void
		end

	compile_to_c (type: TYPE) is
		do
			if is_once_result then
				once_routine_pool.unique_result_in(cpp.pending_c_function_body, enclosing_function)
			else
				cpp.pending_c_function_body.extend('R')
			end
		end

	mapping_c_target (type, formal_target_type: TYPE) is
		do
			standard_mapping_c_target(type, formal_target_type)
		end

	safety_check (type: TYPE) is
		do
		end

	bracketed_pretty, pretty (indent_level: INTEGER) is
		do
			pretty_printer.put_string(once "Result")
		end

	pretty_target (indent_level: INTEGER) is
		do
			pretty_printer.put_string(once "Result.")
		end

	short (type: TYPE) is
		do
			short_printer.hook_or(as_result, as_result)
		end

	short_target (type: TYPE) is
		do
			short(type)
			short_printer.put_dot
		end

	non_void_no_dispatch_type (type: TYPE): TYPE is
		local
			rt: TYPE
		do
			rt := resolve_in(type)
			if rt.is_expanded then
				Result := rt
			end
		end

	simplify (type: TYPE): EXPRESSION is
		do
			Result := Current
		end

	mapping_c_arg (type: TYPE) is
		do
			compile_to_c(type)
		end

	compile_to_jvm (type: TYPE) is
		do
			not_yet_implemented
		end

	compile_target_to_jvm (type: TYPE) is
		do
			not_yet_implemented
		end

	jvm_branch_if_false (type: TYPE): INTEGER is
		do
			not_yet_implemented
		end

	jvm_branch_if_true (type: TYPE): INTEGER is
		do
			not_yet_implemented
		end

	jvm_assign_creation (type: TYPE) is
		do
			not_yet_implemented
		end

	jvm_assign (type: TYPE) is
		do
			not_yet_implemented
		end

	collect (type: TYPE): TYPE is
		do
			Result := smart_eiffel.context_feature.result_type.resolve_in(type)
		end

	adapt_for (type: TYPE): like Current is
		local
			af: ANONYMOUS_FEATURE
		do
			af := smart_eiffel.context_feature
			if enclosing_function = Void then
				set_enclosing_function(af)
				Result := Current
			elseif enclosing_function = af then
				Result := Current
			else
				Result := twin
				Result.set_enclosing_function(af)
			end
			Result.validity_check(type)
		end

	accept (visitor: RESULT_VISITOR) is
		do
			visitor.visit_result(Current)
		end

feature {CREATE_INSTRUCTION}
	is_once_result: BOOLEAN is
		require
			enclosing_function /= Void
		do
			Result := once_function /= Void
		end

feature {CREATE_SUPPORT}
	c_variable_name: STRING is
		require
			is_once_result
		do
			Result := once "...... buffer ......"
			Result.clear_count
			once_routine_pool.unique_result_in(Result, enclosing_function)
			Result := Result.twin
		end

feature {RESULT, IFTHEN, INTROSPECTION_HANDLER}
	set_type_mark_memory (tmm: like type_mark_memory) is
		require
			tmm /= Void
		do
			type_mark_memory := tmm
			if written_declaration_type_mark = Void then
				written_declaration_type_mark := tmm
			end
		ensure
			type_mark_memory = tmm
		end

feature {RESULT}
	validity_check (type: TYPE) is
		do
			if is_once_result and then not once_function.result_type.is_static then
				error_handler.add_position(start_position)
				smart_eiffel.vffd7_fatal_error(once_function.result_type.start_position)
			end
		end

	set_enclosing_function (ef: like enclosing_function) is
		require
			ef /= Void
		do
			enclosing_function := ef
         if once_function ?:= ef then
            once_function ::= ef
         end
		ensure
			enclosing_function = ef
		end

feature {CODE, EFFECTIVE_ARG_LIST}
	inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
		do
			code_accumulator.add_sedb(start_position, 'S')
			code_accumulator.current_context.add_last(Current)
		end

feature {}
	enclosing_function: ANONYMOUS_FEATURE
			-- The corresponding one which now contains this `Result' expression.

	once_function: ONCE_FUNCTION
			-- When not Void, an alias of `enclosing_function' (to avoid multiple assignment attempts).

	make (sp: like start_position) is
		require
			not sp.is_unknown
		do
			start_position := sp
		ensure
			start_position = sp
		end

	current_or_twin_init (tmm: like type_mark_memory): like Current is
		require
			tmm /= Void
		do
			if type_mark_memory = tmm then
				Result := Current
			else
				Result := twin
				Result.set_type_mark_memory(tmm)
			end
		ensure
			Result.type_mark_memory = tmm
		end

invariant
	not start_position.is_unknown

end -- class RESULT
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
