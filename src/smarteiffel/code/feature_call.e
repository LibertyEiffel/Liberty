-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class FEATURE_CALL
   --
   -- Common root for FUNCTION_CALL and PROCEDURE_CALL.
   --

insert
   GLOBALS

feature {}
   frozen collect (type: TYPE): TYPE
      require
         type.feature_collection_done
         specialize_and_check_done: feature_stamp /= Void
      local
         target_type, sub_type, covariant_type: TYPE; rts: RUN_TIME_SET; af: ANONYMOUS_FEATURE
         i: INTEGER; buffer: STRING
      do
         target_type := target.collect(type)
         debug
            buffer := "   collecting feature call: "
            buffer.append(target_type.canonical_type_mark.written_mark)
            buffer.extend('.')
            feature_name.complete_name_in(buffer)
            buffer.extend('%N')
            echo.put_string(buffer)
         end
         -- register the feature as being alive:
         Result := smart_eiffel.collect(target_type, feature_stamp, False)
         -- now the arguments:
         if Result /= Void and then target_type.live_type /= Void then
            from
               rts := target_type.live_type.run_time_set
               i := 1
            until
               i > rts.count
            loop
               sub_type := rts.item(i).type
               if sub_type /= target_type then
                  af := feature_stamp.resolve_static_binding_for(target_type, sub_type).anonymous_feature(sub_type)
                  covariant_type := af.result_type.resolve_in(sub_type)
                  if covariant_type /= Result then
                     if covariant_type.is_native_array then
                        -- For NATIVE_ARRAY, valid_redefinition and can_be_assigned_to are always false so
                        -- there is no need to notify the assignment handler:
                        check
                           Result.is_native_array
                        end
                     else
                        assignment_handler.collect_normal(covariant_type, Result)
                     end
                  end
               end
               i := i + 1
            end
         end
         if arguments /= Void then
            --|*** (PR 06/06/04) if the target is current, it's simple
            --|collect. Do it anywhere for call and proc_call, unless
            --|direct_call is implemented.
            arguments.collect(type, feature_stamp, target_type)
         else
            check
               feature_stamp.anonymous_feature(target_type).arguments = Void
            end
         end
         check
            set_collected_for(type)
         end
      end

feature {FEATURE_CALL}
   creation_type: TYPE_MARK
         -- Must be set to avoid the standard check. (Only used by CREATE_SUPPORT.)
      deferred
      end

   frozen standard_check_export_and_obsolete_calls (type, target_type: TYPE; af: ANONYMOUS_FEATURE)
         -- Called by `specialize_and_check' when `feature_stamp' has been defined
      require
         type /= Void
         target_type = target.resolve_in(type)
         af /= Void
         af = feature_stamp.anonymous_feature(target_type)
         may_report_an_error: error_handler.is_empty
      local
         exported: BOOLEAN; ct: CLASS_TEXT; cl: CLIENT_LIST
      do
         -- Checking obsolete calls first for every kinds of calls (i.e. creation calls included):
         af.obsolete_warning_check(type, start_position)
         -- Now exportation:
         if creation_type /= Void then
            -- This is actually a creation calls. Exportation checked somewhere else.
         elseif target.is_implicit_current then
            -- No need to check exportation.
         else
            -- Standard calls exportation check:
            ct := target_type.class_text
            cl := af.permissions
            check
               cl /= Void
            end
            exported := cl.gives_permission_to(type.canonical_type_mark, target_type)
            if not exported then
               error_handler.add_position(start_position)
               error_handler.append(once "Forbidden call (i.e. exportation rules violated) when the type of Current is ")
               error_handler.append(type.canonical_type_mark.written_mark)
               error_handler.append(once ". (See the next error report for details.)")
               error_handler.print_as_error
               error_handler.add_position(af.start_position)
               error_handler.append(once "This feature is only exported to ")
               error_handler.append(cl.eiffel_view)
               cl.locate_in_error_handler
               error_handler.extend('.')
               error_handler.print_as_fatal_error
            end
         end
      ensure
         may_report_an_error: error_handler.is_empty
      end

feature {}
   collect_memory: FAST_ARRAY[TYPE]

   set_collected_for (t: TYPE): BOOLEAN
         -- Debugging purpose only (used in check only)
      do
         if collect_memory = Void then
            create collect_memory.with_capacity(4)
         end
         if not collect_memory.fast_has(t) then
            check
               smart_eiffel.status.is_collecting
            end
            collect_memory.add_last(t)
         end
         Result := True
      end

   collected_for (t: TYPE): BOOLEAN
         -- Use only in check clause.
      do
         Result := collect_memory /= Void and then collect_memory.fast_has(t)
      end

feature {ANY}
   side_effect_free (type: TYPE): BOOLEAN
      local
         target_type: TYPE; af: ANONYMOUS_FEATURE
      do
         if arguments = Void then
            Result := True
         else
            Result := arguments.side_effect_free(type)
         end
         if Result then
            Result := False
            if target.side_effect_free(type) then
               target_type := target.resolve_in(type)
               if target_type.direct_non_void_call_flag then
                  af := feature_stamp.anonymous_feature(target_type)
                  Result := af.side_effect_free(target_type)
               end
            end
         end
      end

   adapt_for (type: TYPE): like Current
      local
         tgt: like target; a: like arguments
      do
         check
            collected_for(type)
         end
         tgt := target.adapt_for(type)
         if arguments /= Void then
            a := arguments.adapt_for(type)
         end
         if tgt = target and then a = arguments then
            Result := Current
         else
            Result := twin
            Result.set_target(tgt)
            Result.set_arguments(a)
         end
      end

feature {FEATURE_CALL, CREATE_SUPPORT, AGENT_CREATION}
   frozen set_target (t: like target)
      require
         t /= Void
      do
         target := t
      ensure
         target = t
      end

   set_arguments (a: like arguments)
      deferred
      ensure
         arguments = a
      end

feature {ANY}
   frozen run_feature_for (type: TYPE): RUN_FEATURE
      local
         target_type: TYPE
      do
         target_type := target.resolve_in(type)
         Result := feature_stamp.run_feature_for(target_type)
      ensure
         Result /= Void
      end

feature {FEATURE_CALL, CREATE_SUPPORT, FEATURE_STAMP, E_PROCEDURE, AGENT_CREATION, EXTERNAL_PROCEDURE, ASSIGNMENT}
   frozen set_feature_stamp (fs: like feature_stamp)
      do
         feature_stamp := fs
      ensure
         feature_stamp = fs
      end

feature {ANY}
   feature_stamp: FEATURE_STAMP
         -- The good feature_stamp for the feature in some type (unrelated to `like_what' due to renamings).

   target: EXPRESSION
         -- Target of the call.

   feature_name: FEATURE_NAME
         -- Written selector name of the call.

   arguments: EFFECTIVE_ARG_LIST
         -- Arguments of the call if any.
      deferred
      ensure
         Result = Void or else Result.count > 0
      end

   arg_count: INTEGER
         -- The `arguments' count or 0.
      deferred
      ensure
         Result >= 0
      end

   frozen start_position: POSITION
      do
         Result := feature_name.start_position
      end

   frozen use_current (type: TYPE): BOOLEAN
      local
         af: ANONYMOUS_FEATURE
      do
         if arg_count > 0 then
            Result := arguments.use_current(type)
         end
         if Result then
            -- No need to continue.
         elseif target.is_current then
            if ace.boost then
               af := feature_stamp.anonymous_feature(type)
               check
                  af /= Void
               end
               if use_current_stack.fast_has(af) then
                  -- Recursive call inside, but it does not implies that `Current' is used:
                  Result := False
               else
                  use_current_stack.add_last(af) -- push.
                  Result := af.use_current(type)
                  use_current_stack.remove_last  -- pop.
               end
            else
               -- In non -boost mode, we are using `Current' for the stack trace:
               Result := True
            end
         else
            Result := target.use_current(type)
         end
      end

   frozen safety_check (type: TYPE)
      local
         run_time_set: RUN_TIME_SET; type_of_target: TYPE; rf: RUN_FEATURE
      do
         target.safety_check(type)
         if arguments /= Void then
            arguments.safety_check(type)
            type_of_target := target.resolve_in(type)
            run_time_set := type_of_target.live_type.run_time_set
            if run_time_set.count > 1 then
               if feature_name.to_string = as_same_dynamic_type then
                  -- No risk here.
               elseif feature_name.to_string = as_is_equal then
                  -- No risk here.
               else
                  rf := run_feature_for(type)
                  if rf /= Void then
                     smart_eiffel.covariance_check(start_position, rf, run_time_set)
                  end
               end
            end
         end
      end

feature {}
   use_current_stack: FAST_ARRAY[ANONYMOUS_FEATURE]
      once
         create Result.with_capacity(32)
      end

feature {}
   non_void_check (code_accumulator: CODE_ACCUMULATOR; type: TYPE; t: like target; target_type: TYPE)
         -- In non -boost mode, add code to check that `t' holds a non-Void value.
      require
         smart_eiffel.status.is_inlining_dynamic_dispatch
         t.side_effect_free(type)
         target_type.is_reference
      local
         ifthen: IFTHEN; sp: POSITION
      do
         if ace.boost then
            -- No extra check added in the code.
         elseif t.is_current or else t.is_manifest_string then
            -- Well, it would be better to check that too, but the code is already large enough.
         else
            sp := t.start_position
            create ifthen.make(sp,
                               create {BUILT_IN_EQ_NEQ}.make_eq(t, sp, create {E_VOID}.make(sp)),
                               create {RUN_TIME_ERROR_INSTRUCTION}.make(sp, once "Call on a Void target.", exceptions.Void_call_target))
            code_accumulator.current_context.add_last(ifthen)
         end
      end

   type_id_check (code_accumulator: CODE_ACCUMULATOR; type: TYPE; t: like target; target_live_type: LIVE_TYPE)
         -- In non -boost mode, assuming that `t' is non Void, add code to check that `t' really hold holds a
         -- `target_live_type' value.
      require
         smart_eiffel.status.is_inlining_dynamic_dispatch
         t.side_effect_free(type)
         target_live_type.type.is_reference
      local
         ifthen: IFTHEN; sp: POSITION; msg: STRING
      do
         if ace.boost then
            -- No extra check added in the code.
         elseif t.is_current or else t.is_manifest_string then
            -- Well, it would be better to check that too, but the code is already large enough.
         elseif {FAKE_TARGET} ?:= t then
            -- Well, this is certainly the target of some cecil call, and it is probably harmless to trust the
            -- caller (see FAKE_TARGET). Actually, the real problem is that we cannot know, right now, whether
            -- the corresponding type of the target really got an `id' at runtime.
         else
            msg := once "..... unique target buffer ....."
            msg.copy(once "Bad target type. The expected type is ")
            msg.append(target_live_type.name.to_string)
            msg.extend('.')
            msg := msg.twin
            sp := t.start_position
            create ifthen.make(sp,
               create {BUILT_IN_EQ_NEQ}.make_neq(create {DYNAMIC_DISPATCH_TEMPORARY1_ID}.make(t), sp,
                                                 create {INTEGER_CONSTANT}.make(target_live_type.id, sp)),
               create {RUN_TIME_ERROR_INSTRUCTION}.make(sp, msg, exceptions.System_level_type_error))
            code_accumulator.current_context.add_last(ifthen)
         end
      end

   parentheses_feature_name: like parentheses_feature_name_memory
      require
         arguments /= Void
      do
         Result := parentheses_feature_name_memory
         if Result = Void then
            create Result.alias_name(eiffel_parser.parentheses_name, arguments.start_position)
            parentheses_feature_name_memory := Result
         end
      ensure
         Result.start_position = arguments.start_position
      end

   parentheses_feature_name_memory: FEATURE_NAME

invariant
   target /= Void
   feature_name /= Void

end -- class FEATURE_CALL
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
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
