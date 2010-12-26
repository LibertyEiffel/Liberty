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
deferred class LIBERTY_INTERPRETER_EXTERNAL_BUILTINS_CALLER

feature {LIBERTY_INTERPRETER_EXTERNAL_BUILTIN_CALL}
   call (a_builtin_call: LIBERTY_INTERPRETER_FEATURE_CALL): LIBERTY_INTERPRETER_OBJECT is
      deferred
      ensure
         a_builtin_call.returned_static_type /= Void implies (Result /= Void or last_call_failed)
         Result /= Void implies not last_call_failed
      end

   last_call_failed: BOOLEAN

feature {}
   make (a_interpreter: like interpreter) is
      require
         a_interpreter /= Void
      do
         interpreter := a_interpreter
      ensure
         interpreter = a_interpreter
      end

   interpreter: LIBERTY_INTERPRETER

end -- class LIBERTY_INTERPRETER_EXTERNAL_BUILTINS_CALLER
