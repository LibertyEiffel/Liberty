-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class ABSTRACT_CURRENT
	--
	-- Handling of the pseudo variable "Current".
	--

inherit
	EXPRESSION
	
feature {ANY}
	start_position: POSITION

	is_current: BOOLEAN is True

	is_writable: BOOLEAN is False

	is_manifest_string: BOOLEAN is False

	is_static: BOOLEAN is False

	is_result: BOOLEAN is False

	is_void: BOOLEAN is False

	extra_bracket_flag: BOOLEAN is False

	declaration_type: TYPE

	to_string, to_key: STRING is
		do
			Result := as_current
		end

	frozen use_current (type: TYPE): BOOLEAN is
		do
			Result := True
		end
	
	frozen safety_check (type: TYPE) is
		do
		end

	frozen mapping_c_target (type, target_formal_type: TYPE) is
		local
			class_invariant_flag: INTEGER
		do
			if is_written then
				class_invariant_flag := cpp.class_invariant_call_opening(target_formal_type, False)
			end
			cpp.print_current
			if class_invariant_flag > 0 then
				cpp.class_invariant_call_closing(class_invariant_flag, False)
			end
		end

	frozen mapping_c_arg (type: TYPE) is
		do
			if type.is_reference then
				cpp.pending_c_function_body.append(once "(T0*)")
				cpp.print_current
			else
				if type.is_user_expanded then
					if not type.is_empty_expanded then
						cpp.pending_c_function_body.extend('*')
					end
				end
				cpp.print_current
			end
		end

	frozen compile_to_c (type: TYPE) is
		do
			if type.is_user_expanded and then not type.is_empty_expanded then
				cpp.pending_c_function_body.extend('*')
			end
			cpp.print_current
		end

	frozen compile_to_jvm (type: TYPE) is
		do
			type.canonical_type_mark.jvm_push_local(0)
		end

	frozen compile_target_to_jvm (type: TYPE) is
		do
			if is_written then
				standard_compile_target_to_jvm(type)
			else
				compile_to_jvm(type)
			end
		end

	frozen jvm_branch_if_false (type: TYPE): INTEGER is
		do
			compile_to_jvm(type)
			Result := code_attribute.opcode_ifeq
		end

	frozen jvm_branch_if_true (type: TYPE): INTEGER is
		do
			compile_to_jvm(type)
			Result := code_attribute.opcode_ifne
		end

	specialize_in (type: TYPE): like Current is
		do
			if declaration_type = Void then
				declaration_type := start_position.class_text.declaration_type_of_like_current
			end
			check
				(not declaration_type_forced) implies declaration_type = start_position.class_text.declaration_type_of_like_current
			end
			Result := Current
		end

	specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
		do
			Result := Current
		end

	specialize_2 (type: TYPE): like Current is
		do
			Result := Current
		end

	has_been_specialized: BOOLEAN is
		do
			Result := declaration_type /= Void
		end

	frozen side_effect_free (type: TYPE): BOOLEAN is
		do
			Result := True
		end

	frozen adapt_for (type: TYPE): like Current is
		do
			Result := Current
		end

	frozen non_void_no_dispatch_type (type: TYPE): TYPE is
		do
			if type.live_type /= Void then
				Result := type
			end
		end

	frozen simplify (type: TYPE): ABSTRACT_CURRENT is
		do
			Result := Current
		end

	frozen precedence: INTEGER is
		do
			Result := atomic_precedence
		end

	frozen bracketed_pretty, frozen pretty (indent_level: INTEGER) is
		do
			pretty_printer.put_string(once "Current")
		end

	frozen pretty_target (indent_level: INTEGER) is
		do
			if is_written then
				pretty_printer.put_string(once "Current.")
			end
		end

	frozen short (type: TYPE) is
		do
			short_printer.hook_or(as_current, as_current)
		end

	frozen short_target (type: TYPE) is
		do
			if is_written then
				short(type)
				short_printer.put_dot
			end
		end

	frozen jvm_assign_creation, jvm_assign (type: TYPE) is
		do
			check
				False
			end
		end

	frozen resolve_in (type: TYPE): TYPE is
		do
			Result := type
		end

	frozen collect (type: TYPE): TYPE is
		do
			Result := type
		end

feature {}
	is_written: BOOLEAN is
			-- True when it is a really written Current.
		deferred
		end

	make (sp: like start_position) is
		require
			not sp.is_unknown
		do
			start_position := sp
		ensure
			start_position = sp
		end

	declaration_type_forced: BOOLEAN

	set_type_forced: BOOLEAN is
		do
			Result := declaration_type = Void
			declaration_type_forced := True
		end

feature {INTROSPECTION_HANDLER}
	force_declaration_type (dt: like declaration_type) is
		do
			check
				set_type_forced
			end
			declaration_type := dt
		end

feature {CODE, EFFECTIVE_ARG_LIST}
	inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
		do
			code_accumulator.current_context.add_last(Current)
		end

invariant
	not start_position.is_unknown

end -- class ABSTRACT_CURRENT
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
