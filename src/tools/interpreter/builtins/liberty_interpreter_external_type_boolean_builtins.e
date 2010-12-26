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
class LIBERTY_INTERPRETER_EXTERNAL_TYPE_BOOLEAN_BUILTINS

inherit
   LIBERTY_INTERPRETER_EXTERNAL_TYPED_BUILTINS[BOOLEAN]
      redefine
         call_implies, call_or_else, call_and_then
      end

creation {LIBERTY_INTERPRETER_EXTERNAL_BUILTIN_CALL}
   make

feature {LIBERTY_FEATURE_LOCAL_CONTEXT}
   call_implies (f: LIBERTY_FEATURE) is
      do
         if not left then
            returned := interpreter.new_boolean(True, builtin_call.position)
         elseif right then
            returned := interpreter.new_boolean(True, builtin_call.position)
         else
            returned := interpreter.new_boolean(False, builtin_call.position)
         end
      end

   call_or_else (f: LIBERTY_FEATURE) is
      do
         if left then
            returned := interpreter.new_boolean(True, builtin_call.position)
         elseif right then
            returned := interpreter.new_boolean(True, builtin_call.position)
         else
            returned := interpreter.new_boolean(False, builtin_call.position)
         end
      end

   call_and_then (f: LIBERTY_FEATURE) is
      do
         if not left then
            returned := interpreter.new_boolean(False, builtin_call.position)
         elseif right then
            returned := interpreter.new_boolean(True, builtin_call.position)
         else
            returned := interpreter.new_boolean(False, builtin_call.position)
         end
      end

end -- class LIBERTY_INTERPRETER_EXTERNAL_TYPE_BOOLEAN_BUILTINS
