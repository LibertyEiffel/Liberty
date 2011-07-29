-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
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
   register_procedure (rf: RUN_FEATURE_5) is
      require
         rf.is_once_procedure
      do
         check
            not procedure_list.has(rf)
         end
         procedure_list.add_last(rf)
      end

feature {RUN_FEATURE_6}
   register_function (rf: RUN_FEATURE_6) is
      require
         rf.is_once_function
      do
         check
            not function_list.has(rf)
         end
         function_list.add_last(rf)
      end

feature {SMART_EIFFEL}
   reset is
         -- Called before a re-collect cycle.
      do
         collected_precomputable_function.clear_count
      end

feature {NON_VOID_NO_DISPATCH}
   collect_precomputable_function (non_void_no_dispatch: NON_VOID_NO_DISPATCH; fs: FEATURE_STAMP; type: TYPE) is
      require
         non_void_no_dispatch /= Void
      do
         if not collected_precomputable_function.fast_has(non_void_no_dispatch) then
            smart_eiffel.collect_precomputable(type, fs)
            collected_precomputable_function.add_last(non_void_no_dispatch)
         end
      end

feature {GC_HANDLER}
   precomputable_function_list: FAST_ARRAY[NON_VOID_NO_DISPATCH] is
         -- Ordered list of ONCE_FUNCTION to precompute. The `precomputable_function_list' must not be cleared
         -- by `reset' because it gives the order of evaluation (a ONCE_FUNCTION can become precomputable
         -- because another ONCE_FUNCTION has been detected as precomputable). Also note that we do not
         -- memorize the ONCE_FUNCTION itself because the simplify process may change the object itself.
         -- See also `collected_precomputable_function' below.
      once
         create Result.with_capacity(32)
      end

   collected_precomputable_function: FAST_ARRAY[NON_VOID_NO_DISPATCH] is
         -- Is a subset of `precomputable_function_list'. The order is not important here.
      once
         create Result.with_capacity(32)
      end

feature {ONCE_FUNCTION}
   debug_set: HASHED_SET[STRING] is
      once
         create Result.make
      end

   precomputable_function (feature_stamp: FEATURE_STAMP; target_type: TYPE; once_function: ONCE_FUNCTION): NON_VOID_NO_DISPATCH is
      require
         once_function = feature_stamp.anonymous_feature(target_type)
         no_arguments: once_function.arguments = Void
         no_context_variation: not once_function.use_current(target_type)
      local
         create_instruction: CREATE_INSTRUCTION; assignment: ASSIGNMENT; created_type: TYPE
         expression: EXPRESSION
      do
         --|*** We should also check that `target_type' has no expanded with side_effects...
         --|*** (Fred. + Dom. Oct 27th) ***
         create_instruction ?= once_function.routine_body
         if create_instruction /= Void and then create_instruction.writable.is_result then
            if precomputable_routine_detector.visit(target_type, create_instruction) then
               created_type := create_instruction.created_type(target_type)
               Result := non_void_no_dispatch_for(created_type, feature_stamp, target_type)
            end
         else
            assignment ?= once_function.routine_body
            if assignment /= Void and then assignment.left_side.is_result then
               if precomputable_routine_detector.visit(target_type, assignment) then
                  expression := assignment.right_side
                  created_type := expression.non_void_no_dispatch_type(target_type)
                  if created_type /= Void then
                     Result := non_void_no_dispatch_for(created_type, feature_stamp, target_type)
                  end
               end
            end
         end
      end

feature {JVM}
   fields_count: INTEGER

   jvm_define_fields is
      local
         byte_idx, idx_flag, i: INTEGER; rf: RUN_FEATURE; bf: ANONYMOUS_FEATURE
         name_list: FAST_ARRAY[INTEGER]
      do
         create name_list.with_capacity(fields_count)
         if function_list.count > 0 then
            from
               i := function_list.lower
               byte_idx := constant_pool.idx_utf8(once "B")
            until
               i > function_list.upper
            loop
               rf := function_list.item(i)
               bf := rf.base_feature
               idx_flag := idx_name_for_flag(bf)
               if name_list.fast_has(idx_flag) then
               else
                  name_list.add_last(idx_flag)
                  if not function_list.item(i).is_precomputable_once then
                     -- ---------- Static field for flag:
                     field_info.add(9, idx_flag, byte_idx)
                  end
                  -- ---------- Static field for result:
                  field_info.add(9, idx_name_for_result(bf), idx_descriptor(rf.result_type))
               end
               i := i + 1
            end
         end
         if procedure_list.count > 0 then
            from
               i := procedure_list.lower
               byte_idx := constant_pool.idx_utf8(once "B")
            until
               i > procedure_list.upper
            loop
               rf := procedure_list.item(i)
               bf := rf.base_feature
               idx_flag := idx_name_for_flag(bf)
               if name_list.fast_has(idx_flag) then
               else
                  name_list.add_last(idx_flag)
                  -- ---------- Static field for flag:
                  field_info.add(9, idx_flag, byte_idx)
               end
               i := i + 1
            end
         end
      end

   jvm_initialize_fields is
      do
         not_yet_implemented
      end

feature {RUN_FEATURE}
   idx_fieldref_for_flag (rf: RUN_FEATURE): INTEGER is
      require
         rf.is_once_routine
      local
         cp: CONSTANT_POOL
      do
         cp := constant_pool
         Result := cp.idx_fieldref3(jvm_root_class, o_flag(rf.base_feature), once "B")
      end

feature {C_COMPILATION_MIXIN, GC_HANDLER}
   idx_fieldref_for_result (type: TYPE; af: ANONYMOUS_FEATURE): INTEGER is
      require
         af.is_once_function
      local
         cp: CONSTANT_POOL; rt: TYPE_MARK; unique_result: STRING
      do
         cp := constant_pool
         rt := af.result_type.to_static(type)
         unique_result := once "............ unique buffer ..........."
         unique_result.clear_count
         unique_result_in(unique_result, af)
         Result := cp.idx_fieldref3(jvm_root_class, unique_result, jvm_descriptor(rt))
      end

   procedure_list: FAST_ARRAY[RUN_FEATURE_5] is
         -- Live set of once procedures.
      once
         create Result.with_capacity(32)
      end

   function_list: FAST_ARRAY[RUN_FEATURE_6] is
         -- Live set of ordinary (not precomputed) once functions.
      once
         create Result.with_capacity(32)
      end

   o_flag (bf: ANONYMOUS_FEATURE): STRING is
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

   buffer: STRING is
      once
         create Result.make(64)
      end

   jvm_descriptor_buffer: STRING is
      once
         create Result.make(32)
      end

feature {RUN_FEATURE, LIVE_TYPE, NON_VOID_NO_DISPATCH, RESULT}
   jvm_result_load (type: TYPE; af: ANONYMOUS_FEATURE) is
      require
         af.is_once_function
      local
         result_space, idx_result: INTEGER
      do
         result_space := af.result_type.to_static(type).jvm_stack_space
         idx_result := idx_fieldref_for_result(type, af)
         code_attribute.opcode_getstatic(idx_result, result_space)
      end

   jvm_result_store (type: TYPE; af: ANONYMOUS_FEATURE) is
      require
         af.is_once_function
      local
         result_space, idx_result: INTEGER
      do
         result_space := af.result_type.to_static(type).jvm_stack_space
         idx_result := idx_fieldref_for_result(type, af)
         code_attribute.opcode_putstatic(idx_result, - result_space)
      end

feature {C_PRETTY_PRINTER}
   c_variables_for_precomputable_routines is
         -- Generate the C code for once routine which are precomputable.
      local
         i: INTEGER; non_void_no_dispatch: NON_VOID_NO_DISPATCH
      do
         from
            i := collected_precomputable_function.lower
         until
            i > collected_precomputable_function.upper
         loop
            non_void_no_dispatch := collected_precomputable_function.item(i)
            c_define_o_result(non_void_no_dispatch.run_feature)
            i := i + 1
         end
      end

   c_code_for_precomputable_routines is
         -- Generate the C code for once routine which are precomputable.
      require
         smart_eiffel.is_ready
      local
         i: INTEGER; non_void_no_dispatch: NON_VOID_NO_DISPATCH; once_function: ONCE_FUNCTION
         unique_id_set: HASHED_SET[STRING]; unique_id: STRING
      do
         echo.put_string(once "Order of evaluation for pre-computed once function(s):%N")
         create unique_id_set.make
         from
            i := precomputable_function_list.lower
            -- Note: the `precomputable_function_list' must be generated from `lower' to `upper' because
            -- we may have dependencies between precomputed once function.
         until
            i > precomputable_function_list.upper
         loop
            non_void_no_dispatch := precomputable_function_list.item(i)
            if collected_precomputable_function.fast_has(non_void_no_dispatch) then
               -- Only collected one are generated, but we must also make sure that it is not yet generated
               -- (more than one `non_void_no_dispatch' may correspond to the same `once_function'):
               once_function := non_void_no_dispatch.once_function
               unique_id := once "... unique buffer ..."
               unique_id.clear_count
               unique_id_in(unique_id, once_function)
               if not unique_id_set.has(unique_id) then
                  unique_id_set.add(unique_id.twin)
                  -- Only collected one are generated:
                  echo.put_string(once "%T{")
                  echo.put_string(once_function.class_text.name.to_string)
                  echo.put_string(once "}.")
                  echo.put_string(once_function.first_name.to_string)
                  echo.put_string(once "%N")
                  cpp.pending_c_function_body.append(once "/*PCO*/%N")
                  c_pre_compute_of(non_void_no_dispatch.run_feature, once_function)
               end
            end
            i := i + 1
         end
         if unique_id_set.count > 0 then
            echo.put_string(once "Total number of precomputed once function: ")
            echo.put_integer(unique_id_set.count)
            echo.put_character('%N')
         end
      end

feature {RUN_FEATURE_5, RUN_FEATURE_6, C_LIVE_TYPE_COMPILER} -- For `compile_to_c':
   c_define_o_flag (rf: RUN_FEATURE) is
         -- Add the definition/initialization of the corresponding `o_flag' if not yet done.
      require
         rf.is_once_routine
      local
         bf: ANONYMOUS_FEATURE; bcbf: CLASS_TEXT; flag: STRING
      do
         bf := rf.base_feature
         bcbf := bf.class_text
         flag := o_flag(bf)
         if not bcbf.once_flag(flag) then
            cpp.out_h_buffer.copy(once "int ")
            cpp.out_h_buffer.append(flag)
            cpp.write_extern_0(cpp.out_h_buffer)
         end
      end

   c_define_o_result (rf: RUN_FEATURE) is
      require
         rf.is_once_function
      local
         bf: ANONYMOUS_FEATURE; bcbf: CLASS_TEXT; unique_result: STRING; rt: TYPE_MARK
      do
         bf := rf.base_feature
         bcbf := bf.class_text
         unique_result := once "............ unique buffer ..........."
         unique_result.clear_count
         unique_result_in(unique_result, bf)
         unique_result := unique_result.twin
         unique_result := string_aliaser.string(unique_result)
         if not bcbf.once_flag(unique_result) then
            cpp.out_h_buffer.clear_count
            rt := rf.result_type
            cpp.out_h_buffer.extend('T')
            if rt.is_expanded then
               rt.type.id.append_in(cpp.out_h_buffer)
               cpp.out_h_buffer.extend(' ')
            else
               cpp.out_h_buffer.append(once "0*")
            end
            cpp.out_h_buffer.append(unique_result)
            cpp.out_c_buffer.copy(cpp.initializer.for(rt))
            cpp.write_extern_2(cpp.out_h_buffer, cpp.out_c_buffer)
         end
      end

   c_test_o_flag (rf: RUN_FEATURE) is
      require
         rf.is_once_routine
      local
         flag: STRING
      do
         flag := o_flag(rf.base_feature)
         cpp.pending_c_function_body.append(once "if(")
         cpp.pending_c_function_body.append(flag)
         cpp.pending_c_function_body.append(once "==0){")
         cpp.pending_c_function_body.append(flag)
         cpp.pending_c_function_body.append(once "=1;{%N")
      end

   c_test_o_flag_recursion (rf: RUN_FEATURE) is
      require
         rf.is_once_routine
      local
         flag: STRING
      do
         if not ace.require_check then
            cpp.pending_c_function_body.append(once "}}%N")
         else
            flag := o_flag(rf.base_feature)
            cpp.pending_c_function_body.append(once "}%N")
            cpp.pending_c_function_body.append(flag)
            cpp.pending_c_function_body.append(once "=2;}%Nelse{%N")
            cpp.pending_c_function_body.append(once "ac_req(")
            cpp.pending_c_function_body.append(flag)
            cpp.pending_c_function_body.append(once "==2, %"Recursive once function.%");%N}%N")
         end
      end

   c_test_o_flag_introspect (rf: RUN_FEATURE) is
      require
         rf.is_once_routine
      local
         flag: STRING
      do
         flag := o_flag(rf.base_feature)
         cpp.pending_c_function_body.append(once "if(")
         cpp.pending_c_function_body.append(flag)
         cpp.pending_c_function_body.append(once "!=0){%N")
      end

feature {}
   jvm_flag_list: FAST_ARRAY[INTEGER] is
      once
         create Result.with_capacity(32)
      end

   idx_descriptor (rt: TYPE_MARK): INTEGER is
      require
         rt /= Void
      do
         Result := constant_pool.idx_utf8(jvm_descriptor(rt))
      end

   idx_name_for_result (bf: ANONYMOUS_FEATURE): INTEGER is
      require
         bf /= Void
      local
         unique_result: STRING
      do
         unique_result := once "......... unique buffer ........."
         unique_result.clear_count
         unique_result_in(unique_result, bf)
         Result := constant_pool.idx_utf8(unique_result)
      end

   idx_name_for_flag (bf: ANONYMOUS_FEATURE): INTEGER is
      require
         bf /= Void
      do
         Result := constant_pool.idx_utf8(o_flag(bf))
      end

   jvm_descriptor (rt: TYPE_MARK): STRING is
      do
         Result := jvm_descriptor_buffer
         Result.clear_count
         if rt.is_reference then
            Result.append(jvm_root_descriptor)
         else
            rt.jvm_descriptor_in(Result)
         end
      end

feature {RUN_FEATURE_6}
   is_precomputed (once_function: ONCE_FUNCTION): BOOLEAN is
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
   unique_result_in (string: STRING; af: ANONYMOUS_FEATURE) is
      do
         string.extend('o')
         unique_id_in(string, af)
      end

feature {}
   non_void_no_dispatch_for (created_type: TYPE; fs: FEATURE_STAMP; type: TYPE): NON_VOID_NO_DISPATCH is
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
               -- We may consider to ommit the comparison of `type' and `context_type', but I am not really sure of
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

   c_pre_compute_of (rf: RUN_FEATURE; bf: ANONYMOUS_FEATURE) is
      require
         rf.is_once_function
         cpp.pending_c_function
      local
         type: TYPE; result_type: TYPE_MARK; local_vars: LOCAL_VAR_LIST; default_create_procedure: RUN_FEATURE
         id, class_invariant_flag: INTEGER; internal_c_local: INTERNAL_C_LOCAL
      do
         type := rf.type_of_current
         if rf.require_assertion /= Void then
            cpp.code_compiler.compile(rf.require_assertion, type)
         end
         result_type := rf.result_type
         if result_type.is_user_expanded then
            default_create_procedure := result_type.type.live_type.default_create_run_feature
            if default_create_procedure /= Void then
               id := result_type.type.id
               internal_c_local := cpp.pending_c_function_lock_local(result_type.type, once "orp")
               internal_c_local.append_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.append(once "=M")
               id.append_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.append(once ";%N")
               cpp.push_create_instruction(type, default_create_procedure, Void, internal_c_local)
               cpp.mapper.compile(default_create_procedure)
               cpp.pop
               unique_result_in(cpp.pending_c_function_body, rf.base_feature)
               cpp.pending_c_function_body.extend('=')
               internal_c_local.append_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.append(once ";%N")
               internal_c_local.unlock
            end
            class_invariant_flag := cpp.class_invariant_call_opening(result_type.type, True)
            if class_invariant_flag > 0 then
               unique_result_in(cpp.pending_c_function_body, rf.base_feature)
               cpp.class_invariant_call_closing(class_invariant_flag, True)
            end
         end
         --
         local_vars := rf.local_vars
         if local_vars /= Void then
            cpp.pending_c_function_body.extend('{')
            local_vars.c_declare(rf.type_of_current, False)
         end
         --
         if rf.routine_body /= Void then
            cpp.code_compiler.compile(rf.routine_body, type)
         end
         --
         if rf.ensure_assertion /= Void then
            cpp.code_compiler.compile(rf.ensure_assertion, type)
         end
         --
         if local_vars /= Void then
            cpp.pending_c_function_body.extend('}')
         end
      end

   unique_id_in (string: STRING; af: ANONYMOUS_FEATURE) is
      do
         string.append(once "BC")
         af.class_text.id.append_in(string)
         af.first_name.mapping_c_in(string)
         -- (What about synonyms ?)
      end

end -- class ONCE_ROUTINE_POOL
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
