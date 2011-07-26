-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class EXPRESSION
   --
   -- Common class for all kinds of Eiffel expressions.
   --

inherit
   CODE

feature {ANY}
   specialize_2 (type: TYPE): EXPRESSION is
      deferred
      end

   is_current: BOOLEAN is
         -- Is it a `Current' like expression (really written `Current' or some implicit not-written `Current')?
      deferred
      end

   is_implicit_current: BOOLEAN is
         -- Is it an implicit Current (i.e., not explicitely written)?
      deferred
      ensure
         Result implies is_current
      end

   is_manifest_string: BOOLEAN is
         -- Is it a manifest string (i.e. a basic manifest string or some verbatim manifest string)?
      deferred
      end

   is_void: BOOLEAN is
         -- Is it the built-in Void?
      deferred
      end

   is_result: BOOLEAN is
         -- Is it the pseudo local variable `Result' ?
      deferred
      end

   is_writable: BOOLEAN is
         -- Is is something that one can find on the left-hand-side of the := operator ?
      deferred
      end

   frozen is_default_value: BOOLEAN is
         -- True if `Current' represents `Void', `False' , `0', '%U' or whatever is a default value. Also note
         -- that some default values like NULL_POINTER, cannot be written in pure Eiffel.
         -- (Thanks to the new ?:= operator, this `is_default_value' frozen definition is pretty fine.)
      local
         integer_constant: INTEGER_CONSTANT;   character_constant: CHARACTER_CONSTANT
         real_constant: REAL_CONSTANT
      do
         if {E_FALSE} ?:= Current then
            Result := True
         elseif {E_VOID} ?:= Current then
            Result := True
         elseif integer_constant ?:= Current then
            integer_constant ::= Current
            Result := integer_constant.value_memory = 0
         elseif {NULL_POINTER} ?:= Current then
            Result := True
         elseif character_constant ?:= Current then
            character_constant ::= Current
            Result := character_constant.value = '%U'
         elseif real_constant ?:= Current then
            real_constant ::= Current
            Result := real_constant.normalized_view.is_equal(once "0e0")
         end
      end

   frozen is_stored_in_some_local_variable: BOOLEAN is
         -- True if `Current' is stored in some local variable of the _target_ language. It does not
         -- mean that `Current' is writable! The goal here is to avoid creating an extra local
         -- storage in the _target_ language.
      do
         if {INTERNAL_LOCAL2} ?:= Current then
            Result := True
         elseif {ARGUMENT_NAME2} ?:= Current then
            Result := True
         elseif {ABSTRACT_CURRENT} ?:= Current then
            Result := True
         elseif {LOCAL_NAME2} ?:= Current then
            Result := True
         elseif {RESULT} ?:= Current then
            Result := True
         elseif {DYNAMIC_DISPATCH_TEMPORARY1} ?:= Current then
            Result := True
         elseif {DYNAMIC_DISPATCH_TEMPORARY1_ID} ?:= Current then
            Result := True
         elseif {DYNAMIC_DISPATCH_TEMPORARY2} ?:= Current then
            Result := True
         end
      end

   resolve_in (type: TYPE): TYPE is
         -- This method may be called to solve the `Current' expression type knowing that the `Current'
         -- expression `has_been_specialized' for the `type' given as an argument. It is important to keep
         -- in mind that the `resolve_in' function must not be called from some `specialize_in' or
         -- `specialize_thru' function (those functions are used when *one* TYPE is created and current
         -- expression may refer to TYPEs not yet created). Hence, `resolve_in' calls are likely to occurs
         -- during the `specialize_2' process or later if it is necessary, but `specialize_2' *must* have
         -- been called on `Current' expression before `resolve_in' is called. One may also know that
         -- `resolve_in' function may be called one or more times or may not be called at all. (Note that
         -- the require assertion is checking that we are not currently doing some `specialize_in' or
         -- `specialize_thru'.)
      require
         has_been_specialized
         not smart_eiffel.status.is_specializing
         no_type_for_void: not is_void
      deferred
      ensure
         Result /= Void
      end

   collect (type: TYPE): TYPE is
      deferred
      ensure
         (Result /= Void) implies (Result = resolve_in(type))
      end

   declaration_type: TYPE is
         -- The static type one can deduce from the declaration written in source text. As inheritance and
         -- redefinitions are ignored, it's the type to use for a lookup (for a method with this expression as
         -- target).
      require
         has_been_specialized
         not smart_eiffel.status.is_specializing
         no_type_for_void: not is_void
      deferred
      ensure
         Result /= Void
      end

   written_declaration_type_mark: TYPE_MARK is
         -- This variant of `declaration_type' is used only to check the left-hand side of "?:=", "::=" or "?=".
         -- Note: this is the written one i.e. not always a static one.
      require
         assignment_test_family_only: is_writable
         has_been_specialized
         not smart_eiffel.status.is_specializing
      do
      ensure
         Result /= Void
      end

   is_static: BOOLEAN is
         -- True if the expression has always the same static value regardless the context of the code.
         -- For example, this is True for True, False, Void, 2, "foo", 2.5, etc.
      deferred
      end

   non_void_no_dispatch_type (type: TYPE): TYPE is
         -- A non Void `Result' indicates that `Current' cannot be Void and that `Current' drives
         -- exactely to a single possible dynamic TYPE.
      require
         type /= Void
         smart_eiffel.status.collecting_done
      deferred
      ensure
         Result /= Void implies Result.live_type /= Void
      end

   simplify (type: TYPE): EXPRESSION is
      deferred
      ensure then
         Result.is_an_acceptable_replacement(type, Current)
      end

   static_simplify: EXPRESSION is
         -- This one is working completely out of context and is called directly by the parser only for
         -- some typical expressions.
      require
         not smart_eiffel.pretty_flag
         not smart_eiffel.short_or_class_check_flag
      do
         -- Actually, because only a few expressions are concerned, the default behavior is:
         Result := Current
      ensure
         Result /= Void
      end

   precedence: INTEGER is
         -- Handling of precedence (priority of expressions).
      deferred
      ensure
         1 <= Result and Result <= atomic_precedence
      end

   frozen base_class_written: CLASS_TEXT is
         -- The base class where this expression is written.
      require
         not start_position.is_unknown
      do
         Result := start_position.class_text
      end

   frozen written_in: CLASS_NAME is
         -- The name of the base class where this expression is written.
      require
         not start_position.is_unknown
      do
         Result := start_position.class_text_name
      end

   frozen is_an_acceptable_replacement (type: TYPE; other: EXPRESSION): BOOLEAN is
         -- Well, it is just for debug (see ensure).
      local
         type_of_current, type_of_other: TYPE; fake_tuple_1, fake_tuple_2: FAKE_TUPLE; i: INTEGER
      do
         if is_void then
            if other.is_void then
               Result := True
            else
               type_of_other := other.resolve_in(type)
               Result := type_of_other.is_reference
            end
         elseif (fake_tuple_1 ?:= Current) and then (fake_tuple_2 ?:= other) then
            from
               fake_tuple_1 ::= Current
               fake_tuple_2 ::= other
               Result := fake_tuple_1.count = fake_tuple_2.count
               i := fake_tuple_1.count
            until
               not Result or else i = 0
            loop
               Result := fake_tuple_1.expression(i).is_an_acceptable_replacement(type, fake_tuple_2.expression(i))
               i := i - 1
            end
         else
            -- Now the general basic scheme:
            type_of_current := resolve_in(type)
            type_of_other := other.resolve_in(type)
            Result := type_of_current.can_be_assigned_to(type_of_other)
         end
      ensure
         assertion_check_only: Result
      end

   frozen inline_dynamic_dispatch (code_accumulator: CODE_ACCUMULATOR; type: TYPE): EXPRESSION is
      require
         code_accumulator /= Void
         type /= Void
      do
         code_accumulator.open_new_context
         Current.inline_dynamic_dispatch_(code_accumulator, type)
         Result := code_accumulator.current_context_to_expression
         code_accumulator.close_current_context
      ensure
         code_accumulator.context_level = old code_accumulator.context_level
         Result /= Void
      end

feature {ANY} -- For `compile_to_jvm':
   compile_to_jvm (type: TYPE) is
         -- Produce Java byte code in order to push expression value on the jvm stack.
      require
         smart_eiffel.is_ready
         type.live_type /= Void
      deferred
      end

   compile_target_to_jvm (type: TYPE) is
         -- Same as `compile_to_jvm', but add class invariant check when needed.
      require
         smart_eiffel.is_ready
         type.live_type /= Void
      deferred
      end

   frozen standard_compile_target_to_jvm (type: TYPE) is
      local
         rt: TYPE
      do
         compile_to_jvm(type)
         rt := resolve_in(type)
         rt.canonical_type_mark.jvm_check_class_invariant
      end

   jvm_branch_if_false (type: TYPE): INTEGER is
         -- Gives the `program_counter' to be resolved later.
      require
         resolve_in(type).is_boolean
      deferred
      end

   jvm_branch_if_true (type: TYPE): INTEGER is
         -- Gives the `program_counter' to be resolved later.
      require
         resolve_in(type).is_boolean
      deferred
      end

   jvm_assign_creation (type: TYPE) is
         -- Basic assignment using value on top of stack. (Always writes reference.)
      require
         is_writable
      deferred
      end

   jvm_assign (type: TYPE) is
         -- Basic assignment using value on top of stack. (Copies to expanded type, else writes reference.)
      require
         is_writable
      deferred
      end

feature {ANY} -- For `pretty' and `short':
   extra_bracket_flag: BOOLEAN is
         -- True when we do have to add an extra pair of brackets if the `Current' expression is the target
         -- of a call. As an example, this is True for infix calls. (This feature is used for `pretty' as
         -- well as for `short'). As another example, it is also true (-1).foo because of the usual low
         -- priority of prefix minus.
      deferred
      end

   pretty_target (indent_level: INTEGER) is
         -- For `pretty'. Print the expression viewed as a target plus the corresponding dot when it is
         -- necessary.
      deferred
      end

   bracketed_pretty (indent_level: INTEGER) is
         -- For `pretty'. Add a bracket pair around `Current' only when it is necessary.
      deferred
      end

   short (type: TYPE) is
         -- Produce the short command output in the given context `type'.
      require
         type /= Void
      deferred
      end

   short_target (type: TYPE) is
         -- Produce the short command output in the given context `type'.
         -- Same as `short', but here, the `Current' expression is itself the target of some
         -- call, hence this call may add a dot (".") only when it is needed.
      require
         type /= Void
      deferred
      end

   frozen bracketed_short (type: TYPE) is
      require
         type /= Void
      do
         short_printer.hook_or("open_b", "(")
         short(type)
         short_printer.hook_or("close_b", ")")
      end

feature {}
   frozen jvm_standard_branch_if_false (type: TYPE): INTEGER is
         -- Gives the `program_counter' to be resolved.
      require
         resolve_in(type).is_boolean
      do
         compile_to_jvm(type)
         Result := code_attribute.opcode_ifeq
      end

   frozen jvm_standard_branch_if_true (type: TYPE): INTEGER is
         -- Gives the `program_counter' to be resolved.
      require
         resolve_in(type).is_boolean
      do
         compile_to_jvm(type)
         Result := code_attribute.opcode_ifne
      end

invariant
   not start_position.is_unknown

end -- class EXPRESSION
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
