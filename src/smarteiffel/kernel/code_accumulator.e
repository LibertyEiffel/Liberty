-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CODE_ACCUMULATOR
   --
   -- This accumulator is a singleton used to inline dynamic dispatch.
   --

insert
   SINGLETON
   GLOBALS
      undefine is_equal
      end

create {ANY}
   make

feature {}
   code_stack: FAST_ARRAY[FAST_ARRAY[CODE]]

feature {CODE, EFFECTIVE_ARG_LIST, FEATURE_CALL, EFFECTIVE_ROUTINE}
   context_level: INTEGER

   open_new_context
         -- Start a new context, usually at INSTRUCTION boundary.
      do
         context_level := context_level + 1
         if code_stack.valid_index(context_level) then
            current_context := code_stack.item(context_level)
            current_context.clear_count
         else
            create current_context.with_capacity(12)
            code_stack.add_last(current_context)
         end
      ensure
         current_context.count = 0
      end

   current_context: FAST_ARRAY[CODE]
         -- The top-most context.

   close_current_context
         -- Get the CODE of the top-most context and pop.
      require
         context_level >= 0
      do
         context_level := context_level - 1
         if context_level >= code_stack.lower then
            current_context := code_stack.item(context_level)
         else
            current_context := Void
         end
      end

   current_context_to_instruction: INSTRUCTION
         -- Transform the whole `current_context' into some INSTRUCTION.
      do
         if current_context.is_empty then
            -- No code.
         else
            if current_context.count = 1 then
               Result := current_context.last.to_instruction
            else
               check
                  current_context.count > 1
               end
               create {COMPOUND} Result.from_list(current_context)
            end
            current_context.clear_count
         end
      ensure
         current_context.count = 0
      end

   current_context_to_expression: EXPRESSION
         -- Transform the whole `current_context' into some EXPRESSION.
      require
         current_context.count > 0
      do
         if current_context.count = 1 then
            Result := current_context.last.to_expression
         else
            create {COMPOUND_EXPRESSION} Result.from_list(current_context)
         end
         current_context.clear_count
      ensure
         Result /= Void
         current_context.count = 0
      end

   sedb_counter: INTEGER

   add_sedb (position: POSITION; info_code: CHARACTER)
         -- Where `info_code' is an extra argument passed to the "sedb" C function (see
         -- SmartEiffel/sys/runtime/c/sedb.c for documentation).
      require
         not position.is_unknown
         ; (once "NSX").has(info_code)
      do
         if not ace.boost then
            if (not current_context.is_empty) and then ({SEDB} ?:= current_context.last.to_instruction) then
               -- Well, one is largely enough!
            else
               sedb_counter := sedb_counter + 1
               current_context.add_last(create {SEDB}.make(position, info_code))
            end
         end
      end

feature {SMART_EIFFEL}
   echo_information
      do
         if sedb_counter = 0 then
            echo.put_string(once "No SEDB objects added.%N")
         else
            echo.print_count(once "SEDB object", sedb_counter)
         end
         echo.print_count(once "CODE_ACCUMULATOR code_stack", code_stack.count)
      end

feature {AGENT_CREATION, CECIL_ENTRY, ADDRESS_OF}
   current_context_to_code: CODE
         -- Transform the whole `current_context' into some CODE.
      do
         if current_context.is_empty then
            -- No code.
         elseif {EXPRESSION} ?:= current_context.last then
            Result := current_context_to_expression
         else
            Result := current_context_to_instruction
         end
      ensure
         current_context.count = 0
      end

feature {}
   make
      do
         create code_stack.with_capacity(128)
         context_level := -1
      end

invariant
   context_level.in_range(-1, code_stack.upper)

   context_level.in_range(0, code_stack.upper) implies (current_context = code_stack.item(context_level))

end -- class CODE_ACCUMULATOR
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
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
