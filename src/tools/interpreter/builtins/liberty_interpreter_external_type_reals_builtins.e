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
deferred class LIBERTY_INTERPRETER_EXTERNAL_TYPE_REALS_BUILTINS[E_ -> FLOAT]

inherit
   LIBERTY_INTERPRETER_EXTERNAL_TYPED_BUILTINS[E_]
      undefine
         target, left, right
      redefine
         call_add, call_subtract, call_times, call_divide, call_power,
         call_less_or_equal, call_less_than, call_greater_or_equal, call_greater_than,
         call_negative,
         call_other
      end

feature {}
   new_real (value: E_): LIBERTY_INTERPRETER_OBJECT_NATIVE[REAL_128] is
      deferred
      end

   right_as_integer: INTEGER is
      local
         obj: LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_64]
      do
         builtin_call.evaluate_parameters
         obj ::= builtin_call.parameters.first
         Result := obj.item.to_integer_32
      end

   call_specific (f: LIBERTY_FEATURE) is
      deferred
      end

feature {LIBERTY_FEATURE_LOCAL_CONTEXT}
   call_add (f: LIBERTY_FEATURE) is
      do
         returned := new_real(left + right)
      end

   call_subtract (f: LIBERTY_FEATURE) is
      do
         returned := new_real(left - right)
      end

   call_times (f: LIBERTY_FEATURE) is
      do
         returned := new_real(left * right)
      end

   call_divide (f: LIBERTY_FEATURE) is
      do
         returned := new_real(left / right)
      end

   call_less_or_equal (f: LIBERTY_FEATURE) is
      do
         returned := interpreter.new_boolean(left <= right, builtin_call.position)
      end

   call_less_than (f: LIBERTY_FEATURE) is
      do
         returned := interpreter.new_boolean(left < right, builtin_call.position)
      end

   call_greater_or_equal (f: LIBERTY_FEATURE) is
      do
         returned := interpreter.new_boolean(left >= right, builtin_call.position)
      end

   call_greater_than (f: LIBERTY_FEATURE) is
      do
         returned := interpreter.new_boolean(left > right, builtin_call.position)
      end

   call_negative (f: LIBERTY_FEATURE) is
      do
         returned := new_real(-target)
      end

   call_power (f: LIBERTY_FEATURE) is
      do
         returned := new_real(left ^ right_as_integer)
      end

   call_other (f: LIBERTY_FEATURE) is
      do
         inspect
            builtin_call.name
         when "is_not_a_number" then
            returned := interpreter.new_boolean(target.is_not_a_number, builtin_call.position)
         when "is_infinity" then
            returned := interpreter.new_boolean(target.is_infinity, builtin_call.position)
         when "is_subnormal" then
            returned := interpreter.new_boolean(target.is_subnormal, builtin_call.position)
         when "is_normal" then
            returned := interpreter.new_boolean(target.is_normal, builtin_call.position)
         when "rounded" then
            returned := new_real(target.rounded)
         when "floor" then
            returned := new_real(target.floor)
         when "ceiling" then
            returned := new_real(target.ceiling)
         when "sqrt" then
            returned := new_real(target.sqrt)
         when "sin" then
            returned := new_real(target.sin)
         when "cos" then
            returned := new_real(target.cos)
         when "tan" then
            returned := new_real(target.tan)
         when "asin" then
            returned := new_real(target.asin)
         when "acos" then
            returned := new_real(target.acos)
         when "atan" then
            returned := new_real(target.atan)
         when "atan2" then
            returned := new_real(target.atan2(right))
         when "sinh" then
            returned := new_real(target.sinh)
         when "cosh" then
            returned := new_real(target.cosh)
         when "tanh" then
            returned := new_real(target.tanh)
         when "exp" then
            returned := new_real(target.exp)
         when "log" then
            returned := new_real(target.log)
         when "log10" then
            returned := new_real(target.log10)
         when "pow" then
            returned := new_real(target.pow(right))
         else
            call_specific(f)
         end
      end

end -- class LIBERTY_INTERPRETER_EXTERNAL_TYPE_REALS_BUILTINS
