-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_CONTEXT

insert
   GLOBALS

create {RUNNER}
   make

feature {RUNNER_FACET}
   features: RUNNER_FEATURES
   instructions: RUNNER_INSTRUCTIONS
   expressions: RUNNER_EXPRESSIONS

feature {RUNNER}
   call (rf: RUN_FEATURE) is
      local
         inst: INSTRUCTION
      do
         from
            rf.accept(features)
         until
            instructions_list.is_empty
         loop
            inst := instructions_list.first
            instructions_list.remove_first
            inst.accept(instructions)
         end
      end

feature {RUNNER_FACET}
   add_instruction (a_instruction: INSTRUCTION) is
      require
         a_instruction /= Void
      do
         instructions_list.add_first(a_instruction)
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
         added_first_in_good_order: (create {ZIP[INSTRUCTION, INTEGER]}.make(a_instructions,
                                                                             instructions_list.lower |..| (instructions_list.lower + a_instructions.count - 1))
                                     ).for_all(agent (inst: INSTRUCTION; i: INTEGER): BOOLEAN is
                                               do
                                                  Result := inst = instructions_list.item(i)
                                               end)
      end

feature {}
   make is
      do
         create instructions_list.make(1, 0)
         create features.make(Current)
         create instructions.make(Current)
         create expressions.make(Current)
      end

   instructions_list: RING_ARRAY[INSTRUCTION]

   instruction_is_not_void: PREDICATE[TUPLE[INSTRUCTION]] is
      once
         Result := agent (inst: INSTRUCTION): BOOLEAN is do Result := inst /= Void end
      ensure
         Result /= Void
      end

invariant
   instructions_list /= Void
   instructions_list.for_all(instruction_is_not_void)

end -- class RUNNER_CONTEXT
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
