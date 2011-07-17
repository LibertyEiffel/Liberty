-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class WRITABLE_ATTRIBUTE_NAME
	--
	-- Used when it can be only a writable attribute according to the syntax:
	--    -- this is the left-hand side of an assignment,
	--    -- this is the writable of some create instruction.
	--

inherit
	EXPRESSION
		redefine written_declaration_type_mark
		end
	
insert
	NAME

creation {ANY}
	make
	
feature {ANY}
	feature_name: FEATURE_NAME
			-- The corresponding one.
	
	feature_stamp: FEATURE_STAMP
			-- The good feature_stamp for the feature in some type.

	start_position: POSITION is
		do
			Result := feature_name.start_position
		end

	to_string: STRING is
		do
			Result := feature_name.to_string
		end
	
	is_writable: BOOLEAN is True

	is_current: BOOLEAN is False

	is_implicit_current: BOOLEAN is False

	is_manifest_string: BOOLEAN is False

	is_result: BOOLEAN is False

	is_void: BOOLEAN is False

	side_effect_free (type: TYPE): BOOLEAN is
		do
			Result := True
		end

	precedence: INTEGER is
		do
			Result := atomic_precedence
		end

	use_current (type: TYPE): BOOLEAN is
		do
			Result := True
		end

	specialize_in (type: TYPE): like Current is
		local
			fs: like feature_stamp; type_mark: TYPE_MARK; dt: like declaration_type
		do
			fs := type.search(feature_name)
			if fs = Void then
				error_handler.add_position(start_position)
				error_handler.append("Attribute ")
				error_handler.add_expression(Current)
				error_handler.append(" not found in type ")
				error_handler.add_type(type)
				error_handler.append(".")
				error_handler.print_as_fatal_error
			end
			if feature_stamp = Void then
				feature_stamp := fs
			end
			type_mark := feature_accumulator.find_type_for(fs)
			if type_mark = Void then
				error_handler.add_position(start_position)
				error_handler.append("This feature name is not an expression (no result and not writable).")
				error_handler.print_as_fatal_error
			end
			dt := type_mark.resolve_in(type)
			if declaration_type = Void then
				declaration_type := dt
			end
			if feature_stamp = fs and then declaration_type = dt then
				Result := Current
			else
				Result := twin
				Result.set_feature_stamp_and_type(fs, dt)
			end
		end

	specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
		local
			fs: like feature_stamp
		do
			check
				feature_stamp /= Void
			end
			fs := feature_stamp.specialize_thru(parent_type, parent_edge, new_type)
			if fs /= feature_stamp then
				Result := twin
				Result.set_feature_stamp(fs)
			else
				Result := Current
			end
		end

	specialize_2 (type: TYPE): like Current is
		local
			anonymous_feature: ANONYMOUS_FEATURE; writable_attribute: WRITABLE_ATTRIBUTE
		do
			anonymous_feature := feature_stamp.anonymous_feature(type)
			if not writable_attribute ?:= anonymous_feature then
				error_handler.add_position(start_position)
				error_handler.append("Feature found is not writable (i.e. not an attribute).")
				error_handler.print_as_error
				if anonymous_feature = Void then
					error_handler.print_as_fatal_error
				end
				error_handler.append(" See also the next message for more information.")
				error_handler.print_as_error
				error_handler.add_position(anonymous_feature.start_position)
				error_handler.append("Here is the corresponding feature definition (not an attribute).")
				error_handler.print_as_fatal_error
			end
			written_declaration_type_mark := anonymous_feature.result_type
			Result := Current
		end

	has_been_specialized: BOOLEAN is
		do
			Result := feature_stamp /= Void and then declaration_type /= Void
		end

	adapt_for (t: TYPE): like Current is
		do
			Result := Current
		end

	non_void_no_dispatch_type (type: TYPE): TYPE is
		do
			-- There is probably better to do here, but actually, such
			-- object are not so common.
		end

	simplify (type: TYPE): EXPRESSION is
		do
			Result := Current
		end

	written_declaration_type_mark: TYPE_MARK

	declaration_type: TYPE

	resolve_in (type: TYPE): TYPE is
		do
			Result := feature_stamp.anonymous_feature(type).result_type.resolve_in(type)
		end

	safety_check (type: TYPE) is
		do
		end

	compile_to_c (type: TYPE) is
		local
			run_feature_2: RUN_FEATURE_2
		do
			cpp.pending_c_function_body.append(once "/*SFN*/(C->")
			run_feature_2 ::= feature_stamp.run_feature_for(type)
			run_feature_2.put_c_field_name
			cpp.pending_c_function_body.extend(')')
		end

	mapping_c_target (type, target_formal_type: TYPE) is
		do
			check
				-- Cannot be syntactically in target position. 
				False
			end
		end

	mapping_c_arg (type: TYPE) is
		do
			check
				-- Cannot be syntactically in target position. 
				False
			end
		end

	is_static: BOOLEAN is True

	pretty (indent_level: INTEGER) is
		do
			pretty_printer.put_string(to_string)
		end

	pretty_target (indent_level: INTEGER) is
		do
			check
				False
			end
		end

	short (type: TYPE) is
		local
			i: INTEGER; c: CHARACTER
		do
			short_printer.hook(once "Bsfn")
			from
				i := 1
			until
				i > to_string.count
			loop
				c := to_string.item(i)
				if c = '_' then
					short_printer.hook_or(once "Usfn", once "_")
				else
					short_printer.put_character(c)
				end
				i := i + 1
			end
			short_printer.hook(once "Asfn")
		end

	short_target (type: TYPE) is
		do
			check
				False
			end
		end

	jvm_assign_creation (type: TYPE) is
		local
			space, idx: INTEGER; run_feature_2: RUN_FEATURE_2; ca: like code_attribute
		do
			run_feature_2 ::= feature_stamp.run_feature_for(type)
			ca := code_attribute
			space := run_feature_2.result_type.jvm_stack_space
			ca.opcode_aload_0
			if space = 1 then
				ca.opcode_swap
			else
				ca.opcode_dup_x2
				ca.opcode_pop
			end
			idx := constant_pool.idx_fieldref(run_feature_2)
			ca.opcode_putfield(idx, - (space + 1))
		end

	jvm_assign (type: TYPE) is
		local
			space, idx: INTEGER; run_feature_2: RUN_FEATURE_2; ca: like code_attribute; wa: ARRAY[RUN_FEATURE_2]
			lt: LIVE_TYPE
		do
			run_feature_2 ::= feature_stamp.run_feature_for(type)
			ca := code_attribute
			space := run_feature_2.result_type.jvm_stack_space
			lt := run_feature_2.result_type.type.live_type
			if lt.name.to_string.has_substring(once "NATIVE_ARRAY") or else
				run_feature_2.result_type.is_kernel_expanded or else
				run_feature_2.result_type.is_reference
			 then
				ca.opcode_aload_0
				if space = 1 then
					ca.opcode_swap
				else
					ca.opcode_dup_x2
					ca.opcode_pop
				end
				idx := constant_pool.idx_fieldref(run_feature_2)
				ca.opcode_putfield(idx, - (space + 1))
			else
				ca.opcode_aload_0
				idx := constant_pool.idx_fieldref(run_feature_2)
				ca.opcode_getfield(idx, space - 1)
				ca.opcode_swap
				wa := lt.writable_attributes
				jvm.fields_by_fields_expanded_copy(wa)
				ca.opcode_pop2
			end
		end

	compile_target_to_jvm, compile_to_jvm (type: TYPE) is
		do
			error_handler.add_position(start_position)
			error_handler.append(fz_jvm_error)
			error_handler.print_as_fatal_error
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

	collect (type: TYPE): TYPE is
		do
			-- Register the feature as being alive:
			Result := smart_eiffel.collect(type, feature_stamp, False)
		end

	accept (visitor: WRITABLE_ATTRIBUTE_NAME_VISITOR) is
		do
			visitor.visit_writable_attribute_name(Current)
		end

feature {WRITABLE_ATTRIBUTE_NAME}
	set_feature_stamp (fs: like feature_stamp) is
		do
			feature_stamp := fs
		end

	set_feature_stamp_and_type (fs: like feature_stamp; dt: like declaration_type) is
		do
			feature_stamp := fs
			declaration_type := dt
		ensure
			feature_stamp = fs
			declaration_type = dt
		end

feature {CODE, EFFECTIVE_ARG_LIST}
	inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
		do
			code_accumulator.current_context.add_last(Current)
		end
	
feature {TYPE}
	make (hs: HASHED_STRING; sp: like start_position) is
		require
			hs /= Void
			not sp.is_unknown
		do
			create feature_name.ordinary_name(hs, sp)
		ensure
			feature_name.name = hs
			start_position = sp
		end

invariant
	feature_name.is_simple_feature_name

end -- class WRITABLE_ATTRIBUTE_NAME
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
