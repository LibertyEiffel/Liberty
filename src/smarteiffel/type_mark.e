-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class TYPE_MARK
	--
	-- Handling of an Eiffel type mark.
	--
	-- Handling of Eiffel kernel classes:
	--
	--      Type Mark         |            Handled by Class
	--      -----------------------------------------------
	--      BOOLEAN           |           BOOLEAN_TYPE_MARK
	--      CHARACTER         |         CHARACTER_TYPE_MARK
	--      INTEGER_8         |           INTEGER_TYPE_MARK
	--      INTEGER_16        |           INTEGER_TYPE_MARK
	--      INTEGER_32        |           INTEGER_TYPE_MARK
	--      INTEGER           |           INTEGER_TYPE_MARK
	--      INTEGER_64        |           INTEGER_TYPE_MARK
	--      REAL_32           |              REAL_TYPE_MARK
	--      REAL_64           |              REAL_TYPE_MARK
	--      REAL              |              REAL_TYPE_MARK
	--      REAL_80           |              REAL_TYPE_MARK
	--      POINTER           |           POINTER_TYPE_MARK
	--      ANY               |               ANY_TYPE_MARK
	--      STRING            |            STRING_TYPE_MARK
	--      ARRAY[FOO]        |             ARRAY_TYPE_MARK
	--      NATIVE_ARRAY[BAR] |      NATIVE_ARRAY_TYPE_MARK
	--      TUPLE             |       EMPTY_TUPLE_TYPE_MARK
	--      TUPLE[FOO]        |   NON_EMPTY_TUPLE_TYPE_MARK
	--      ROUTINE ...       |             AGENT_TYPE_MARK
	--      PROCEDURE ...     |             AGENT_TYPE_MARK
	--      FUNCTION ...      |             AGENT_TYPE_MARK
	--      PREDICATE ...     |             AGENT_TYPE_MARK
	--
	-- Handling of other classes (excluding previous types):
	--
	-- *CLASS_TYPE_MARK: when the original type mark is not generic, not outside
	-- expanded and it is not a formal generic argument. Thus, this is
	-- the most common case.
	-- *FORMAL_GENERIC_TYPE_MARK: when original declaration type mark is a formal
	-- generic argument.
	-- *USER_GENERIC_TYPE_MARK: when original type has generic argument (excluding ARRAY,
	-- NATIVE_ARRAY and AGENT_TYPE_MARK as explained previously) and is not outside
	-- expanded.
	-- *LIKE_CURRENT_TYPE_MARK: when the written type mark is "like Current"
	-- *LIKE_FEATURE_TYPE_MARK: when the written type mark is "like <feature>"
	-- *LIKE_ARGUMENT_TYPE_MARK: when the written type mark "like <argument>"
	--

inherit
	VISITABLE

insert
	GLOBALS

feature {ANY}
	start_position: POSITION is
			-- The POSITION of the first character of the `Current' type mark where it is originally
			-- written. Note that, even if `has_been_specialized' is True, the `Result' is the POSITION of the
			-- originally written type mark (and not the position of the resolved type mark (when internally
			-- memorized). Finally, In some very rare cases, the `Result' can be an `is_unknown' POSITION.
		deferred
		end

	is_static: BOOLEAN is
			-- An `is_static' type mark is a completely frozen one that cannot change because of inheritance or
			-- because of some different generic derivation.
			--
			-- Here are some examples of `is_static' type marks: "STRING", "ARRAY[STRING]", "COLLECTION[INTEGER]",
			-- "ANY", INTEGER_8, etc.
			--
			-- Assuming that E_ is a formal generic argument, here are some examples of non static
			-- (i.e.`is_static' yields False) type marks: "E_", "ARRAY[E_]", "DICTIONARY[STRING,E_]". Also, are
			-- non-static the following marks: "like Current", "like foo", etc.
		deferred
		end

	declaration_type: TYPE_MARK is
			-- For TYPE_MARKs for which the `is_static' predicate is True, the `Result' is obviously `Current'
			-- (e.g. "STRING" is the `declaration_type' of "STRING" and, as another example, "ARRAY[INTEGER]" is
			-- the `declaration_type' of "ARRAY[INTEGER]").
			--
			-- For "like Current" the `declaration_type' is "STRING" only and only if "like Current" is written
			-- in the "string.e" file. When there is no generic constraint, formal generic arguments are replaced
			-- with "ANY" (as an example, "ANY" is the `declaration_type' of "E_" when "E_" is written in class
			-- "array.e"). In case of a generic constraint, this generic constraint is used in place of "ANY" for
			-- formal generic argument (as an example, the `declaration_type' of a "HASHED_DICTIONARY[V_,K_]" type
			-- mark written inside class "hashed_dictionary.e" is "HASHED_DICTIONARY[ANY,HASHABLE]").
			--
			-- Note that the `declaration_type' of a TYPE_MARK can change during `specialize_thru'.
		deferred
		ensure
			is_static implies Result = Current
			Result = Result.declaration_type
			-- Result.is_static unless it involves like argument
		end

	written_name: HASHED_STRING is
			-- The TYPE_MARK as it is actually written in the source file (i.e. what can be seen at the corresponding
			-- `start_position' in the source file).
		deferred
		ensure
			Result /= Void
		end

	frozen written_mark: STRING is
			-- A short-hand for `written_name.to_string'.
		do
			Result := written_name.to_string
		ensure
			Result = written_name.to_string
		end

	specialize_in (new_type: TYPE) is
			-- As checked in the require assertion, `Current' is written in new_type's base class.
		require
			start_position.class_text = new_type.class_text
		deferred
		ensure
			Current.has_been_specialized
		end

	specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): TYPE_MARK is
		require
			has_been_specialized
			start_position.class_text /= new_type.class_text
			new_type.direct_thru_step(parent_type, parent_edge)
		deferred
		ensure
			has_been_specialized
			is_static implies Result = Current
			Result.has_been_specialized
		end

	resolve_in (new_type: TYPE): TYPE is
			-- Short-hand for `to_static(new_type).type'
		require
			has_been_specialized
		do
			Result := to_static(new_type).type
		ensure
			Result = to_static(new_type).type
		end

	to_static (new_type: TYPE): TYPE_MARK is
			-- Compute the `is_static' one in the `new_type' context.
			-- (See also `resolve_in'.)
		require
			has_been_specialized
		deferred
		ensure
			Result.is_static
			is_static implies Result = Current
		end

	signature_resolve_in (new_type: TYPE): TYPE is
			-- Same work as `resolve_in', but all possible "insert" paths are just ignored.
			-- Actually, this is used mostly to check the validity of inherited signatures, hence the
			-- `signature_resolve_in' name.
		require
			has_been_specialized
		deferred
		ensure
			Result /= Void
		end

	has_been_specialized: BOOLEAN is
		deferred
		ensure
			assertion_check_only: Result
		end

feature {ANY} -- Others:
	frozen is_formal_generic: BOOLEAN is
			-- Is it a formal generic argument?
		do
			-- (The definition is not deferred because this predicate works only on the written type mark.)
			Result := {FORMAL_GENERIC_TYPE_MARK} ?:= Current
		ensure
			Result = {FORMAL_GENERIC_TYPE_MARK} ?:= Current
		end

	is_reference: BOOLEAN is
			-- Is a a reference type mark?
		require
			is_static
		deferred
		ensure
			Result = not is_expanded
		end

	is_expanded: BOOLEAN is
		require
			is_static
		deferred
		ensure
			Result = not is_reference
			Result = (is_kernel_expanded xor is_user_expanded xor is_native_array)
		end

	frozen is_anchored: BOOLEAN is
			-- Is it written "like ..." ?
		do
			Result := {ANCHORED_TYPE_MARK} ?:= Current
		ensure
			Result = {ANCHORED_TYPE_MARK} ?:= Current
		end

	frozen is_like_current: BOOLEAN is
			-- Is it written "like Current" ?
		do
			-- (The definition is not deferred because this predicate works only on the written type mark.)
			Result := {LIKE_CURRENT_TYPE_MARK} ?:= Current
		ensure
			Result = {LIKE_CURRENT_TYPE_MARK} ?:= Current
			Result implies is_anchored
		end

	is_generic: BOOLEAN is
			-- Is the written type a generic type?
		require
			is_static
		deferred
		ensure
			is_array implies Result
		end

	generic_list: ARRAY[TYPE_MARK] is
		require
			is_generic
		deferred
		ensure
			Result.lower = 1
			not Result.is_empty
		end

	frozen is_kernel_expanded: BOOLEAN is
			-- Is it written one of: "BOOLEAN", "CHARACTER", "INTEGER", "INTEGER_8", "INTEGER_16",
			-- "INTEGER_32", "INTEGER_64", "NATURAL_8", "NATURAL_16", "NATURAL_32", "NATURAL_64", 
			-- "REAL_32", "REAL_64", "REAL", "REAL_80", "POINTER".
		do
			if is_boolean then
				Result := True
			elseif is_character then
				Result := True
			elseif is_real then
				Result := True
			elseif is_pointer then
				Result := True
			elseif is_integer then
				Result := True
			elseif is_natural then
				Result := True
			end
		ensure
			Result = (is_boolean or is_character or is_integer or is_real or is_pointer or is_natural)
		end

	frozen is_boolean: BOOLEAN is
			-- Is it written "BOOLEAN"?
		do
			-- (The definition is not deferred because this predicate works only on the written type mark.)
			Result := {BOOLEAN_TYPE_MARK} ?:= Current
		ensure
			Result = {BOOLEAN_TYPE_MARK} ?:= Current
			Result implies is_expanded
		end

	frozen is_character: BOOLEAN is
			-- Is it written "CHARACTER"?
		do
			-- (The definition is not deferred because this predicate works only on the written type mark.)
			Result := {CHARACTER_TYPE_MARK} ?:= Current
		ensure
			Result = {CHARACTER_TYPE_MARK} ?:= Current
			Result implies is_expanded
		end

	frozen is_integer: BOOLEAN is
			-- Is it written "INTEGER_8", "INTEGER_16", "INTEGER_32", "INTEGER_64" or "INTEGER"?
		do
			-- (The definition is not deferred because this predicate works only on the written type mark.)
			Result := {INTEGER_TYPE_MARK} ?:= Current
		ensure
			Result = {INTEGER_TYPE_MARK} ?:= Current
			Result implies is_expanded
		end

	frozen is_real: BOOLEAN is
			-- Is it written "REAL*"?
		do
			-- (The definition is not deferred because this predicate works only on the written type mark.)
			Result := {REAL_TYPE_MARK} ?:= Current
		ensure
			Result = {REAL_TYPE_MARK} ?:= Current
			Result implies is_expanded
		end

	frozen is_pointer: BOOLEAN is
			-- Is it written "POINTER"?
		do
			-- (The definition is not deferred because this predicate works only on the written type mark.)
			Result := {POINTER_TYPE_MARK} ?:= Current
		ensure
			Result = {POINTER_TYPE_MARK} ?:= Current
			Result implies is_expanded
		end

	is_tuple: BOOLEAN is
			-- Is it written "TUPLE" or "TUPLE[...]"?
		do
		ensure
			Result = (once "EMPTY_TUPLE_TYPE_MARK").is_equal(generating_type) or else (once "NON_EMPTY_TUPLE_TYPE_MARK").is_equal(generating_type)
			Result implies is_reference
		end

	frozen is_string: BOOLEAN is
			-- Is it written "STRING"?
		do
			-- (The definition is not deferred because this predicate works only on the written type mark.)
			Result := {STRING_TYPE_MARK} ?:= Current
		ensure
			Result = {STRING_TYPE_MARK} ?:= Current
			Result implies is_reference
		end

	frozen is_fixed_string: BOOLEAN is
			-- Is it written "FIXED_STRING"?
		do
			Result := written_name = string_aliaser.hashed_string(once "FIXED_STRING")
		ensure
			Result implies is_reference
		end

	frozen is_array: BOOLEAN is
			-- Is it written "ARRAY"?
		do
			-- (The definition is not deferred because this predicate works only on the written type mark.)
			Result := {ARRAY_TYPE_MARK} ?:= Current
		ensure
			Result = {ARRAY_TYPE_MARK} ?:= Current
			Result implies is_reference
		end

	frozen is_any: BOOLEAN is
			-- Is it written "ANY"?
		do
			-- (The definition is not deferred because this predicate works only on the written type mark.)
			Result := {ANY_TYPE_MARK} ?:= Current
		ensure
			Result = {ANY_TYPE_MARK} ?:= Current
			Result implies is_reference
		end

	frozen is_native_array: BOOLEAN is
			-- Is it written "NATIVE_ARRAY[...]"?
		do
			Result := {NATIVE_ARRAY_TYPE_MARK} ?:= Current
		ensure
			Result = {NATIVE_ARRAY_TYPE_MARK} ?:= Current
		end

	frozen is_agent: BOOLEAN is
			-- Is the writtent type mark some agent type mark ("ROUTINE[...]", "PROCEDURE[...]", "FUNCTION[...]" or
			-- "PREDICATE[...]")?
		do
			Result := {AGENT_TYPE_MARK} ?:= Current
		ensure
			Result = {AGENT_TYPE_MARK} ?:= Current
			Result implies is_reference
		end

	frozen is_natural: BOOLEAN is
			-- Is it written "NATURAL_8", "NATURAL_16", "NATURAL_32" or "NATURAL_64"?
		do
			-- (The definition is not deferred because this predicate works only on the written type mark.)
			Result := {NATURAL_TYPE_MARK} ?:= Current
		ensure
			Result implies is_expanded
		end

	pretty_in (buffer: STRING) is
		do
			buffer.append(written_mark)
		end

	frozen short (shorted_type: TYPE) is
		require
			shorted_type /= Void
		do
			short_printer.hook(once "Btm")
			short_(shorted_type)
			short_printer.hook(once "Atm")
		end

	default_expression (sp: POSITION): EXPRESSION is
			-- Creates the corresponding ANY `default' expression at `sp'.
		require
			is_static
		do
			if is_reference then
				create {E_VOID} Result.make(sp)
			else
				check
					is_user_expanded
				end
				create {CREATE_EXPRESSION} Result.default_user_expanded(sp, Current)
			end
		ensure
			Result /= Void
		end

	c_type_for_argument_in (buffer: STRING) is
			-- Append in `buffer' the C type to use when current Eiffel type is used for an argument of a
			-- feature.
		require
			is_static
			buffer /= Void
		deferred
		end

	c_type_for_target_in (buffer: STRING) is
			-- Append in `buffer' the C type to use when current Eiffel type is used for the target of a feature.
		require
			is_static
			buffer /= Void
		deferred
		end

	c_type_for_result_in (buffer: STRING) is
			-- Append in `buffer' the C type to use when current Eiffel type is used as a result type of a C
			-- function.
		require
			is_static
			buffer /= Void
		deferred
		end

	frozen c_type_for_external_in (buffer: STRING) is
		require
			is_static
			buffer /= Void
		do
			if is_reference then
				buffer.append(once "void*")
			else
				c_type_for_result_in(buffer)
			end
		end

	need_c_struct: BOOLEAN is
			-- Is it necessary to define a C struct ?
		require
			smart_eiffel.is_ready
			is_static
		deferred
		end

	c_initialize_in (buffer: STRING) is
			-- Append in `buffer' C code for initialisation of local variables or attributes (see also
			-- `c_initialize').
		require
			is_static
			buffer /= Void
		deferred
		end

	frozen c_frame_descriptor_in (buffer: STRING) is
			-- Update `c_frame_descriptor_format' accordingly.
		require
			is_static
			buffer /= Void
		local
			lt: LIVE_TYPE
		do
			buffer.extend('%%')
			if is_reference then
				lt := type.live_type
				buffer.extend('R')
				if lt = Void then
					buffer.extend('0')
				else
					lt.id.append_in(buffer)
				end
			else
				buffer.extend('E')
				id.append_in(buffer)
			end
			buffer.extend('%%')
		end

feature {TYPE}
	need_gc_mark_function (current_type: TYPE): BOOLEAN is
		require
			is_static
			current_type.canonical_type_mark = Current
		deferred
		end

feature {TYPE, LIVE_TYPE, TYPE_MARK}
	id: INTEGER is
			-- Used for example to mangle feature name in the generated C code.
		require
			is_static
		deferred
		ensure
			Result > 0
		end

feature {TYPE_MARK}
	short_ (shorted_type: TYPE) is
		require
			shorted_type /= Void
		deferred
		end

	set_start_position (sp: like start_position) is
		deferred
		ensure
			start_position = sp
		end

feature {TYPE_MARK, GENERIC_TYPE_MARK}
	frozen at (sp: like start_position): like Current is
		require
			is_static
		do
			if start_position /= sp then
				Result := twin
				Result.set_start_position(sp)
			else
				Result := Current
			end
		ensure
			Result.start_position = sp
		end

feature {INTROSPECTION_HANDLER}
	typed_internals_type_mark (position: POSITION): TYPE_MARK is
		local
			tm: TYPE_MARK
			hs: HASHED_STRING
			cn: CLASS_NAME
			gl: ARRAY[TYPE_MARK]
		do
			hs := string_aliaser.hashed_string(as_typed_internals)
			tm := at(position)
			create cn.make(hs, position)
			gl := {ARRAY[TYPE_MARK] 1, <<tm>>}
			create {USER_GENERIC_TYPE_MARK} Result.make(cn, gl)
		end

feature {}
	class_text_memory: CLASS_TEXT
			-- Memory cache for `class_text'.

	long_name_memory: like long_name

	canonical_long_name: HASHED_STRING is
		do
			Result := long_name_memory
			if Result = Void then
				Result := smart_eiffel.long_type_name(class_text_name.hashed_name, class_text.cluster)
				long_name_memory := Result
			end
		end

feature {TYPE, TYPE_MARK, SMART_EIFFEL}
	long_name: HASHED_STRING is
			-- This name embeds cluster information for type unicity.  Normally uses `canonical_long_name' which
			-- uses location info such as `class_text' and `class_text_name'.
		require
			is_static
		deferred
		ensure
			Result /= Void
		end

feature {ANY}
	class_text_name: CLASS_NAME is
			-- The one of the corresponding base class (not the name of the one where it is written!).
		require
			is_static
		deferred
		ensure
			fatal_error_when_not_found: Result /= Void
		end

	class_text: CLASS_TEXT is
			-- The one of the corresponding base class (not the name of the one where it is written!).
		require
			not is_anchored
		local
			bcn: CLASS_NAME
		do
			if class_text_memory /= Void then
				Result := class_text_memory
			else
				bcn := class_text_name
				if bcn /= Void then
					Result := bcn.class_text
					class_text_memory := Result
				else
					error_handler.append("Cannot find Base Class for ")
					error_handler.add_position(start_position)
					error_handler.add_type_mark(Current)
					error_handler.append(".")
					error_handler.print_as_fatal_error
				end
			end
		ensure
			Result = class_text_name.class_text
		end

	frozen debug_info_in (buffer: STRING) is
			-- For debugging only.
		do
			buffer.append(written_mark)
		end

	type: TYPE is
		require
			is_static
		deferred
		ensure
			Result /= Void
		end

	is_user_expanded: BOOLEAN is
			-- Is it really a user expanded type ?
		require
			is_static
		deferred
		ensure
			Result = (is_expanded and not (is_kernel_expanded xor is_native_array))
		end

	is_empty_expanded: BOOLEAN is
			-- True when is it a user's expanded type with no attribute.
		require
			is_static
			smart_eiffel.status.collecting_done
		deferred
		end

feature {LIVE_TYPE}
	gc_define1 is
			-- Define prototypes and C struct for the Garbage Collector
		require
			not gc_handler.is_off
			type.live_type.at_run_time
		deferred
		end

	gc_define2 is
			-- Define C functions for the Garbage Collector
		require
			not gc_handler.is_off
			type.live_type.at_run_time
		deferred
		end

	gc_info_in (buffer: STRING) is
			-- Produce C code to print GC information.
		require
			not gc_handler.is_off
			gc_handler.info_flag
			type.live_type.at_run_time
		deferred
		end

	just_before_gc_mark_in (buffer: STRING) is
		require
			not gc_handler.is_off
			type.live_type.at_run_time
		deferred
		end

feature {}
	standard_just_before_gc_mark_in (buffer: STRING) is
		require
			not gc_handler.is_off
			type.live_type.at_run_time
		do
			gc_free_in(buffer)
			buffer.append(once "=(void*)0;%N")
		end

feature {NATIVE_BUILT_IN, GC_HANDLER}
	gc_call_new_in (buffer: STRING) is
		do
			buffer.append(once "new")
			id.append_in(buffer)
			buffer.append(once "()")
		end

feature {ANY}
	jvm_method_flags: INTEGER is
			-- Return the appropriate flag (static/virtual) when the receiver has this type.
		deferred
		end

	frozen jvm_stack_space: INTEGER is
		require
			is_static
		local
			integer_type_mark: INTEGER_TYPE_MARK; real_type_mark: REAL_TYPE_MARK
		do
			if is_real then
				real_type_mark ::= Current
            sedb_breakpoint
            std_error.put_string("[
               Sorry. Due to some JVM specifications, REAL* usage is currently disabled.
               Indeed the JVM stack can not handle REAL_80 and REAL_128 because they are expanded
               and need more than two 32-bit words. We will fix this problem as soon as possible.

                                                       The SmartEiffel team.
                                                e-mail: SmartEiffel@loria.fr
                                                 http://SmartEiffel.loria.fr

            ]")
            crash
			elseif is_integer then
				integer_type_mark ?= Current
				if integer_type_mark.bit_count = 64 then
					Result := 2
				else
					Result := 1
				end
			else
				Result := 1
			end
		ensure
			Result.in_range(1, 2)
		end

	jvm_descriptor_in (buffer: STRING) is
			-- Append in `buffer' the appropriate JVM type descriptor for arguments and Result of a method.
		require
			buffer /= Void
		deferred
		end

	jvm_target_descriptor_in (buffer: STRING) is
			-- Append in `buffer' the appropriate JVM type descriptor for the target only.
		require
			buffer /= Void
			type.live_type.at_run_time
		deferred
		end

	jvm_return_code is
			-- Add the good JVM opcode to return Result.
		deferred
		end

	jvm_push_local (offset: INTEGER) is
			-- Push value of the local variable at `offset'.
		deferred
		end

	jvm_push_default: INTEGER is
			-- Push the default value for the Current type.
			-- Result gives the space in the JVM stack
		deferred
		end

	jvm_write_local_creation, jvm_write_local (offset: INTEGER) is
			-- Write the local variable at `offset' using the stack top.
		deferred
		end

	jvm_check_class_invariant is
			-- If needed, add some byte code to check the class invariant of the pushed object.
		deferred
		end

	jvm_xnewarray is
			-- Produce the appropriate byte-code to create a new JVM array with elements of `Current' type.
			-- Assume the count of the new array to create is already pushed.
		deferred
		end

	jvm_xastore is
		deferred
		end

	jvm_xaload is
		deferred
		end

	jvm_if_x_eq: INTEGER is
			-- Assume two operands of the same type are pushed.
		deferred
		end

	jvm_if_x_ne: INTEGER is
			-- Assume two operands of the same type are pushed.
		deferred
		end

	jvm_standard_is_equal is
			-- Produce byte-code for `standard_is_equal' for the top objects pair.
		deferred
		end

feature {}
	frozen standard_jvm_check_class_invariant is
		do
			not_yet_implemented
		end

feature {LIVE_TYPE}
	frozen id_extra_information (tfw: TEXT_FILE_WRITE) is
		require
			is_static
		do
			tfw.put_string(once "reference: ")
			if is_reference then
				tfw.put_string(once "yes")
			else
				tfw.put_string(once "no")
			end
			tfw.put_character('%N')
		end

feature {}
	frozen standard_gc_info_in (buffer: STRING) is
		require
			is_static
		do
			buffer.append(once ";%Nif(")
			gc_info_nb_in(buffer)
			buffer.append(once ")%Nfprintf(SE_GCINFO,%"%%d\t%%d\t%%d\t")
			buffer.append(written_mark)
			buffer.append(once "\n%",")
			gc_info_nb_in(buffer)
			buffer.extend(',')
			gc_info_nb_in(buffer)
			buffer.append(once "*sizeof(T")
			id.append_in(buffer)
			buffer.append(once "),")
			gc_store_left_in(buffer)
			buffer.append(once ");%N")
		end

	frozen standard_gc_define1 is
			-- For Fixed Size Objects.
		require
			not gc_handler.is_off
			type.live_type.at_run_time
		local
			lt: LIVE_TYPE; ltid: INTEGER
		do
			lt := type.live_type
			ltid := lt.id -- --------------- Define struct BXXX and typedef gcXXX :
			cpp.out_h_buffer.copy(once "typedef struct B")
			ltid.append_in(cpp.out_h_buffer)
			cpp.out_h_buffer.append(once " gc")
			ltid.append_in(cpp.out_h_buffer)
			cpp.out_h_buffer.append(once ";%Nstruct B")
			ltid.append_in(cpp.out_h_buffer)
			cpp.out_h_buffer.append(once "{T")
			ltid.append_in(cpp.out_h_buffer)
			cpp.out_h_buffer.append(once " object;union {void*flag;gc")
			ltid.append_in(cpp.out_h_buffer)
			cpp.out_h_buffer.append(once "*next;} header;};%N")
			cpp.write_out_h_buffer
			-- ----------------------------------- Declare storeXXX :
			cpp.out_h_buffer.copy(once "gc")
			ltid.append_in(cpp.out_h_buffer)
			cpp.out_h_buffer.extend('*')
			gc_store_in(cpp.out_h_buffer)
			cpp.write_extern_2(cpp.out_h_buffer, once "(void*)0")
			-- ------------------------------ Declare store_leftXXX :
			cpp.out_h_buffer.copy(once "int ")
		   gc_store_left_in(cpp.out_h_buffer)
			cpp.write_extern_0(cpp.out_h_buffer)
			-- ----------------------------------- Declare store_chunkXXX :
			cpp.out_h_buffer.copy(once "fsoc*")
			gc_store_chunk_in(cpp.out_h_buffer)
			cpp.write_extern_2(cpp.out_h_buffer, once "(void*)0")
			-- --------------------------------- Declare gc_freeXXX :
			cpp.out_h_buffer.copy(once "gc")
			ltid.append_in(cpp.out_h_buffer)
			cpp.out_h_buffer.extend('*')
			gc_free_in(cpp.out_h_buffer)
			cpp.write_extern_2(cpp.out_h_buffer, once "(void*)0")
			-- -------------------------------- Declare gc_info_nbXXX :
			if gc_handler.info_flag then
				cpp.out_h_buffer.copy(once "int ")
				gc_info_nb_in(cpp.out_h_buffer)
				cpp.write_extern_0(cpp.out_h_buffer)
			end
		end

	frozen standard_gc_define2 is
		require
			is_reference
			not gc_handler.is_off
			type.live_type.at_run_time
		local
			lt: LIVE_TYPE; ltid, arg_id: INTEGER; gc_check_id: BOOLEAN; wr_gen_arg_lt: LIVE_TYPE; is_weak_ref: BOOLEAN
			is_monomorphic_weak_ref: BOOLEAN
		do
			lt := type.live_type
			ltid := lt.id
			-- --------------------------- Definition for gc_sweepXXX :
			cpp.prepare_c_function
			cpp.pending_c_function_signature.append(once "void gc_sweep")
			ltid.append_in(cpp.pending_c_function_signature)
			cpp.pending_c_function_signature.append(once "(fsoc*c)")
			cpp.pending_c_function_body.append(once "gc")
			ltid.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "*o1,*o2;%No1=((gc")
			ltid.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "*)(&(c->first_object)));%N%
            %if(c->header.state_type==FSO_STORE_CHUNK){%N%
            %for(;o1<")
			gc_store_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once ";o1++){%N%
			  %if((o1->header.flag)==FSOH_MARKED){%N%
			  %o1->header.flag=FSOH_UNMARKED;%N")
			wr_gen_arg_lt := weak_reference_argument(lt)
			is_weak_ref := wr_gen_arg_lt /= Void
			if is_weak_ref then
				check
					generic_list.count = 1
				end
				is_monomorphic_weak_ref := wr_gen_arg_lt.run_time_set.count = 1
				if is_monomorphic_weak_ref then
					cpp.pending_c_function_body.append(once "gc_update_weak_ref_item")
					ltid.append_in(cpp.pending_c_function_body)
					cpp.pending_c_function_body.append(once "(&(o1->object));%N")
				else
					cpp.pending_c_function_body.append(once "gc_update_weak_ref_item_polymorph(&(o1->object._item));%N")
				end
			end
			cpp.pending_c_function_body.append(once "}%Nelse{%N")
			gc_handler.memory_dispose(once "o1", lt)
			cpp.pending_c_function_body.append(once "o1->header.next=gc_free")
			ltid.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once ";%Ngc_free")
			ltid.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "=o1;%N%
			  %}%N}%N}%N%
			  %else{%N%
			  %int dead=1;%N%
			  %gc")
			ltid.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "* old_gc_free = gc_free")
			ltid.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once ";%N%
			  %o2=o1+c->count_minus_one;%N%
			  %for(;o1<=o2;o1++){%N%
			  %if((o1->header.flag)==FSOH_MARKED){%N%
			  %o1->header.flag=FSOH_UNMARKED;%N")
			if is_weak_ref then
				if is_monomorphic_weak_ref then
					cpp.pending_c_function_body.append(once "gc_update_weak_ref_item")
					ltid.append_in(cpp.pending_c_function_body)
					cpp.pending_c_function_body.append(once "(&(o1->object));%N")
				else
					cpp.pending_c_function_body.append(once "gc_update_weak_ref_item_polymorph(&(o1->object._item));%N")
				end
			end
			cpp.pending_c_function_body.append(once "dead=0;}%Nelse{%N")
			gc_handler.memory_dispose(once "o1", lt)
			cpp.pending_c_function_body.append(once "o1->header.next=gc_free")
			ltid.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once ";%Ngc_free")
			ltid.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "=o1;%N%
			  %}%N}%N%
			  %if (dead){%N%
			  %gc_free")
			ltid.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once " = old_gc_free;%N%
			  %c->next=fsocfl;%N%
			  %fsocfl=c;%N%
			  %c->header.state_type=FSO_FREE_CHUNK;%N}%N%
			  %}%N")
			cpp.dump_pending_c_function(True)
			-- ------------------ Definition for gc_update_weak_ref_item... :
			if is_weak_ref then
				if is_monomorphic_weak_ref then
					cpp.prepare_c_function
					cpp.pending_c_function_signature.append(once "void gc_update_weak_ref_item")
					ltid.append_in(cpp.pending_c_function_signature)
					cpp.pending_c_function_signature.append(once "(T")
					ltid.append_in(cpp.pending_c_function_signature)
					cpp.pending_c_function_signature.append(once "* wr)")
					cpp.pending_c_function_body.append(once "gc")
					arg_id := wr_gen_arg_lt.run_time_set.first.id
					arg_id.append_in(cpp.pending_c_function_body)
					cpp.pending_c_function_body.append(once "* obj_ptr = (gc")
					arg_id.append_in(cpp.pending_c_function_body)
					cpp.pending_c_function_body.append(once "*)(wr->_item);%N%
										  %if (obj_ptr != NULL){%N%
										  %int swept = (((void*)obj_ptr) <= ((void*)wr));%N%
										  %if (swept != (obj_ptr->header.flag == FSOH_UNMARKED))%N%
										  %/* (already swept) xor marked */%N%
										  %wr->_item = NULL;%N}%N")
					cpp.dump_pending_c_function(True)
				else
					check
						wr_gen_arg_lt.is_tagged
					end
					generate_once_gc_update_weak_ref_item_polymorph
				end
			end
			-- --------------------- Definition for gc_markXXX :
			cpp.prepare_c_function
			cpp.pending_c_function_signature.append(once "void ")
			gc_mark_in(cpp.pending_c_function_signature)
			cpp.pending_c_function_signature.append(once "(T")
			ltid.append_in(cpp.pending_c_function_signature)
			cpp.pending_c_function_signature.append(once "*o)")
			gc_check_id := lt.is_tagged and then ace.no_check
			if gc_check_id then
				cpp.pending_c_function_body.append(once "se_gc_check_id(o,")
				ltid.append_in(cpp.pending_c_function_body)
				cpp.pending_c_function_body.append(once ");%N{%N")
			end
			lt.gc_mark_fixed_size(False)
			if gc_check_id then
				cpp.pending_c_function_body.append(once "}%N")
			end
			cpp.dump_pending_c_function(True)
			-- ----------------------- Definition for gc_align_markXXX :
			cpp.prepare_c_function
			cpp.pending_c_function_signature.append(once "void ")
			gc_align_mark_in(cpp.pending_c_function_signature)
			cpp.pending_c_function_signature.append(once "(fsoc*c,gc")
			ltid.append_in(cpp.pending_c_function_signature)
			cpp.pending_c_function_signature.append(once "*p)")
			lt.gc_align_mark_fixed_size
			cpp.dump_pending_c_function(True)
			-- ------------------------ Definition of chunk model HXXX :
			cpp.out_h_buffer.copy(once "fsoc H")
			ltid.append_in(cpp.out_h_buffer)
			cpp.out_c_buffer.copy(once "{{FSOC_SIZE,FSO_STORE_CHUNK,%N(void(*)(mch*,void*))gc_align_mark")
			ltid.append_in(cpp.out_c_buffer)
			cpp.out_c_buffer.append(once ",%N(void(*)(mch*))gc_sweep")
			ltid.append_in(cpp.out_c_buffer)
			cpp.out_c_buffer.append(once "},NULL,(((FSOC_SIZE-sizeof(fsoc)+sizeof(double))/sizeof(gc")
			ltid.append_in(cpp.out_c_buffer)
			cpp.out_c_buffer.append(once "))-1)}")
			cpp.write_extern_2(cpp.out_h_buffer, cpp.out_c_buffer)
			-- --------------------------------- Definition for newXXX :
			cpp.prepare_c_function
			cpp.pending_c_function_signature.extend('T')
			ltid.append_in(cpp.pending_c_function_signature)
			cpp.pending_c_function_signature.append(once "*new")
			ltid.append_in(cpp.pending_c_function_signature)
			cpp.pending_c_function_signature.append(once "(void)")
			cpp.pending_c_function_body.append(once "gc")
			ltid.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "*n;%Nfsoc*c;%N")
			if gc_handler.info_flag then
				gc_info_nb_in(cpp.pending_c_function_body)
				cpp.pending_c_function_body.append(once "++;%N")
			end
			--
			cpp.pending_c_function_body.append(once "if(")
			gc_store_left_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once ">1){%N")
			gc_store_left_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "--;%Nn=")
			gc_store_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "++;%N}%Nelse if(")
			gc_free_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "!=NULL){%Nn=")
			gc_free_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once ";%N")
			gc_free_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "=n->header.next;%N}%Nelse if(")
			gc_store_left_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "==1){%N")
			gc_store_left_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "=0;%N")
			gc_store_chunk_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "->header.state_type=FSO_USED_CHUNK;%N%
                     %n=")
			gc_store_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "++;%N}%N%
                     %else{%Nc=gc_fsoc_get1();%N%
		     %if(")
			gc_free_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "!=NULL){%Nn=")
			gc_free_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once ";%N")
			gc_free_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "=n->header.next;%N}%Nelse{%N%
		     %if(c==NULL)c=gc_fsoc_get2();%N")
			gc_store_chunk_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "=c;%N*")
			gc_store_chunk_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "=H")
			ltid.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once ";%N")
			gc_store_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "=((gc")
			ltid.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "*)(&(")
			gc_store_chunk_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "->first_object)));%N")
			gc_store_left_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "=H")
			ltid.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once ".count_minus_one;%Nn=")
			gc_store_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "++;%N}%N%
		     %}%Nn->header.flag=FSOH_UNMARKED;%N")
			if need_c_struct then
				cpp.pending_c_function_body.append(once "n->object=M")
				ltid.append_in(cpp.pending_c_function_body)
				cpp.pending_c_function_body.append(once ";%N")
			end
			cpp.pending_c_function_body.append(once "return((T")
			ltid.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "*)n);%N")
			cpp.dump_pending_c_function(True)
		end

	weak_reference_argument (lt: LIVE_TYPE): LIVE_TYPE is
		do
		end

	frozen standard_gc_define2_for_expanded is
			-- For user's expanded with reference attribute to mark.
		require
			is_expanded
			not gc_handler.is_off
			type.live_type.at_run_time
		local
			lt: LIVE_TYPE; lt_id: INTEGER
		do
			lt := type.live_type
			if lt.gc_mark_to_follow then
				lt_id := lt.id
				-- -------------------------- Definition for gc_markXXX:
				cpp.prepare_c_function
				cpp.pending_c_function_signature.append(once "void ")
				gc_mark_in(cpp.pending_c_function_signature)
				cpp.pending_c_function_signature.append(once "(T")
				lt_id.append_in(cpp.pending_c_function_signature)
				cpp.pending_c_function_signature.append(once "*o)")
				lt.gc_mark_fixed_size(True)
				cpp.dump_pending_c_function(True)
			end
		end

	frozen generate_once_gc_update_weak_ref_item_polymorph is
		require
			is_reference -- is_weak_ref
			not gc_handler.is_off
			not cpp.pending_c_function
			type.live_type.at_run_time
		once
			cpp.prepare_c_function
			cpp.pending_c_function_signature.append(once "void gc_update_weak_ref_item_polymorph(T0** item)")
			cpp.pending_c_function_body.append(once "T0* obj_ptr = *item;%N%
																 %if (obj_ptr != NULL){%N%
																 %int obj_size=se_strucT[obj_ptr->id];%N%
																 %int swept")
			debug
				cpp.pending_c_function_body.append(once ";%N%
																	 %if (obj_size == 0){%N%
																	 %fprintf(stderr, %"Internal error: se_strucT[obj_ptr->id]==0\n%");%N%
																	 %exit(EXIT_FAILURE);%N%
																	 %}%N%
																	 %swept")
			end
			cpp.pending_c_function_body.append(once "=(((void*)obj_ptr)<=((void*)item));%N%
																 %obj_ptr = (T0*)(((char*)obj_ptr) + obj_size);%N%
																 %if (swept!=(((fso_header*)obj_ptr)->flag==FSOH_UNMARKED))%N%
																 %/* (already swept) xor marked */%N%
																 %*item = NULL;%N}%N")
			cpp.dump_pending_c_function(True)
		end

	frozen gc_store_in (buffer: STRING) is
		require
			is_static
		do
			buffer.append(once "store")
			id.append_in(buffer)
		end

	frozen gc_store_left_in (buffer: STRING) is
		require
			is_static
		do
			buffer.append(once "store_left")
			id.append_in(buffer)
		end

	frozen gc_store_chunk_in (buffer: STRING) is
		require
			is_static
		do
			buffer.append(once "store_chunk")
			id.append_in(buffer)
		end

	frozen gc_free_in (buffer: STRING) is
		require
			is_static
		do
			buffer.append(once "gc_free")
			id.append_in(buffer)
		end

	frozen gc_align_mark_in (buffer: STRING) is
		require
			is_static
		do
			buffer.append(once "gc_align_mark")
			id.append_in(buffer)
		end

	frozen gc_info_nb_in (buffer: STRING) is
		require
			is_static
		do
			buffer.append(once "gc_info_nb")
			id.append_in(buffer)
		end

feature {TYPE_MARK, GC_HANDLER, AGENT_CREATION}
	frozen gc_mark_in (buffer: STRING) is
		require
			is_static
		do
			buffer.append(once "gc_mark")
			id.append_in(buffer)
		end

feature {ANONYMOUS_FEATURE}
	frozen same_signature_type (other: TYPE_MARK; into: TYPE): BOOLEAN is
		do
			Result := other = Current or else signature_resolve_in(into) = other.signature_resolve_in(into)
		end

feature {LIVE_TYPE}
	c_header_pass1 is
		require
			type.live_type.at_run_time
		deferred
		end	
	
	c_header_pass2 is
		require
			type.live_type.at_run_time
		deferred
		end

	c_header_pass3 is
		require
			type.live_type.at_run_time
		deferred
		end

	c_header_pass4 is
		require
			type.live_type.at_run_time
		deferred
		end

feature {}
	frozen standard_c_typedef is
		require
			type.live_type.at_run_time
		local
			mem_id: INTEGER
		do
			mem_id := id
			cpp.out_h_buffer.clear_count
			if need_c_struct then
				cpp.out_h_buffer.append(once "typedef struct S")
				mem_id.append_in(cpp.out_h_buffer)
				cpp.out_h_buffer.append(once " T")
				mem_id.append_in(cpp.out_h_buffer)
				cpp.out_h_buffer.append(once ";%N")
			elseif is_empty_expanded then
				cpp.out_h_buffer.append(once "typedef int T")
				mem_id.append_in(cpp.out_h_buffer)
				cpp.out_h_buffer.append(once ";%N")
			elseif is_reference then
				cpp.out_h_buffer.append(once "typedef void*T")
				mem_id.append_in(cpp.out_h_buffer)
				cpp.out_h_buffer.append(once ";%N")
			end
			cpp.write_out_h_buffer
		end

	frozen standard_c_struct is
			-- Produce C code for the standard C struct (for user's
			-- expanded or reference as well).
		require
			is_static
			need_c_struct
		local
			wa: ARRAY[RUN_FEATURE_2]; i, mem_id: INTEGER; a: RUN_FEATURE_2; t: TYPE_MARK
		do
			mem_id := id
			wa := type.live_type.writable_attributes
			cpp.out_h_buffer.copy(once "struct S")
			mem_id.append_in(cpp.out_h_buffer)
			cpp.out_h_buffer.extend('{')
			if is_reference then
				if type.live_type.is_tagged then
					cpp.out_h_buffer.append(once "Tid id;")
				end
			end
			if wa /= Void then
				from
					i := wa.upper
				until
					i = 0
				loop
					a := wa.item(i)
					t := a.result_type
					t.c_type_for_result_in(cpp.out_h_buffer)
					cpp.out_h_buffer.append(once " _")
					cpp.out_h_buffer.append(a.name.to_string)
					cpp.out_h_buffer.extend(';')
					i := i - 1
				end
			end
			cpp.out_h_buffer.append(once "};%N")
			cpp.write_out_h_buffer
			if is_expanded then
				-- For expanded comparison:
				cpp.prepare_c_function
				cpp.pending_c_function_signature.append(once "int se_cmpT")
				mem_id.append_in(cpp.pending_c_function_signature)
				cpp.pending_c_function_signature.append(once "(T")
				mem_id.append_in(cpp.pending_c_function_signature)
				cpp.pending_c_function_signature.append(once "* o1,T")
				mem_id.append_in(cpp.pending_c_function_signature)
				cpp.pending_c_function_signature.append(once "* o2)")
				cpp.pending_c_function_body.append(once "int R=0;%N")
				if wa /= Void then
					from
						i := wa.upper
					until
						i = 0
					loop
						a := wa.item(i)
						if not a.result_type.is_empty_expanded then
							if a.result_type.is_expanded and then not a.result_type.is_kernel_expanded then
								cpp.pending_c_function_body.append(once "R = R || se_cmpT")
								a.result_type.id.append_in(cpp.pending_c_function_body)
								cpp.pending_c_function_body.append(once "(&(o1->_")
								cpp.pending_c_function_body.append(a.name.to_string)
								cpp.pending_c_function_body.append(once "), &(o2->_")
								cpp.pending_c_function_body.append(a.name.to_string)
								cpp.pending_c_function_body.append(once "));%N")
							else
								cpp.pending_c_function_body.append(once "R = R || ((o1->_")
								cpp.pending_c_function_body.append(a.name.to_string)
								cpp.pending_c_function_body.append(once ") != (o2->_")
								cpp.pending_c_function_body.append(a.name.to_string)
								cpp.pending_c_function_body.append(once "));%N")
							end
						end
						i := i - 1
					end
				end
				cpp.pending_c_function_body.append(once "return R;%N")
				cpp.dump_pending_c_function(True)
			end
		end

	frozen standard_c_object_model is
			-- Produce C code to define the model object.
		require
			is_static
		local
			mem_id: INTEGER; lt: LIVE_TYPE
		do
			lt := type.live_type
			mem_id := lt.id
			cpp.out_h_buffer.clear_count
			cpp.out_h_buffer.extend('T')
			mem_id.append_in(cpp.out_h_buffer)
			cpp.out_h_buffer.append(once " M")
			mem_id.append_in(cpp.out_h_buffer)
			cpp.out_c_buffer.clear_count
			lt.c_object_model_in(cpp.out_c_buffer)
			cpp.write_extern_2(cpp.out_h_buffer, cpp.out_c_buffer)
		end

	frozen standard_c_print_function is
			-- Produce `prinTid' function.
		require
			is_static
		do
			if ace.no_check then
				type.live_type.c_print_function
			end
		end

	frozen c_initialize_user_expanded_in (buffer: STRING) is
			-- For all kinds of `is_user_expanded' including `is_empty_expanded' as well.
		require
			buffer /= Void
			is_user_expanded
		local
			wa: ARRAY[RUN_FEATURE_2]; i: INTEGER; rf: RUN_FEATURE_2
		do
			if is_empty_expanded then
				buffer.extend('0')
			else
				buffer.extend('{')
				wa := type.live_type.writable_attributes
				from
					i := wa.upper
				until
					i = 0
				loop
					rf := wa.item(i)
					rf.result_type.c_initialize_in(buffer)
					i := i - 1
					if i > 0 then
						buffer.extend(',')
					end
				end
				buffer.extend('}')
			end
		end

end -- class TYPE_MARK
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
