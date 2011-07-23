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

   c_define is
         -- Produce C code for definition.
      deferred
      end

   mapping_c is
         -- Produce C code when current is called and when the concrete type of target is unique (`cpp' is in
         -- charge of the context).
      deferred
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

feature {}
   frozen default_mapping_procedure is
         -- Default mapping for procedure calls with target.
      do
         default_mapping_function
         cpp.pending_c_function_body.append(once ";%N")
      end

   frozen default_mapping_function is
         -- Default mapping for function calls with target.
      require
         cpp.pending_c_function
      local
         no_check, uc, tcbd: BOOLEAN
      do
         no_check := ace.no_check
         uc := use_current
         if not uc then
            tcbd := cpp.target_cannot_be_dropped
            if tcbd then
               cpp.pending_c_function_body.extend(',')
            end
         end
         mapping_name_in(cpp.pending_c_function_body)
         default_mapping_arg(no_check, uc, tcbd)
      end

   frozen default_mapping_arg (no_check, uc, tcbd: BOOLEAN) is
      do
         cpp.pending_c_function_body.extend('(')
         if no_check then
            cpp.pending_c_function_body.append(once "&ds")
         end
         if ace.profile then
            if no_check then
               cpp.pending_c_function_body.extend(',')
            end
            cpp.pending_c_function_body.append(once "&local_profile")
         end
         if uc then
            if no_check or else ace.profile then
               cpp.pending_c_function_body.extend(',')
            end
            if type_of_current.is_boolean then
               cpp.pending_c_function_body.append(once "(T6)(")
            end
            cpp.put_target_as_target(type_of_current)
            if type_of_current.is_boolean then
               cpp.pending_c_function_body.extend(')')
            end
         end
         if arguments /= Void then
            if uc or else no_check or else ace.profile then
               cpp.pending_c_function_body.extend(',')
            end
            cpp.put_arguments(arguments.count)
         end
         cpp.pending_c_function_body.extend(')')
         if not uc and then tcbd then
            cpp.pending_c_function_body.extend(')')
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

feature {C_PRETTY_PRINTER, GC_HANDLER, CECIL_POOL}
   c_set_dump_stack_top (ds, comment: STRING) is
      do
         cpp.set_dump_stack_top_for(type_of_current, ds, comment)
      end

feature {LIVE_TYPE}
   prepare_introspection (put_else: BOOLEAN): BOOLEAN is
      require
         cpp.pending_c_function
         ace.no_check
      do
         Result := put_else
      ensure
         put_else implies Result
      end

   prepare_introspection2 (put_coma: BOOLEAN): BOOLEAN is
      require
         cpp.pending_c_function
         ace.no_check
      do
         Result := put_coma
      ensure
         put_coma implies Result
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

feature {}
   frozen put_c_name_tag is
      require
         ace.no_check
      local
         fn: FEATURE_NAME; tag: STRING
      do
         --|*** Afficher tous les synonymes avec une boucle ??? ***.
         fn := base_feature.first_name
         if not fn.is_simple_feature_name then
            tag := name.infix_or_prefix
            if tag /= Void then
               cpp.pending_c_function_body.extend('%"')
               cpp.pending_c_function_body.append(tag)
               cpp.pending_c_function_body.extend(' ')
               cpp.pending_c_function_body.extend('%"')
            end
            manifest_string_pool.string_to_c_code(name.to_string, cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "%" (%"")
         end
         tag := fn.infix_or_prefix
         if tag /= Void then
            cpp.pending_c_function_body.extend('%"')
            cpp.pending_c_function_body.append(tag)
            cpp.pending_c_function_body.extend(' ')
            cpp.pending_c_function_body.extend('%"')
         end
         manifest_string_pool.string_to_c_code(fn.to_string, cpp.pending_c_function_body)
         cpp.pending_c_function_body.extend('%"')
         cpp.pending_c_function_body.extend(' ')
         cpp.pending_c_function_body.append(type_of_current.name.to_string)
         if not fn.is_simple_feature_name then
            cpp.pending_c_function_body.extend(')')
         end
         cpp.pending_c_function_body.extend('%"')
      end

feature {}
   c_frame_descriptor is
         -- Initialize all `c_frame_descriptor' variables accordingly.
      require
         ace.no_check
      local
         c_frame_descriptor_format, c_frame_descriptor_locals: STRING; t: TYPE_MARK
      do
         c_frame_descriptor_format := cpp.c_frame_descriptor_format
         c_frame_descriptor_locals := cpp.c_frame_descriptor_locals
         c_frame_descriptor_format.clear_count
         c_frame_descriptor_locals.clear_count
         if use_current then
            type_of_current.canonical_type_mark.c_frame_descriptor_in(c_frame_descriptor_format)
         end
         if arguments /= Void then
            arguments.c_frame_descriptor(type_of_current, c_frame_descriptor_format, c_frame_descriptor_locals)
         end
         if is_once_function then
            t := result_type
            c_frame_descriptor_locals.append(once "(void**)&")
            once_routine_pool.unique_result_in(c_frame_descriptor_locals, base_feature)
            c_frame_descriptor_locals.extend(',')
            c_frame_descriptor_format.append(as_result)
            t.c_frame_descriptor_in(c_frame_descriptor_format)
         elseif result_type /= Void then
            t := result_type
            c_frame_descriptor_locals.append(once "(void**)&R,")
            c_frame_descriptor_format.append(as_result)
            t.c_frame_descriptor_in(c_frame_descriptor_format)
         end
         if local_vars /= Void then
            local_vars.c_frame_descriptor(type_of_current, c_frame_descriptor_format, c_frame_descriptor_locals)
         end
      end

   define_c_signature is
      require
         type_of_current.live_type.at_run_time
         cpp.pending_c_function
      local
         no_check, profile: BOOLEAN
      do
         no_check := ace.no_check
         profile := ace.profile 
         -- Define heading of corresponding C function.
         -- Extra comment to debug C code :
         cpp.pending_c_function_signature.append(once "/*")
         cpp.pending_c_function_signature.append(type_of_current.name.to_string)
         cpp.pending_c_function_signature.append(once "*/")
         --
         if result_type = Void then
            cpp.pending_c_function_signature.append(once "void")
         else
            result_type.c_type_for_result_in(cpp.pending_c_function_signature)
         end
         cpp.pending_c_function_signature.append(once " r")
         type_of_current.live_type.id.append_in(cpp.pending_c_function_signature)
         name.mapping_c_in(cpp.pending_c_function_signature)
         cpp.pending_c_function_signature.extend('(')
         if no_check then
            cpp.pending_c_function_signature.append(once "se_dump_stack*caller")
            if profile or else use_current or else arguments /= Void then
               cpp.pending_c_function_signature.extend(',')
            end
         end
         if profile then
            cpp.pending_c_function_signature.append(once "se_local_profile_t*parent_profile")
            if use_current or else arguments /= Void then
               cpp.pending_c_function_signature.extend(',')
            end
         end
         if use_current then
            type_of_current.canonical_type_mark.c_type_for_target_in(cpp.pending_c_function_signature)
            cpp.pending_c_function_signature.append(once " C")
            if arguments /= Void then
               cpp.pending_c_function_signature.extend(',')
            end
         end
         if arguments = Void then
            if no_check or else profile then
            elseif not use_current then
               cpp.pending_c_function_signature.append(once "void")
            end
         else
            arguments.compile_to_c_in(type_of_current, cpp.pending_c_function_signature)
         end
         cpp.pending_c_function_signature.extend(')')
      ensure
         cpp.pending_c_function
      end

   old_list: FAST_ARRAY[E_OLD]
         -- Non Void when `ensure_assertion' actually has "old" expression.

   c_define_opening is
         -- Define opening section in C function.
      local
         t: TYPE_MARK; no_check: BOOLEAN; lt: LIVE_TYPE; rf: RUN_FEATURE;
         clc, i, result_type_id, class_invariant_flag: INTEGER
         internal_c_local: INTERNAL_C_LOCAL
      do
         smart_eiffel.push_context(base_feature)
         no_check := ace.no_check
         if no_check then
            c_frame_descriptor
         end
         -- (0) --------------------------- Exception handling :
         if rescue_compound /= Void then
            cpp.pending_c_function_body.append(once "struct rescue_context rc;%N")
         end
         -- (1) -------------------- Local variable for Result:
         if result_type /= Void then
            if not is_once_function then
               t := result_type
               t.c_type_for_result_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.append(once " R=")
               t.c_initialize_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.append(once ";%N")
            end
         end
         -- (2) ----------------------- User's local variables:
         if local_vars /= Void then
            local_vars.c_declare(type_of_current, rescue_compound /= Void)
         end
         -- (3) ------------------- Local variables for profile:
         if ace.profile then
            smart_eiffel.local_profile
         end
         if no_check then
            -- (4) ------------------------------- Prepare locals:
            clc := cpp.c_frame_descriptor_format.occurrences('%%')
            if clc > 0 then
               clc := clc #// 2
               if use_current then
                  clc := clc - 1
               end
            end
            if clc > 0 then
               cpp.pending_c_function_body.append(once "void**locals[")
               clc.append_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.append(once "];%N")
            end
            -- (5) ----------------------------------- Prepare ds:
            c_initialize_frame_information(clc)
            -- (6) ------------------------ Initialise Dump Stack:
            c_set_dump_stack_top(once "&ds", once "link")
         end
         -- (7) ---------------------------------- Add profile:
         if ace.profile then
            smart_eiffel.start_profile(Current)
         end
         -- (8) --------------------- Execute old expressions:
         if old_list /= Void then
            from
               i := old_list.upper
            until
               i < old_list.lower
            loop
               old_list.item(i).compile_to_c_old_memory(type_of_current)
               i := i - 1
            end
         end
         -- (9) -------------------------- Exception handling :
         if rescue_compound /= Void then
            cpp.pending_c_function_body.append(once "handle(SE_HANDLE_EXCEPTION_SET,NULL);if(SETJMP(rc.jb)!=0){/*rescue*/%N")
            rescue_compound.compile_to_c(type_of_current)
            cpp.pending_c_function_body.append(once "internal_exception_handler(Routine_failure);%N}%N")
         end
         -- (10) ------------ Initialize Result/local expanded :
         if result_type /= Void then
            if result_type.is_user_expanded then
               lt := result_type.type.live_type
               rf := lt.default_create_run_feature
               if rf /= Void then
                  internal_c_local := cpp.pending_c_function_lock_local(lt.type, once "resexp")
                  result_type_id := lt.id
                  internal_c_local.append_in(cpp.pending_c_function_body)
                  cpp.pending_c_function_body.append(once "=M")
                  result_type_id.append_in(cpp.pending_c_function_body)
                  cpp.pending_c_function_body.append(once ";%N")
                  cpp.push_create_instruction(type_of_current, rf, Void, internal_c_local)
                  rf.mapping_c
                  cpp.pop
                  if is_once_function then
                     once_routine_pool.unique_result_in(cpp.pending_c_function_body, base_feature)
                  else
                     cpp.pending_c_function_body.append(once "R")
                  end
                  cpp.pending_c_function_body.extend('=')
                  internal_c_local.append_in(cpp.pending_c_function_body)
                  cpp.pending_c_function_body.append(once ";%N")
                  internal_c_local.unlock
               end
               -- Even when there is no default creation procedure to apply, we must call the class 
               -- invariant:
               class_invariant_flag := cpp.class_invariant_call_opening(lt.type, True)
               if class_invariant_flag > 0 then
                  if result_type.need_c_struct then
                     cpp.pending_c_function_body.extend('&')
                  end
                  if is_once_function then
                     once_routine_pool.unique_result_in(cpp.pending_c_function_body, base_feature)
                  else
                     cpp.pending_c_function_body.extend('R')
                  end
                  cpp.class_invariant_call_closing(class_invariant_flag, True)
               end
            end
         end
         if local_vars /= Void then
            local_vars.initialize_expanded(type_of_current)
         end
         -- (11) --------------------------- Retry start label :
         if rescue_compound /= Void then
            cpp.pending_c_function_body.append(once "retry_tag:%N")
         end
         -- (12) ---------------------- Require assertion code :
         if type_of_current.class_text.require_check and then require_assertion /= Void then
            require_assertion.compile_to_c(type_of_current)
         end
         -- (13) ------------------------- Save rescue context :
         if rescue_compound /= Void then
            cpp.pending_c_function_body.append(once "rc.next = rescue_context_top;%N%
                           %rescue_context_top = &rc;%N")
            if no_check then
               cpp.pending_c_function_body.append(once "rc.top_of_ds=&ds;%N")
               c_set_dump_stack_top(once "&ds", once "link")
            end
         end
      end

   c_define_closing is
         -- Define closing section in the corresponding C function (code for ensure checking, free memory of
         -- expanded, run stack pop, etc.).
      do
         -- (1) --------------------------- Ensure Check Code:
         if ensure_assertion /= Void then
            ensure_assertion.compile_to_c(type_of_current)
         end
         -- (2) ----------------------------- Class Invariant:
         if use_current then
            if name.to_string /= as_dispose then
               cpp.current_class_invariant(type_of_current)
            end
         end
         -- (3) ---------------------------------- For rescue:
         if rescue_compound /= Void then
            cpp.pending_c_function_body.append(once "rescue_context_top = rc.next;handle(SE_HANDLE_EXCEPTION_CLEAR,NULL);%N")
         end
         -- (4) ------------------------------- Run Stack Pop:
         if ace.no_check then
            c_set_dump_stack_top(once "caller", once "unlink")
         end
         -- (5) ------------------------------------ Profiling:
         if ace.profile then
            smart_eiffel.stop_profile
         end
         smart_eiffel.pop_context(base_feature)
      end

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
               i := old_list.upper
            until
               i < old_list.lower
            loop
               old_list.item(i).compile_to_jvm_old(type_of_current)
               i := i - 1
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

   c_initialize_frame_information (c_locals_count: INTEGER) is
      require
         ace.no_check
      local
         c_frame_descriptor_format, c_frame_descriptor_locals: STRING; i, j: INTEGER; c: CHARACTER
      do
         c_frame_descriptor_format := cpp.c_frame_descriptor_format
         c_frame_descriptor_locals := cpp.c_frame_descriptor_locals
         cpp.pending_c_function_body.append(once "static se_frame_descriptor fd={")
         put_c_name_tag
         cpp.pending_c_function_body.extend(',')
         if use_current then
            cpp.pending_c_function_body.extend('1')
         else
            cpp.pending_c_function_body.extend('0')
         end
         cpp.pending_c_function_body.extend(',')
         c_locals_count.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once ",%"")
         cpp.pending_c_function_body.append(c_frame_descriptor_format)
         cpp.pending_c_function_body.append(once "%",1};%Nse_dump_stack ds;%Nds.fd=&fd;%N%
             %ds.current=")
         if use_current then
            cpp.pending_c_function_body.append(once "(void*)&C")
         else
            cpp.pending_c_function_body.append(once "(void*)0")
         end
         cpp.pending_c_function_body.append(once ";%N")
         cpp.put_position_in_ds(start_position)
         cpp.pending_c_function_body.append(once "ds.caller=caller;%N")
         if c_locals_count <= 0 then
            cpp.pending_c_function_body.append(once "ds.locals=NULL;%N")
         else
            cpp.pending_c_function_body.append(once "ds.locals=locals;%N")
         end
         cpp.pending_c_function_body.append(once "ds.exception_origin=NULL;%N")
         from
            j := 1
         until
            i = c_locals_count
         loop
            cpp.pending_c_function_body.append(once "locals[")
            i.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "]=")
            from
               c := c_frame_descriptor_locals.item(j)
            until
               c = ','
            loop
               cpp.pending_c_function_body.extend(c)
               j := j + 1
               c := c_frame_descriptor_locals.item(j)
            end
            j := j + 1
            cpp.pending_c_function_body.append(once ";%N")
            i := i + 1
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
