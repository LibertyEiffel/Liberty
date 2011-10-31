-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_FRAME

insert
   RUNNER_FACET

create {RUNNER_FEATURES}
   make

feature {RUNNER_FEATURES}
   execute is
      local
         empty_watermark: RUNNER_FRAME_WATERMARK
      do
         empty_watermark.set(0)
         position := processor.current_frame.rf.start_position
         execute_until(empty_watermark)
      end

   finished: BOOLEAN

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
            inst := instructions_list.last
            instructions_list.remove_last
            --|debug
            --|   std_output.put_new_line
            --|   std_output.put_line("(" + depth.out + ") " + rf.name.to_string + ":")
            --|   instructions_list.do_all(agent (i: INSTRUCTION) is
            --|                            do
            --|                               std_output.put_string(once "     + ")
            --|                               i.accept(displayer)
            --|                               std_output.put_new_line
            --|                            end)
            --|   std_output.put_string(once "  **** ")
            --|   inst.accept(displayer)
            --|   std_output.put_new_line
            --|end
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

feature {}
   raised_exception is
      do
         if exceptions.is_signal then
            processor.set_exception(exceptions.Os_signal, once "Internal error: OS signal #" + exceptions.signal_number.out)
         elseif exceptions.is_developer_named_exception then
            processor.set_exception(exceptions.System_level_type_error, once "Internal error: " + exceptions.developer_exception_name)
         else
            processor.set_exception(exceptions.System_level_type_error, once "Internal error: " + exceptions.exception_name)
         end
         sedb_breakpoint
      end

feature {RUNNER_FACET}
   processor: RUNNER_PROCESSOR
   rf: RUN_FEATURE
   caller: RUNNER_FRAME

   target: RUNNER_OBJECT

   depth: INTEGER is
      do
         if caller /= Void then
            Result := caller.depth + 1
         else
            Result := 1
         end
      end

   arguments: TRAVERSABLE[RUNNER_OBJECT] is
      do
         if arguments_set then
            Result := arguments_memory
         else
            Result := arguments_factory.item([])
            arguments_memory := Result
            arguments_set := True
         end
      end

   return: RUNNER_OBJECT

   type_of_current: TYPE is
      do
         Result := rf.type_of_current
      end

   type_of_result: TYPE is
      local
         tm: TYPE_MARK
      do
         tm := rf.result_type
         if tm /= Void then
            Result := tm.resolve_in(type_of_current)
         end
      end

   print_stack (stream: OUTPUT_STREAM) is
      require
         stream.is_connected
      local
         buffer: STRING
      do
         if caller /= Void then
            caller.print_stack(stream)
         end
         buffer := once ""
         buffer.copy(rf.name.to_string)
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
         --|debug
         --|   std_output.put_string("(" + depth.out + ") " + rf.name.to_string + ": Result := ")
         --|   if a_return = Void then
         --|      std_output.put_line("Void")
         --|      sedb_breakpoint
         --|   else
         --|      std_output.put_line(a_return.out)
         --|   end
         --|end
         return := expand(a_return)
      ensure
         return = a_return or else (type_of_result.is_expanded and then return.is_equal(a_return))
      end

   set_local_object (a_name: ABSTRACT_STRING; a_value: RUNNER_OBJECT) is
      require
         has_local(a_name)
      do
         locals.fast_put(expand(a_value), a_name.intern)
      ensure
         local_object(a_name) = a_value
      end

   local_object (a_name: ABSTRACT_STRING): RUNNER_OBJECT is
      require
         has_local(a_name)
      do
         Result := expand(locals.fast_reference_at(a_name.intern))
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
         --|debug
         --|   if a_value /= Void then
         --|      std_output.put_line("**** set internal: " + a_internal.hash_tag + " := " + a_value.out)
         --|   else
         --|      std_output.put_line("**** set internal: " + a_internal.hash_tag + " := Void")
         --|   end
         --|end
         internal_locals.fast_put(expand(a_value), a_internal.hash_tag)
      ensure
         internal_local_object(a_internal) = a_value
      end

   internal_local_object (a_internal: INTERNAL_LOCAL2): RUNNER_OBJECT is
      do
         if internal_locals /= Void then
            Result := expand(internal_locals.fast_reference_at(a_internal.hash_tag))
            --|debug
            --|   if Result /= Void then
            --|      std_output.put_line("**** get internal: " + a_internal.hash_tag + " = " + Result.out)
            --|   else
            --|      std_output.put_line("**** get internal: " + a_internal.hash_tag + " = Void")
            --|   end
            --|end
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
   make (a_processor: like processor; a_caller: like caller; a_target: like target; a_arguments_factory: like arguments_factory; a_rf: like rf) is
      require
         a_processor /= Void
         a_target /= Void
         a_arguments_factory /= Void
         a_rf /= Void
      do
         processor := a_processor
         caller := a_caller
         target := a_target
         arguments_factory := a_arguments_factory
         rf := a_rf
         initialize_locals
         create instructions_list.make(1, 0)
         if type_of_result /= Void and then type_of_result.is_expanded then
            return := processor.default_expanded(type_of_result)
         end
      ensure
         processor = a_processor
         caller = a_caller
         target = a_target
         arguments_factory = a_arguments_factory
         rf = a_rf
         a_rf.local_vars /= Void implies locals.count = a_rf.local_vars.count
         a_rf.local_vars = Void implies locals = Void
      end

   initialize_locals is
      local
         local_vars: LOCAL_VAR_LIST; local_name: LOCAL_NAME1; local_type: TYPE; i: INTEGER
      do
         local_vars := rf.local_vars
         if local_vars /= Void then
            create locals.with_capacity(local_vars.count)
            from
               i := 1
            until
               i > local_vars.count
            loop
               local_name := local_vars.name(i)
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

   arguments_factory: FUNCTION[TUPLE, TRAVERSABLE[RUNNER_OBJECT]]
   arguments_memory: TRAVERSABLE[RUNNER_OBJECT]
   arguments_set: BOOLEAN

   instructions_list: RING_ARRAY[INSTRUCTION]

   instruction_is_not_void: PREDICATE[TUPLE[INSTRUCTION]] is
      once
         Result := agent (inst: INSTRUCTION): BOOLEAN is do Result := inst /= Void end
      ensure
         Result /= Void
      end

invariant
   target /= Void
   rf /= Void

   arguments_factory /= Void

   instructions_list.for_all(instruction_is_not_void)

   --| **** TODO rf.type_of_current = target.type
   processor = target.processor

end -- class RUNNER_FRAME
