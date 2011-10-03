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
         debug
            std_output.put_line(" -> " + rf.name.to_string)
         end
         empty_watermark.set(0)
         execute_until(empty_watermark)
         debug
            std_output.put_line(" <- " + rf.name.to_string)
         end
      end

feature {RUNNER_FACET}
   watermark: RUNNER_FRAME_WATERMARK is
      do
         Result.set(instructions_list.count)
      end

   execute_until (a_watermark: like watermark) is
      local
         inst: INSTRUCTION
      do
         from
         until
            instructions_list.count <= a_watermark.item
         loop
            inst := instructions_list.last
            instructions_list.remove_last
            processor.instructions.execute(inst)
         end
      end

feature {RUNNER_FACET}
   processor: RUNNER_PROCESSOR
   rf: RUN_FEATURE
   caller: RUNNER_FRAME

   target: RUNNER_OBJECT

   arguments: TRAVERSABLE[RUNNER_OBJECT] is
      do
         Result := arguments_memory
         if Result = Void then
            Result := arguments_factory.item([])
            arguments_memory := Result
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
         a_return.type.can_be_assigned_to(type_of_result)
      do
         return := expand(a_return)
      ensure
         return.is_equal(a_return)
      end

   set_local_object (a_name: ABSTRACT_STRING; a_value: RUNNER_OBJECT) is
      require
         has_local(a_name)
      do
         debug
            std_output.put_line(a_name + " := " + a_value.out)
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
      end

   has_local (a_name: ABSTRACT_STRING): BOOLEAN is
      do
         Result := locals /= Void and then locals.fast_has(a_name.intern)
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
            set_return(processor.default_expanded(type_of_result))
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

   locals: HASHED_DICTIONARY[RUNNER_OBJECT, FIXED_STRING]
   return_ref: REFERENCE[RUNNER_OBJECT]

   arguments_factory: FUNCTION[TUPLE, TRAVERSABLE[RUNNER_OBJECT]]
   arguments_memory: TRAVERSABLE[RUNNER_OBJECT]

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

   rf.type_of_current = target.type
   processor = target.processor

end -- class RUNNER_FRAME
