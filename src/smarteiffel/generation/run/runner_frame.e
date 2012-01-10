-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class RUNNER_FRAME

insert
   RUNNER_FACET

feature {RUNNER_FEATURES}
   execute is
      local
         empty_watermark: RUNNER_FRAME_WATERMARK
      do
         empty_watermark.set(0)
         position := start_position
         execute_until(empty_watermark)
      end

   finished: BOOLEAN

   start_position: POSITION is
      deferred
      end

feature {RUNNER_FRAME}
   show_callstack is
      do
         if caller /= Void then
            caller.show_callstack
         end
         show_frame
      end

feature {RUNNER_FACET}
   processor: RUNNER_PROCESSOR
   caller: RUNNER_FRAME

   target: RUNNER_OBJECT

   depth: INTEGER

   name: FEATURE_NAME is
      deferred
      end

   arguments: TRAVERSABLE[RUNNER_OBJECT] is
      deferred
      end

   return: RUNNER_OBJECT

   feature_stamp: FEATURE_STAMP is
      deferred
      end

   formal_arguments: FORMAL_ARG_LIST is
      deferred
      end

   type_of_current: TYPE is
      deferred
      end

   type_of_result: TYPE is
      deferred
      end

   print_stack (stream: OUTPUT_STREAM) is
      require
         stream.is_connected
      do
         if caller /= Void then
            caller.print_stack(stream)
         end
         print_frame(stream)
      end

feature {RUNNER_FACET}
   position: POSITION

   watermark: RUNNER_FRAME_WATERMARK is
      do
         Result.set(instructions_list.count)
      end

   execute_until (a_watermark: like watermark) is
      local
         inst: INSTRUCTION
      do
         from
            finished := True
         until
            instructions_list.count <= a_watermark.item or else processor.exception /= Void
         loop
            debug ("run.callstack")
               std_output.put_line(once "%N~~8<~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~8<~~")
               show_callstack
               std_output.put_line(once "~~>8~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>8~~")
            end
            inst := instructions_list.last
            instructions_list.remove_last
            position := inst.start_position
            processor.instructions.execute(inst)
         end
      rescue
         raised_exception
         instructions_list.clear_count
         retry
      end

   set_retry is
      do
         processor.clear_exception
         finished := False
         instructions_list.clear_count
      end

feature {RUNNER_FACET}
   force_eval_arguments is
      local
         arg: like arguments
      do
         arg := arguments
      end

   set_return (a_return: like return) is
      require
         type_of_result /= Void
         a_return /= Void implies a_return.type.can_be_assigned_to(type_of_result)
         type_of_result.is_expanded implies a_return /= Void
      do
         debug ("run.data")
            std_output.put_string(once "(#(1)) #(2): Result := " # depth.out # name.to_string)
            if a_return = Void then
               std_output.put_line(once "Void")
            else
               std_output.put_line(a_return.out)
            end
         end
         return := expand(a_return)
      ensure
         return = a_return or else (type_of_result.is_expanded and then return.is_equal(a_return))
      end

   set_local_object (a_name: ABSTRACT_STRING; a_value: RUNNER_OBJECT) is
      require
         has_local(a_name)
      do
         debug ("run.data")
            if a_value /= Void then
               std_output.put_line(once "**** set local: #(1) := #(2)" # a_name # a_value.out)
            else
               std_output.put_line(once "**** set local: #(1) := Void" # a_name)
            end
         end
         locals.fast_put(expand(a_value), a_name.intern)
      ensure
         local_object(a_name) = a_value
      end

   local_object (a_name: ABSTRACT_STRING): RUNNER_OBJECT is
      require
         has_local(a_name)
      do
         Result := expand(locals.fast_reference_at(a_name.intern))
         debug ("run.data")
            if Result /= Void then
               std_output.put_line(once "**** get local: #(1) = #(2)" # a_name # Result.out)
            else
               std_output.put_line(once "**** get local: #(1) = Void" # a_name)
            end
         end
      end

   has_local (a_name: ABSTRACT_STRING): BOOLEAN is
      do
         Result := locals /= Void and then locals.fast_has(a_name.intern)
      end

   set_internal_local_object (a_internal: INTERNAL_LOCAL2; a_value: RUNNER_OBJECT) is
      do
         if internal_locals = Void then
            create internal_locals.make
         end
         debug ("run.data")
            if a_value /= Void then
               std_output.put_line("**** set internal: " + a_internal.hash_tag + " := " + a_value.out)
            else
               std_output.put_line("**** set internal: " + a_internal.hash_tag + " := Void")
            end
         end
         internal_locals.fast_put(expand(a_value), a_internal.hash_tag)
      ensure
         internal_local_object(a_internal) = a_value
      end

   internal_local_object (a_internal: INTERNAL_LOCAL2): RUNNER_OBJECT is
      do
         if internal_locals /= Void then
            Result := expand(internal_locals.fast_reference_at(a_internal.hash_tag))
            debug ("run.data")
               if Result /= Void then
                  std_output.put_line(once "**** get internal: #(1) = #(2)" # a_internal.hash_tag # Result.out)
               else
                  std_output.put_line(once "**** get internal: #(1) = Void" # a_internal.hash_tag)
               end
            end
         end
      end

   has_internal_local (a_internal: INTERNAL_LOCAL2): BOOLEAN is
      do
         Result := internal_locals /= Void and then internal_locals.fast_has(a_internal.hash_tag)
      end

feature {RUNNER_FACET}
   add_instruction (a_instruction: INSTRUCTION) is
      require
         a_instruction /= Void
      do
         instructions_list.add_last(a_instruction)
      end

   add_instructions (a_instructions: TRAVERSABLE[INSTRUCTION]) is
      require
         a_instructions /= Void
         a_instructions.for_all(instruction_is_not_void)
      local
         i: INTEGER
      do
         from -- backward loop by design
            i := a_instructions.upper
         until
            i < a_instructions.lower
         loop
            add_instruction(a_instructions.item(i))
            i := i - 1
         end
      ensure
         all_added: instructions_list.count = old instructions_list.count + a_instructions.count
         added_last_in_reverse_order: (create {ZIP[INSTRUCTION, INTEGER]}.make(a_instructions,
                                                                               1 |..| a_instructions.count)
                                       ).for_all(agent (inst: INSTRUCTION; i: INTEGER): BOOLEAN is
                                                 do
                                                    Result := inst = instructions_list.item(instructions_list.upper - i + 1)
                                                 end)
      end

feature {}
   show_frame is
      local
         frame_name: STRING
      do
         frame_name := once ""
         frame_name.clear_count
         name.complete_name_in(frame_name)
         std_output.put_line(once "(#(1)) {#(2)}.#(3):" # depth.out # target.type.name.to_string # frame_name)
         instructions_list.do_all(agent (i: INSTRUCTION) is
                                  do
                                     if i = instructions_list.last then
                                        std_output.put_string(once "     * ")
                                     else
                                        std_output.put_string(once "     - ")
                                     end
                                     i.accept(displayer)
                                     std_output.put_new_line
                                  end)
      end

   print_frame (stream: OUTPUT_STREAM) is
      require
         stream.is_connected
      local
         buffer: STRING
      do
         buffer := once ""
         buffer.copy(name.to_string)
         from
            buffer.add_last(' ')
         until
            buffer.count > 40
         loop
            buffer.add_last(' ')
         end
         buffer.add_last('-')
         buffer.add_last(' ')
         position.append_in(buffer)
         stream.put_line(buffer)
      end

feature {}
   make (a_processor: like processor; a_caller: like caller; a_target: like target) is
      require
         a_processor /= Void
         a_target /= Void
      do
         if a_caller /= Void then
            depth := a_caller.depth + 1
         end
         processor := a_processor
         caller := a_caller
         target := a_target
         initialize_locals
         create instructions_list.make(1, 0)
         if type_of_result /= Void and then type_of_result.is_expanded then
            return := processor.default_expanded(type_of_result)
         end
      ensure
         processor = a_processor
         caller = a_caller
         target = a_target
      end

   local_vars: LOCAL_VAR_LIST is
      deferred
      end

   initialize_locals is
      local
         lv: like local_vars; local_name: LOCAL_NAME1; local_type: TYPE; i: INTEGER
      do
         lv := local_vars
         if lv /= Void then
            create locals.with_capacity(lv.count)
            from
               i := 1
            until
               i > lv.count
            loop
               local_name := lv.name(i)
               local_type := local_name.result_type.resolve_in(type_of_current)
               if local_type.is_expanded then
                  locals.add(processor.default_expanded(local_type), local_name.to_string.intern)
               else
                  locals.add(Void, local_name.to_string.intern)
               end
               i := i + 1
            end
         end
      end

   locals, internal_locals: HASHED_DICTIONARY[RUNNER_OBJECT, FIXED_STRING]
   return_ref: REFERENCE[RUNNER_OBJECT]

   instructions_list: RING_ARRAY[INSTRUCTION]

   instruction_is_not_void: PREDICATE[TUPLE[INSTRUCTION]] is
      once
         Result := agent (inst: INSTRUCTION): BOOLEAN is do Result := inst /= Void end
      ensure
         Result /= Void
      end

   raised_exception is
      do
         if exceptions.is_signal then
            processor.set_exception(exceptions.Os_signal, once "Internal error: OS signal #" + exceptions.signal_number.out)
         elseif exceptions.is_developer_named_exception then
            processor.set_exception(exceptions.System_level_type_error, once "Internal error: " + exceptions.developer_exception_name)
         else
            processor.set_exception(exceptions.System_level_type_error, once "Internal error: " + exceptions.exception_name)
         end
      end

invariant
   target /= Void

   instructions_list.for_all(instruction_is_not_void)

   processor = target.processor

   caller /= Void implies depth = caller.depth + 1
   caller = Void implies depth = 0

end -- class RUNNER_FRAME
