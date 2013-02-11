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
class LIBERTY_INTERPRETER_EXTERNAL_TYPE_PLATFORM_BUILTINS

insert
   LIBERTY_INTERPRETER_EXTERNAL_BUILTINS_CALLER
   PLATFORM

creation {LIBERTY_INTERPRETER_EXTERNAL_BUILTIN_CALL}
   make

feature {LIBERTY_INTERPRETER_EXTERNAL_BUILTIN_CALL}
   call (builtin_call: LIBERTY_INTERPRETER_FEATURE_CALL): LIBERTY_INTERPRETER_OBJECT is
      do
         last_call_failed := False
         inspect
            builtin_call.name
         when "Minimum_character_code" then
            Result := interpreter.new_integer_16(Minimum_character_code, builtin_call.position)
         when "Maximum_character_code" then
            Result := interpreter.new_integer_16(Maximum_character_code, builtin_call.position)
         when "Minimum_real" then
            Result := interpreter.new_real_64(Minimum_real, builtin_call.position)
         when "Maximum_real" then
            Result := interpreter.new_real_64(Maximum_real, builtin_call.position)
         when "Minimum_real_64" then
            Result := interpreter.new_real_64(Minimum_real_64, builtin_call.position)
         when "Maximum_real_64" then
            Result := interpreter.new_real_64(Maximum_real_64, builtin_call.position)
         when "Minimum_real_80" then
            not_yet_implemented
         when "Maximum_real_80" then
            not_yet_implemented
         when "Boolean_bits" then
            Result := interpreter.new_integer(Boolean_bits, builtin_call.position)
         when "Character_bits" then
            Result := interpreter.new_integer(Character_bits, builtin_call.position)
         when "Integer_bits" then
            Result := interpreter.new_integer(Integer_bits, builtin_call.position)
         when "Pointer_bits" then
            Result := interpreter.new_integer(Pointer_bits, builtin_call.position)
         else
            last_call_failed := True
         end
      end

feature {}
   do_die_with_code (status: LIBERTY_INTERPRETER_OBJECT) is
      local
         sts: LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_64]
      do
         sts ::= status
         die_with_code(sts.item.to_integer_32)
      end

end -- class LIBERTY_INTERPRETER_EXTERNAL_TYPE_PLATFORM_BUILTINS
