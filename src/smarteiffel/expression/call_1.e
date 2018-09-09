-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class CALL_1
   --
   -- For calls with only one argument.
   --

inherit
   FUNCTION_CALL
      redefine declaration_type
      end

feature {ANY}
   arg_count: INTEGER 1

   arguments: EFFECTIVE_ARG_LIST

   set_arguments (a: like arguments)
      do
         check
            a.count = 1
         end
         arguments := a
      end

   frozen arg1: EXPRESSION
      do
         Result := arguments.first
      end

   declaration_type: TYPE
      local
         target_type, argument_type: TYPE
      do
         if written_declaration_type_mark_memory = Void then
            Result := Precursor
            -- Looking first for the balancing_rule:
            if is_balanced_operator(feature_name.to_string) then
               if Result.is_boolean then
                  -- Balancing won't change the `Result'.
               else
                  target_type := target.declaration_type
                  if target_type.is_integer or else target_type.is_real then
                     argument_type := arguments.expression(1).declaration_type
                     if argument_type.is_integer or else argument_type.is_real then
                        if argument_type /= target_type then
                           if target_type.can_be_assigned_to(argument_type) then
                              Result := argument_type
                              written_declaration_type_mark_memory := Void
                           end
                        end
                     end
                  end
               end
            end
         else
            Result := Precursor
         end
      end

   specialize_in (type: TYPE): like Current
         ----------- Duplicate code call_1/proc_call_1/call_n/proc_call_n  -----------
         ---- except balancing rule here ---------------
      local
         fs: like feature_stamp; t: like target; arg: like arguments
      do
         t := target.specialize_in(type)
         if target.is_current then
            fs := type.search(feature_name)
            if fs = Void then
               smart_eiffel.unknown_feature_fatal_error(target, type, feature_name)
            end
            if feature_stamp = Void then
               feature_stamp := fs
            end
         end
         arg := arguments.specialize_in(type)
         Result := current_or_twin_init(t, arg, fs)
      ensure then
         target.is_current = old target.is_current
         Result /= Current implies Result.feature_stamp /= feature_stamp or else Result.target /= target or else Result.arguments /= arguments
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
         ----------- Duplicate code call_1/proc_call_1/call_n/proc_call_n  -----------
      local
         t: like target; arg: like arguments; fs: like feature_stamp
      do
         check
            target.is_current implies feature_stamp /= Void
         end
         arg := arguments.specialize_thru(parent_type, parent_edge, new_type)
         if target.is_current then
            fs := feature_stamp.specialize_thru(parent_type, parent_edge, new_type)
            Result := current_or_twin_init(target, arg, fs)
         else
            t := target.specialize_thru(parent_type, parent_edge, new_type)
            Result := current_or_twin_init(t, arg, Void)
            -- fs determined by specialize_and_check
         end
      ensure then
         target.is_current = old target.is_current
         Result /= Current implies Result.feature_stamp /= feature_stamp or else Result.target /= target or else Result.arguments /= arguments
      end

   specialize_and_check (type: TYPE): EXPRESSION
         ----------- Duplicate code call_1/proc_call_1/call_n/proc_call_n  -----------
         ---------------except AGENT_INSTRUCTION stuff ------------------------------
         --|*** Except for the `function_check' call (Dom. march 28th 2004) ***
      local
         fs: like feature_stamp; af: ANONYMOUS_FEATURE; arg: like arguments; t: like target
         target_type, target_declaration_type, argument_type: TYPE;
         a1: like arg1; like_current_result: like Current
         call_n: FUNCTION_CALL_N; call_1: FUNCTION_CALL_1; call_0: FUNCTION_CALL_0
      do
         t := target.specialize_and_check(type)
         if target.is_current then
            target_type := type
         else
            target_type := t.resolve_in(type)
         end

         arg := arguments
         a1 := arg1
         a1 := a1.specialize_and_check(type)
         if a1 /= arg1 then
            arg := arg.twin
            arg.put(a1, 1)
         end

         -- Looking for the balancing_rule:
         --| **** TODO replace by conversion here
         if is_balanced_operator(feature_name.to_string) then
            if target_type.is_integer or else target_type.is_real then
               if is_question_mark_open_operand(a1) then
                  -- In the case of a question mark (?) OPEN_OPERAND, we cannot call `resolve_in'
                  -- yet and, by nature, we must not apply balancing rule here.
                  -- (If one want to allow balancing he must use a curly typed OPEN_OPERAND.)
               else
                  argument_type := a1.resolve_in(type)
                  if argument_type.is_integer or else argument_type.is_real then
                     if argument_type /= target_type then
                        if target_type.can_be_assigned_to(argument_type) then
                           t := assignment_handler.implicit_cast(t, target_type, argument_type)
                           target_type := argument_type
                        end
                     end
                  end
               end
            end
         end

         if target.is_current then
            fs := feature_stamp
         else
            target_declaration_type := t.declaration_type
            fs := target_declaration_type.search(feature_name) -- *** OBSOLETE *** Dom march 15th 2006 ***
            if fs = Void then
               smart_eiffel.unknown_feature_fatal_error(target, target_declaration_type, feature_name)
            end
            fs := fs.resolve_static_binding_for(target_declaration_type, target_type)
         end

         af := fs.anonymous_feature(target_type)
         if af = Void then
            if not target.is_implicit_current then
               error_handler.add_position(target.start_position)
            end
            error_handler.add_position(feature_name.start_position)
            error_handler.append(once "Missing anonymous feature for this call.")
            error_handler.print_as_internal_error
         end

         if af.arguments = Void then
            if fs.anonymous_feature(target_type).result_type /= Void and then target_type.valid_feature_name(parentheses_feature_name) then
               -- semantic alias "()"
               create call_0.make(t, feature_name)
               call_0.set_feature_stamp(fs)
               call_0.standard_check_export_and_obsolete_calls(type, target_type, af)
               t := call_0.specialize_and_check(type)
               create call_1.make(t, parentheses_feature_name, arguments)
               call_1 := call_1.specialize_in(type)
               Result := call_1.specialize_and_check(type)
            else
               error_handler.append(once "The feature called has no formal argument while the actual argument list has 1 argument.")
               error_handler.add_position(af.start_position)
               error_handler.add_position(arguments.start_position)
               error_handler.print_as_fatal_error
            end
         else
            if function_check(type, af) then
               --sedb_breakpoint
            end
            arg := arg.specialize_and_check(type, af, target_type, True)
            if af.names.first.to_string = as_item and then target_type.is_agent then
               create {AGENT_EXPRESSION} Result.make(type, Current, target_type, t, arg)
            elseif arg.count = arguments.count then
               if feature_stamp = Void then
                  feature_stamp := fs
               end
               like_current_result := current_or_twin_init(t, arg, fs)
               like_current_result.standard_check_export_and_obsolete_calls(type, target_type, af)
               check
                  feature_stamp /= Void
                  like_current_result.feature_stamp /= Void
               end
               Result := like_current_result
            elseif arg.count > arguments.count then
               create call_n.make(t, feature_name, arg)
               call_n.set_feature_stamp(fs)
               call_n.standard_check_export_and_obsolete_calls(type, target_type, af)
               Result := call_n.specialize_and_check(type)
            else
               error_handler.append("Strange formal/actual arguments mismatch!")
               error_handler.add_position(arg.start_position)
               error_handler.add_position(af.arguments.start_position)
               error_handler.print_as_internal_error
            end
         end
      end

   frozen simplify (type: TYPE): EXPRESSION
      local
         t: like target; args: like arguments; target_type: TYPE; af: ANONYMOUS_FEATURE
         inline_memo: INLINE_MEMO
      do
         t := target.simplify(type)
         if t.is_void then
            smart_eiffel.magic_count_increment
            target_type := target.resolve_in(type)
            create {VOID_CALL} Result.make(feature_name.start_position, feature_stamp, target_type)
         else
            target_type := t.resolve_in(type)
            af := feature_stamp.anonymous_feature(target_type)
            args := arguments.simplify(type)
            -- Attemp to inline first:
            inline_memo := af.inline_expression_1(type, feature_stamp, feature_name.start_position,
                                                  target_type, t, args.first, resolve_in(type))
            if inline_memo /= Void then
               Result := inline_memo.expression
               smart_eiffel.dispose_inline_memo(inline_memo)
            else
               -- And finally, the general scheme:
               Result := current_or_twin_init(t, args, feature_stamp)
            end
         end
      end

feature {EFFECTIVE_ROUTINE}
   frozen inline_with (new_target, new_arg1: EXPRESSION): like Current
      require
         new_target /= Void
         new_arg1 /= Void
      do
         Result := twin
         Result.set_target(new_target)
         Result.set_arguments(create {EFFECTIVE_ARG_LIST_N}.make_1(start_position, new_arg1))
      end

feature {CALL_1}
   init (t: like target; arg: like arguments; fs: like feature_stamp)
      do
         target := t
         arguments := arg
         feature_stamp := fs
      end

feature {}
   current_or_twin_init (t: like target; arg: like arguments; fs: like feature_stamp): like Current
      do
         if t = target and then feature_stamp = fs and then arg = arguments then
            Result := Current
         else
            Result := twin
            Result.init(t, arg, fs)
         end
      end

   is_balanced_operator (operator_name: STRING): BOOLEAN
         -- Obviously, the list is limited to usual maths notations.
      do
         inspect
            operator_name
         when "+", "-", "*", "<", "<=", ">", ">=" then
            Result := True
         else
            check
               not Result
            end
         end
      end

   is_question_mark_open_operand (expression: EXPRESSION): BOOLEAN
      local
         open_operand: OPEN_OPERAND
      do
         if {OPEN_OPERAND} ?:= expression then
            open_operand ::= expression
            Result := open_operand.curly_type = Void
         end
      end

invariant
   arguments.count = 1

end -- class CALL_1
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright (C) 2011-2018: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
