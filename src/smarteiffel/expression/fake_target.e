-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class FAKE_TARGET
	--
	-- This pseudo expression is used to simulate some target EXPRESSION of some static known TYPE.
	-- The FAKE_TARGET is used in the following situations:
	--    - for the target of a "create" expression with some explicit static type,
	--    - for the canonical form of a MANIFEST_TUPLE (which is a "create" expression),
	--    - and for the target of some CECIL calls.
	--

inherit
	EXPRESSION

creation {EIFFEL_PARSER, MANIFEST_TUPLE, CREATE_EXPRESSION, CECIL_ENTRY}
	make

feature {ANY}
	start_position: POSITION
			-- Of the opening curly bracket.
	
	explicit_type_mark: TYPE_MARK
			-- The written one between curly brackets.
	
	is_current, is_implicit_current: BOOLEAN is False

	is_writable: BOOLEAN is False

	is_static: BOOLEAN is False

	is_manifest_string: BOOLEAN is False

	is_result: BOOLEAN is False

	is_void: BOOLEAN is False

	use_current (type: TYPE): BOOLEAN is
		do
		end

	extra_bracket_flag: BOOLEAN is False

	precedence: INTEGER is
		do
			Result := atomic_precedence
		end

	safety_check (type: TYPE) is
		do
		end

	specialize_in (type: TYPE): like Current is
		do
			explicit_type_mark.specialize_in(type)
			Result := Current
		end

	specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
		do
			Result := current_or_twin_init(explicit_type_mark.specialize_thru(parent_type, parent_edge, new_type))
		end

	specialize_2 (type: TYPE): like Current is
		do
			Result := Current
		end

	side_effect_free (type: TYPE): BOOLEAN is
		do
			Result := True
		end

	adapt_for (type: TYPE): like Current is
		do
			Result := current_or_twin_init(explicit_type_mark.to_static(type))
		end

	has_been_specialized: BOOLEAN is
		do
			Result := explicit_type_mark.has_been_specialized
		end

	collect (type: TYPE): TYPE is
		do
			Result := resolve_in(type)
		end

	resolve_in (type: TYPE): TYPE is
		do
			Result := explicit_type_mark.resolve_in(type)
		end

	declaration_type: TYPE is
		local
			type: TYPE
		do
			if declaration_type_memory = Void then
				if explicit_type_mark.is_static then
					declaration_type_memory := explicit_type_mark.type
				else
					type := start_position.class_text.declaration_type_of_like_current
					declaration_type_memory := explicit_type_mark.resolve_in(type)
				end
			end
			Result := declaration_type_memory
		end

	non_void_no_dispatch_type (type: TYPE): TYPE is
		do
			--|*** To be done. *** (Dom. june 18th 2004) ***
		end

	simplify (type: TYPE): FAKE_TARGET is
		do
			Result := Current
		end

	compile_to_c (type: TYPE) is
		do
			cpp.pending_c_function_body.extend('C')
		end

	mapping_c_target (type, target_formal_type: TYPE) is
		do
			standard_mapping_c_target(type, target_formal_type)
		end
	
	mapping_c_arg (type: TYPE) is
		do
			check
				-- Not a fake argument:
				False
			end
		end

	compile_to_jvm (type: TYPE) is
		do
			explicit_type_mark.jvm_push_local(0)
		end

	compile_target_to_jvm (type: TYPE) is
		do
			compile_to_jvm(type)
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

	jvm_assign_creation, jvm_assign (type: TYPE) is
		do
			check
				False
			end
		end

	pretty_target (indent_level: INTEGER) is
		do
			pretty(indent_level)
			pretty_printer.put_character('.')
		end
	
	pretty, bracketed_pretty (indent_level: INTEGER) is
		do
			pretty_printer.put_character('{')
			pretty_printer.put_type_mark(explicit_type_mark)
			pretty_printer.put_character('}')
		end

	short (type: TYPE) is
		do
			short_printer.hook_or(once "open_curly_bracket", once "{")
			explicit_type_mark.short(type)
			short_printer.hook_or(once "close_curly_bracket", once "}")
			short_printer.hook_or(once "dot", once ".")
		end

	short_target (type: TYPE) is
		do
		end

	accept (visitor: FAKE_TARGET_VISITOR) is
		do
			visitor.visit_fake_target(Current)
		end

feature {FAKE_TARGET}
	init (etm: like explicit_type_mark) is
		require
			etm /= Void
		do
			explicit_type_mark := etm
		ensure
			explicit_type_mark = etm
		end

feature {CODE, EFFECTIVE_ARG_LIST}
	inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
		do
			code_accumulator.current_context.add_last(Current)			
		end
	
feature {}
	declaration_type_memory: TYPE
	
	make (sp: like start_position; etm: like explicit_type_mark) is
		require
			etm /= Void
		do
			start_position := sp
			explicit_type_mark := etm
		ensure
			explicit_type_mark = etm
		end

	current_or_twin_init (etm: like explicit_type_mark): like Current is
		require
			etm /= Void
		do
			if etm = explicit_type_mark then
				Result := Current
			else
				Result := twin
				Result.init(etm)
			end
		ensure
			Result.explicit_type_mark = etm
		end

invariant
	explicit_type_mark /= Void

end -- class FAKE_TARGET
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
