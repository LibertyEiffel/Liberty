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
         inst: INSTRUCTION
      do
         debug
            std_output.put_line(" -> " + rf.name.to_string)
         end
         from
         until
            instructions_list.is_empty
         loop
            inst := instructions_list.last
            instructions_list.remove_last
            processor.instructions.execute(inst)
         end
         debug
            std_output.put_line(" <- " + rf.name.to_string)
         end
      end

feature {RUNNER_FACET}
   processor: RUNNER_PROCESSOR
   rf: RUN_FEATURE
   caller: RUNNER_FRAME

   target: RUNNER_OBJECT
   arguments: TRAVERSABLE[RUNNER_OBJECT]

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
   set_return (a_return: like return) is
      require
         type_of_result /= Void
      do
         return := expand(a_return)
      ensure
         return.is_equal(a_return)
      end

   set_local_object (a_name: ABSTRACT_STRING; a_value: RUNNER_OBJECT) is
      do
         locals.put(a_value, a_name.intern)
      ensure
         local_object(a_name) = a_value
      end

   local_object (a_name: ABSTRACT_STRING): RUNNER_OBJECT is
      do
         Result := locals.fast_reference_at(a_name.intern)
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
   make (a_processor: like processor; a_caller: like caller; a_target: like target; a_arguments: like arguments; a_rf: like rf) is
      require
         a_processor /= Void
         a_target /= Void
         a_rf /= Void
      do
         processor := a_processor
         caller := a_caller
         target := a_target
         arguments := a_arguments
         rf := a_rf
         create locals.make
         create instructions_list.make(1, 0)
      ensure
         processor = a_processor
         caller = a_caller
         target = a_target
         arguments = a_arguments
         rf = a_rf
      end

   locals: HASHED_DICTIONARY[RUNNER_OBJECT, FIXED_STRING]
   return_ref: REFERENCE[RUNNER_OBJECT]

   instructions_list: RING_ARRAY[INSTRUCTION]

   instruction_is_not_void: PREDICATE[TUPLE[INSTRUCTION]] is
      once
         Result := agent (inst: INSTRUCTION): BOOLEAN is do Result := inst /= Void end
      ensure
         Result /= Void
      end

invariant
   target /= Void
   locals /= Void
   rf /= Void

   instructions_list.for_all(instruction_is_not_void)

   rf.type_of_current = target.type
   processor = target.processor

end -- class RUNNER_FRAME
