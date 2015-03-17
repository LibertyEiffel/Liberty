-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
class LIBERTY_INTERPRETER_DEBUGGER_STEPS

create {LIBERTY_INTERPRETER_DEBUGGER}
   make

feature {LIBERTY_INTERPRETER}
   after (a_count: like count)
      require
         a_count > 0
      do
         count := a_count
      ensure
         count = a_count
      end

   at_call_entry
      do
         count := entry_count
      ensure
         count = entry_count
      end

   at_call_exit
      do
         count := exit_count
      ensure
         count = exit_count
      end

   step
      do
         if count > 0 then
            count := count - 1
            if count = 0 then
               interpreter.break
            end
         end
      end

feature {LIBERTY_INTERPRETER_FEATURE_CALL}
   enter_call
      do
         if count = entry_count then
            interpreter.break
         end
      end

   exit_call
      do
         if count = exit_count then
            interpreter.break
         end
      end

feature {}
   make (a_interpreter: like interpreter)
      require
         a_interpreter /= Void
      do
         interpreter := a_interpreter
      ensure
         interpreter = a_interpreter
      end

   interpreter: LIBERTY_INTERPRETER
   count: INTEGER

   entry_count: INTEGER -13
   exit_count: INTEGER -31

invariant
   interpreter /= Void
   count >= 0 or else count = entry_count or else count = exit_count

end -- class LIBERTY_INTERPRETER_DEBUGGER_STEPS
