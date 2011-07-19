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
class LIBERTY_INTERPRETER_EXTERNAL_TYPE_ARGUMENTS_BUILTINS

insert
   LIBERTY_INTERPRETER_EXTERNAL_BUILTINS_CALLER
   COMMAND_LINE_ARGUMENT_FACTORY

creation {LIBERTY_INTERPRETER_EXTERNAL_BUILTIN_CALL}
   make

feature {LIBERTY_INTERPRETER_EXTERNAL_BUILTIN_CALL}
   call (builtin_call: LIBERTY_INTERPRETER_FEATURE_CALL): LIBERTY_INTERPRETER_OBJECT is
      local
         index: INTEGER; argv: STRING
      do
         last_call_failed := False
         builtin_call.evaluate_parameters
         inspect
            builtin_call.name
         when "se_argc" then
            Result := interpreter.new_integer(remaining_parameters.item.count + 1, builtin_call.position)
         when "se_argv" then
            index := integer(builtin_call)
            if index = 0 then
               argv := root_class_and_feature
            else
               argv := remaining_parameters.item.item(index-1).out
            end
            Result := interpreter.new_string(argv, builtin_call.position)
         else
            last_call_failed := True
         end
      end

feature {}
   integer (builtin_call: LIBERTY_INTERPRETER_FEATURE_CALL): INTEGER is
      local
         obj: LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_64]
      do
         builtin_call.evaluate_parameters
         obj ::= builtin_call.parameters.first
         Result := obj.item.to_integer_32
      end

   root_class_and_feature: STRING is
      once
         Result := interpreter.root_type.full_name.out
         Result.extend('.')
         Result.append(interpreter.root_feature_name.full_name)
      end

end -- class LIBERTY_INTERPRETER_EXTERNAL_TYPE_ARGUMENTS_BUILTINS
