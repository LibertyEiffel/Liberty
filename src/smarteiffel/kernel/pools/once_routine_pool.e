-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ONCE_ROUTINE_POOL
   --
   -- Singleton object in charge of runnable once routines.
   -- This singleton is shared via the GLOBALS.`once_routine_pool' once function.
   --

insert
   GLOBALS
      undefine is_equal
      end
   SINGLETON

feature {RUN_FEATURE_5}
   register_procedure (rf: RUN_FEATURE_5)
      require
         rf.is_once_procedure
      do
         check
            not procedure_list.has(rf)
         end
         procedure_list.add_last(rf)
      end

feature {RUN_FEATURE_6}
   register_function (rf: RUN_FEATURE_6)
      require
         rf.is_once_function
      do
         check
            not function_list.has(rf)
         end
         function_list.add_last(rf)
      end

feature {SMART_EIFFEL}
   reset
         -- Called before a re-collect cycle.
      do
         collected_precomputable_function.clear_count
      end

feature {ANY}
   do_all_precomputed (action: PROCEDURE[TUPLE[NON_VOID_NO_DISPATCH]])
      require
         action /= Void
      do
         collected_precomputable_function.for_each(action)
      end

   do_all_precomputed_ordered (action: PROCEDURE[TUPLE[NON_VOID_NO_DISPATCH]])
      require
         action /= Void
      local
         i: INTEGER; non_void_no_dispatch: NON_VOID_NO_DISPATCH
      do
         from
            i := precomputable_function_list.lower
         until
            i > precomputable_function_list.upper
         loop
            non_void_no_dispatch := precomputable_function_list.item(i)
            if collected_precomputable_function.fast_has(non_void_no_dispatch) then
               action.call([non_void_no_dispatch])
            end
            i := i + 1
         end
      end

feature {NON_VOID_NO_DISPATCH}
   collect_precomputable_function (non_void_no_dispatch: NON_VOID_NO_DISPATCH; fs: FEATURE_STAMP; type: TYPE)
      require
         non_void_no_dispatch /= Void
      do
         smart_eiffel.collect_precomputable(type, fs)
         if not collected_precomputable_function.fast_has(non_void_no_dispatch) then
            collected_precomputable_function.add_last(non_void_no_dispatch)
         end
      end

feature {GC_HANDLER}
   precomputable_function_list: FAST_ARRAY[NON_VOID_NO_DISPATCH]
         -- Ordered list of ONCE_FUNCTION to precompute. The `precomputable_function_list' must not be cleared
         -- by `reset' because it gives the order of evaluation (a ONCE_FUNCTION can become precomputable
         -- because another ONCE_FUNCTION has been detected as precomputable). Also note that we do not
         -- memorize the ONCE_FUNCTION itself because the simplify process may change the object itself.
         -- See also `collected_precomputable_function' below.
      once
         create Result.with_capacity(32)
      end

   collected_precomputable_function: FAST_ARRAY[NON_VOID_NO_DISPATCH]
         -- Is a subset of `precomputable_function_list'. The order is not important here.
      once
         create Result.with_capacity(32)
      end

feature {ONCE_FUNCTION}
   debug_set: HASHED_SET[STRING]
      once
         create Result.make
      end

   precomputable_function (feature_stamp: FEATURE_STAMP; target_type: TYPE; once_function: ONCE_FUNCTION): NON_VOID_NO_DISPATCH
      require
         once_function = feature_stamp.anonymous_feature(target_type)
         no_arguments: once_function.arguments = Void
         no_context_variation: not once_function.use_current(target_type)
      local
         create_instruction: CREATE_INSTRUCTION; create_expression: CREATE_EXPRESSION
         assignment: ASSIGNMENT; created_type: TYPE
         expression: EXPRESSION
      do
         --|*** We should also check that `target_type' has no expanded with side_effects...
         --|*** (Fred. + Dom. Oct 27th) ***
         if once_function.routine_body /= Void then
            if create_instruction ?:= once_function.routine_body then
               create_instruction ::= once_function.routine_body
               if create_instruction.writable.is_result and then precomputable_routine_detector.visit_once_body(target_type, create_instruction) then
                  created_type := create_instruction.created_type(target_type)
                  Result := non_void_no_dispatch_for(created_type, feature_stamp, target_type)
               end
            elseif assignment ?:= once_function.routine_body then
               assignment ::= once_function.routine_body
               if assignment.left_side.is_result and then precomputable_routine_detector.visit_once_body(target_type, assignment) then
                  expression := assignment.right_side
                  created_type := expression.non_void_no_dispatch_type(target_type)
                  if created_type /= Void then
                     Result := non_void_no_dispatch_for(created_type, feature_stamp, target_type)
                  end
               end
            end
         elseif once_function.routine_then /= Void then
            if create_expression ?:= once_function.routine_then then
               create_expression ::= once_function.routine_then
               if precomputable_routine_detector.visit_once_then(target_type, create_expression) then
                  created_type := create_expression.created_type(target_type)
                  Result := non_void_no_dispatch_for(created_type, feature_stamp, target_type)
               end
            end
         end
      end

feature {C_COMPILATION_MIXIN, GC_HANDLER}
   procedure_list: FAST_ARRAY[RUN_FEATURE_5]
         -- Live set of once procedures.
      once
         create Result.with_capacity(32)
      end

   function_list: FAST_ARRAY[RUN_FEATURE_6]
         -- Live set of ordinary (not precomputed) once functions.
      once
         create Result.with_capacity(32)
      end

   buffer: STRING
      once
         create Result.make(64)
      end

feature {RUN_FEATURE_6}
   is_precomputed (once_function: ONCE_FUNCTION): BOOLEAN
         -- (Actually, only once function may be pre-computed and it seems to be the right choice.)
         --|*** Same performance problems as `no_dispatch_for' <FM - 07/02/2006>
      require
         smart_eiffel.is_ready
         once_function /= Void
      local
         i: INTEGER; feature_text: FEATURE_TEXT
      do
         from
            feature_text := once_function.feature_text
            i := precomputable_function_list.lower
         until
            Result or else i > precomputable_function_list.upper
         loop
            Result := precomputable_function_list.item(i).once_function.feature_text = feature_text
            i := i + 1
         end
      end

feature {ANY}
   unique_result_in (string: STRING; af: ANONYMOUS_FEATURE)
      do
         string.extend('o')
         unique_id_in(string, af)
      end

   unique_id_in (string: STRING; af: ANONYMOUS_FEATURE)
      do
         string.append(once "BC")
         af.class_text.id.append_in(string)
         af.first_name.mapping_c_in(string)
         -- (What about synonyms ?)
      end

   o_flag (bf: ANONYMOUS_FEATURE): STRING
         -- Compute the only one corresponding `flag': fBCxxKey used to check that
         -- execution is done.
      require
         bf /= Void
      do
         Result := once ".... unique buffer ...."
         Result.copy(once "fBC")
         bf.class_text.id.append_in(Result)
         bf.first_name.mapping_c_in(Result)
         Result := string_aliaser.string(Result)
      ensure
         string_aliaser.registered_one(Result)
      end

feature {}
   non_void_no_dispatch_for (created_type: TYPE; fs: FEATURE_STAMP; type: TYPE): NON_VOID_NO_DISPATCH
         -- Retrieve the one from `precomputable_function_list' or create a new one.
      require
         smart_eiffel.status.collecting_done
         fs /= Void
         type /= Void
      local
         i: INTEGER
      do
         from
            i := precomputable_function_list.lower
         until
            Result /= Void or else i > precomputable_function_list.upper
         loop
            Result := precomputable_function_list.item(i)
            if Result.feature_stamp = fs and then Result.context_type = type then
               -- (We have found the same one.)
               -- We may consider to omit the comparison of `type' and `context_type', but I am not really sure of
               -- that.
            else
               Result := Void
            end
            i := i + 1
         end
         if Result = Void then
            create Result.make(created_type, fs, type)
            precomputable_function_list.add_last(Result)
         end
      ensure
         precomputable_function_list.fast_has(Result)
      end

end -- class ONCE_ROUTINE_POOL
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
