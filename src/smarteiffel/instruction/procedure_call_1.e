-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class PROCEDURE_CALL_1
   --
   -- For a procedure call with only one argument.
   --

inherit
   PROCEDURE_CALL

create {ANY}
   make

feature {ANY}
   arguments: EFFECTIVE_ARG_LIST

   set_arguments (a: like arguments)
      do
         check
            a.count = 1
         end
         arguments := a
      end

   arg_count: INTEGER 1

   arg1: EXPRESSION
      do
         Result := arguments.first
      end

   specialize_in (type: TYPE): like Current
         ----------- Duplicate code call_1/proc_call_1/call_n/proc_call_n  -----------
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
         if t = target and then feature_stamp = fs and then arg = arguments then
            Result := Current
         else
            Result := twin
            Result.init(t, arg, fs)
         end
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
            target.is_current implies feature_stamp /= Void --|*** current_type = Void
         end
         arg := arguments.specialize_thru(parent_type, parent_edge, new_type)
         if target.is_current then
            fs := feature_stamp.specialize_thru(parent_type, parent_edge, new_type)
            if fs = feature_stamp and then arg = arguments then
               Result := Current
            else
               Result := twin
               Result.init(target, arg, fs)
            end
         else
            t := target.specialize_thru(parent_type, parent_edge, new_type)
            if t = target and then arg = arguments then
               Result := Current
            else
               Result := twin
               Result.init(t, arg, Void)
               -- fs determined by specialize_and_check
            end
         end
      ensure then
         target.is_current = old target.is_current
         Result /= Current implies Result.feature_stamp /= feature_stamp or else Result.target /= target or else Result.arguments /= arguments
      end

   specialize_and_check (type: TYPE): INSTRUCTION
         ----------- Duplicate code call_1/proc_call_1/call_n/proc_call_n  -----------
         ---------------except AGENT_INSTRUCTION stuff ------------------------------
         --|*** Except for the `procedure_check' call (Dom. march 28th 2004) ***
      local
         fs: like feature_stamp; af: ANONYMOUS_FEATURE; arg: like arguments; t: like target
         target_type, target_declaration_type: TYPE; like_current_result: like Current
         call_n: PROCEDURE_CALL_N; call_1: PROCEDURE_CALL_1; call_0: FUNCTION_CALL_0
      do
         t := target.specialize_and_check(type)
         if target.is_current then
            target_type := type
            fs := feature_stamp
         else
            target_type := t.resolve_in(type)
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
            procedure_check(type, af)
            arg := arguments.specialize_and_check(type, af, target_type, True)
            if af.names.first.to_string = as_call and then target_type.is_agent then
               create {AGENT_INSTRUCTION} Result.make(type, Current, target_type, t, arg)
            elseif arg.count = arguments.count then
               if feature_stamp = Void then
                  feature_stamp := fs
               end
               if t = target and then feature_stamp = fs and then arg = arguments then
                  like_current_result := Current
               else
                  like_current_result := twin
                  like_current_result.init(t, arg, fs)
               end
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

   frozen simplify (type: TYPE): INSTRUCTION
      local
         t: like target; args: like arguments; target_type: TYPE; af: ANONYMOUS_FEATURE
         inline_memo: INLINE_MEMO; proc_call_1: PROCEDURE_CALL_1
      do
         t := target.simplify(type)
         if t.is_void then
            smart_eiffel.magic_count_increment
            target_type := target.resolve_in(type)
            create {VOID_PROC_CALL} Result.make(feature_name.start_position, feature_stamp, target_type)
         else
            target_type := t.resolve_in(type)
            af := feature_stamp.anonymous_feature(target_type)
            args := arguments.simplify(type)
            -- Attempt to inline first:
            inline_memo := af.inline_instruction_1(type, target_type, t, args.first)
            if inline_memo /= Void then
               Result := inline_memo.instruction
               smart_eiffel.dispose_inline_memo(inline_memo)
            else
               -- And finally, the general scheme:
               if t /= target or else args /= arguments then
                  proc_call_1 := twin
                  proc_call_1.set_target(t)
                  proc_call_1.set_arguments(args)
                  Result := proc_call_1
               else
                  Result := Current
               end
            end
         end
      end

feature {ANY}
   accept (visitor: PROCEDURE_CALL_1_VISITOR)
      do
         visitor.visit_procedure_call_1(Current)
      end

feature {PROCEDURE_CALL_1}
   set_target_and_arg (t: like target; arg: like arguments)
      do
         target := t
         arguments := arg
      end

   init (t: like target; arg: like arguments; fs: like feature_stamp)
      do
         target := t
         arguments := arg
         feature_stamp := fs
      ensure
         target = t
         arguments = arg
         feature_stamp = fs
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

feature {}
   make (t: like target; fn: like feature_name; a: like arguments)
      require
         t /= Void
         fn /= Void
         a.count = 1
         not fn.start_position.is_unknown
      do
         target := t
         feature_name := fn
         arguments := a
      ensure
         target = t
         feature_name = fn
         arguments = a
      end

invariant
   arguments.count = 1

end -- class PROCEDURE_CALL_1
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
-- Copyright (C) 2011-2016: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
