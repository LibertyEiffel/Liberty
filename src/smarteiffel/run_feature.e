-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class RUN_FEATURE
   --
   -- A feature at run time: a specialized version of a feature for a given type.
   --
   -- Created at the "adapt" phase, i.e. the latest phase before the back-end generation. An important
   -- property is that during that phase, each run feature is created only once.
   --
   -- * RUN_FEATURE_1: constant attribute.
   -- * RUN_FEATURE_2: attribute.
   -- * RUN_FEATURE_3: procedure.
   -- * RUN_FEATURE_4: function.
   -- * RUN_FEATURE_5: once procedure.
   -- * RUN_FEATURE_6: once function.
   -- * RUN_FEATURE_7: external procedure.
   -- * RUN_FEATURE_8: external function.
   -- * RUN_FEATURE_9: deferred routine.
   --

inherit
   HASHABLE
   VISITABLE

insert
   GLOBALS

feature {ANY}
   type_of_current: TYPE
         -- The real type of Current in this feature.

   name: FEATURE_NAME
         -- Final name (the only one really used) of the feature.

   base_feature: ANONYMOUS_FEATURE
         -- Original base feature definition.

   feature_stamp: FEATURE_STAMP is
      do
         Result := type_of_current.lookup(name)
      ensure
         Result.anonymous_feature(type_of_current) = base_feature
      end

   arguments: FORMAL_ARG_LIST is
         -- Runnable arguments list if any.
      deferred
      end

   result_type: TYPE_MARK is
         -- Runnable Result type if any.
      deferred
      end

   require_assertion: REQUIRE_ASSERTION is
         -- Runnable collected require assertion if any.
      deferred
      end

   local_vars: LOCAL_VAR_LIST is
         -- Runnable local var list if any.
      deferred
      end

   routine_body: INSTRUCTION is
         -- Runnable routine body if any.
      deferred
      end

   ensure_assertion: ENSURE_ASSERTION is
         -- Runnable collected ensure assertion if any.
      deferred
      end

   rescue_compound: INSTRUCTION is
         -- Runnable rescue compound if any.
      deferred
      end

   is_once_procedure: BOOLEAN is
         -- This is not only True for RUN_FEATURE_5, but it may be also
         -- True when some once procedure is wrapped (RUN_FEATURE_10).
      deferred
      ensure
         Result implies result_type = Void
      end

   is_once_function: BOOLEAN is
         -- This is not only True for RUN_FEATURE_6, but it may be also
         -- True when some once function is wrapped (RUN_FEATURE_11).
      deferred
      ensure
         Result implies result_type /= Void
      end

   is_deferred: BOOLEAN is
      deferred
      end

   hash_code: INTEGER is
      do
         Result := to_pointer.hash_code
      end

   is_root: BOOLEAN
         -- True if `Current' is the root creation feature. Can only be set
         -- once in RUN_FEATURE_3. This function is called via a require
         -- assertion. (This way, no extra memory is used for a production
         -- compiler because this is dead code.)

   frozen is_once_routine: BOOLEAN is
         -- Is it a once routine?
      do
         Result := is_once_function or else is_once_procedure
      end

   side_effect_free: BOOLEAN is
         -- If calling `Current' has no side effect at all.
      require
         smart_eiffel.is_ready
      deferred
      end

   frozen use_current: BOOLEAN is
      require
         smart_eiffel.is_ready
      do
         inspect
            use_current_state
         when True_state then
            Result := True
         when False_state then
         when Unknown_state then
            use_current_state := Computing_state
            compute_use_current
            Result := use_current_state = True_state
         when Computing_state then
            use_current_state := True_state
            Result := True
         end
      end

   frozen debug_info_in (buffer: STRING) is
         -- For debugging only.
      local
         i: INTEGER
      do
         buffer.extend('{')
         buffer.append(type_of_current.name.to_string)
         buffer.extend('}')
         buffer.extend('.')
         name.complete_name_in(buffer)
         if arguments /= Void then
            buffer.extend('(')
            from
               i := 1
            until
               i > arguments.count
            loop
               arguments.type_mark(i).debug_info_in(buffer)
               i := i + 1
               if i <= arguments.count then
                  buffer.extend(',')
               end
            end
            buffer.extend(')')
         end
         if result_type /= Void then
            buffer.extend(':')
            result_type.debug_info_in(buffer)
         end
      end

   frozen start_position: POSITION is
      do
         Result := base_feature.start_position
      end

   mapping_jvm is
      deferred
      end

   mapping_name_in (buffer: STRING) is
      do
         buffer.extend('r')
         type_of_current.live_type.id.append_in(buffer)
         name.mapping_c_in(buffer)
      end

   frozen jvm_max_locals: INTEGER is
      do
         Result := type_of_current.canonical_type_mark.jvm_stack_space
         if arguments /= Void then
            Result := Result + arguments.jvm_stack_space(type_of_current)
         end
         if local_vars /= Void then
            Result := Result + local_vars.jvm_stack_space(type_of_current)
         end
         if result_type /= Void then
            Result := Result + result_type.jvm_stack_space
         end
         if rescue_compound /= Void then
            Result := Result + 1
         end
      end

feature {NATIVE}
   routine_mapping_jvm is
      local
         rt, ct: TYPE_MARK; idx, stack_level: INTEGER
      do
         ct := type_of_current.canonical_type_mark
         jvm.push_target_as_target
         stack_level := - (1 + jvm.push_arguments)
         rt := result_type
         if rt /= Void then
            stack_level := stack_level + rt.jvm_stack_space
         end
         idx := constant_pool.idx_methodref(Current)
         ct.type.live_type.jvm_invoke(idx, stack_level)
      end

feature {LIVE_TYPE}
   jvm_field_or_method is
         -- Update jvm's `fields' or `methods' if needed.
      deferred
      end

feature {CONSTANT_POOL}
   frozen jvm_descriptor: STRING is
      do
         tmp_jvm_descriptor.clear_count
         update_tmp_jvm_descriptor
         Result := tmp_jvm_descriptor
      end

feature {JVM}
   jvm_define is
         -- To compute the constant pool, the number of fields, the number of methods, etc.
      require
         smart_eiffel.is_ready
      deferred
      end

   frozen jvm_argument_offset (a: ARGUMENT_NAME1): INTEGER is
      require
         arguments /= Void
      do
         Result := type_of_current.canonical_type_mark.jvm_stack_space
         Result := Result + arguments.jvm_offset_of(type_of_current, a)
      ensure
         Result >= a.rank - 1
      end

   frozen jvm_local_variable_offset (ln: LOCAL_NAME1): INTEGER is
      require
         local_vars /= Void
      do
         Result := type_of_current.canonical_type_mark.jvm_stack_space
         if arguments /= Void then
            Result := Result + arguments.jvm_stack_space(type_of_current)
         end
         Result := Result + local_vars.jvm_offset_of(type_of_current, ln)
      ensure
         Result >= ln.rank - 1
      end

feature {RUN_FEATURE}
   is_in_computation: BOOLEAN is
      do
         Result := use_current_state = Computing_state
      end

feature {RUN_FEATURE, RETRY_INSTRUCTION}
   jvm_try_begin: INTEGER

   jvm_try_end: INTEGER

   jvm_handler: INTEGER

feature {RUN_FEATURE_VISITOR}
   old_list: FAST_ARRAY[E_OLD]
         -- Non Void when `ensure_assertion' actually has "old" expression.

feature {}
   use_current_state: INTEGER
         -- Memory cache for `use_current' (see below *_state constants).

   False_state,    -- already computed and False.
   True_state,     -- already computed and True.
   Unknown_state,  -- not yet computed.
   Computing_state -- during computation.
   : INTEGER is unique

   frozen std_compute_use_current is
      require
         is_in_computation
      do
         smart_eiffel.push_context(base_feature)
         if use_current_state = Computing_state then
            if require_assertion /= Void then
               if require_assertion.use_current(type_of_current) then
                  use_current_state := True_state
               end
            end
         end
         if use_current_state = Computing_state then
            if routine_body /= Void then
               if routine_body.use_current(type_of_current) then
                  use_current_state := True_state
               end
            end
         end
         if use_current_state = Computing_state then
            if rescue_compound /= Void then
               if rescue_compound.use_current(type_of_current) then
                  use_current_state := True_state
               end
            end
         end
         if use_current_state = Computing_state then
            if ensure_assertion /= Void then
               if ensure_assertion.use_current(type_of_current) then
                  use_current_state := True_state
               end
            end
         end
         if use_current_state = Computing_state then
            use_current_state := False_state
         end
         smart_eiffel.pop_context(base_feature)
      ensure
         use_current_state = False_state or else use_current_state = True_state
      end

   compute_use_current is
      require
         is_in_computation
      deferred
      ensure
         use_current_state = True_state or else use_current_state = False_state
      end

   update_tmp_jvm_descriptor is
      deferred
      end

   tmp_jvm_descriptor: STRING is
      once
         create Result.make(128)
      end

   routine_update_tmp_jvm_descriptor is
         -- For RUN_FEATURE_3/4/5/6/7/8/9/10/11 :
      local
         ct, rt: TYPE_MARK
      do
         tmp_jvm_descriptor.extend('(')
         ct := type_of_current.canonical_type_mark
         ct.jvm_target_descriptor_in(tmp_jvm_descriptor)
         if arguments /= Void then
            arguments.jvm_descriptor_in(tmp_jvm_descriptor)
         end
         rt := result_type
         if rt = Void then
            tmp_jvm_descriptor.append(once ")V")
         else
            tmp_jvm_descriptor.extend(')')
            rt.jvm_descriptor_in(tmp_jvm_descriptor)
         end
      end

   method_info_start is
      local
         flags: INTEGER; buffer: STRING

      do
         flags := type_of_current.canonical_type_mark.jvm_method_flags
         buffer := once "..............."
         buffer.clear_count
         name.mapping_c_in(buffer)
         method_info.start(flags, buffer, jvm_descriptor)
      end

   jvm_increment_invariant_flag is
      local
         name_idx: INTEGER; descriptor_idx: INTEGER; idx: INTEGER; lt: LIVE_TYPE
      do
         lt := type_of_current.live_type
         if not method_info.is_static and lt.class_text.invariant_check then
            name_idx := constant_pool.idx_utf8(once "invariant_flag")
            descriptor_idx := constant_pool.idx_utf8(once "I")
            field_info.add(1, name_idx, descriptor_idx)
         end
         if not method_info.is_static and lt.class_text.invariant_check then
            code_attribute.opcode_aload_0
            lt.opcode_checkcast_1
            idx := constant_pool.idx_fieldref3(lt.fully_qualified_name, once "invariant_flag", once "I")
            code_attribute.opcode_getfield(idx, -1)
            code_attribute.opcode_iconst_1
            code_attribute.opcode_iadd
            code_attribute.opcode_aload_0
            lt.opcode_checkcast_1
            code_attribute.opcode_swap
            code_attribute.opcode_putfield(idx, 1)
         end
      end

   jvm_decrement_invariant_flag is
      local
         idx: INTEGER; lt: LIVE_TYPE
      do
         lt := type_of_current.live_type
         if not method_info.is_static and lt.class_text.invariant_check then
            code_attribute.opcode_aload_0
            lt.opcode_checkcast_1
            idx := constant_pool.idx_fieldref3(lt.fully_qualified_name, once "invariant_flag", once "I")
            code_attribute.opcode_getfield(idx, -1)
            code_attribute.opcode_iconst_1
            code_attribute.opcode_isub
            code_attribute.opcode_aload_0
            lt.opcode_checkcast_1
            code_attribute.opcode_swap
            code_attribute.opcode_putfield(idx, 1)
         end
      end

   jvm_define_opening is
      require
         jvm.current_frame = Current
      local
         space, i: INTEGER
      do
         -- (1) -------------------- Local variable for Result :
         if result_type /= Void then
            space := result_type.jvm_push_default
            if is_once_function then
               once_routine_pool.jvm_result_store(type_of_current, base_feature)
            else
               result_type.jvm_write_local_creation(base_feature.jvm_result_offset(type_of_current))
            end
         end
         -- (2) ----------------------- User's local variables :
         if local_vars /= Void then
            local_vars.jvm_initialize(type_of_current)
         end
         -- (3) ------------------------ Execute old epressions:
         if old_list /= Void then
            check
               ensure_assertion /= Void
            end
            from
               i := old_list.lower
            until
               i > old_list.upper
            loop
               old_list.item(i).compile_to_jvm_old(type_of_current)
               i := i + 1
            end
         end
         jvm_try_begin := code_attribute.program_counter -- (4) ----------------------- Require assertion code :
         if type_of_current.canonical_type_mark.class_text.require_check and then require_assertion /= Void then
            require_assertion.compile_to_jvm(type_of_current)
         end
      end

   jvm_define_closing is
      require
         jvm.current_frame = Current
      local
         idx: INTEGER; lt: LIVE_TYPE
      do
         lt := type_of_current.live_type
         -- (0) ----------------------------- Class Invariant :
         -- (1) --------------------------- Ensure Check Code :
         if lt.class_text.ensure_check then
            if ensure_assertion /= Void then
               ensure_assertion.compile_to_jvm(type_of_current)
               code_attribute.opcode_pop
            end
         end
         jvm_try_end := code_attribute.program_counter
         -- (2) --------------------- Free for local expanded :
         -- (3) --------------------- Rescue :
         jvm_handler := code_attribute.program_counter + 1
         if rescue_compound /= Void then
            -- save exception
            code_attribute.opcode_return
            code_attribute.opcode_astore(jvm_max_locals - 1)
            -- rescue clause
            rescue_compound.compile_to_jvm(type_of_current)
            -- rethrow exception
            code_attribute.opcode_aload(jvm_max_locals - 1)
            code_attribute.opcode_athrow
            idx := constant_pool.idx_class2(once "java/lang/Exception")
            code_attribute.add_exception(jvm_try_begin, jvm_try_end, jvm_handler, idx)
         end
      end

   frozen for (lt: LIVE_TYPE; origin: like base_feature; fn: FEATURE_NAME) is
         -- Creation feature for the new lookup. Just creates the run feature, without adapting it yet.
      require
         not smart_eiffel.is_ready
         origin /= Void
      local
         buffer: STRING
      do
         type_of_current := lt.type
         base_feature := origin
         name := fn
         use_current_state := Unknown_state
         debug
            buffer := "Creating "
            buffer.append(type_of_current.name.to_string)
            buffer.extend('.')
            name.complete_name_in(buffer)
            buffer.extend('%N')
            echo.put_string(buffer)
         end
         set_result_type
         smart_eiffel.register_run_feature(Current)
      end

   set_result_type is
      deferred
      end

   debug_info: STRING -- To view more under sedb.

   do_adapt is
         -- Called by `adapt'.
      deferred
      end

feature {LIVE_TYPE}
   frozen adapt is
         -- Adapt the feature to make it suitable for use by the good old C_PRETTY_PRINTER.
      require
         smart_eiffel.registered(Current)
         type_of_current.live_type.registered(Current)
      do
         debug
            debug_info := "<adapting> {"
            debug_info.append(type_of_current.name.to_string)
            debug_info.append(once "}.")
            name.complete_name_in(debug_info)
         end
         base_feature.hook_for(type_of_current.live_type)
         smart_eiffel.push_context(base_feature)
         do_adapt
         smart_eiffel.pop_context(base_feature)
         debug
            debug_info.clear_count
            debug_info_in(debug_info)
         end
      end

invariant
   type_of_current /= Void

   name /= Void

   base_feature /= Void

end -- class RUN_FEATURE
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
