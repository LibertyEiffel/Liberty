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
class LIBERTY_INTERPRETER_NATIVE_ARRAY_CREATOR

inherit
   LIBERTY_TYPE_VISITOR

create {LIBERTY_INTERPRETER}
   make

feature {LIBERTY_INTERPRETER}
   new_array (type: like array_type; a_capacity: INTEGER; a_position: like position): LIBERTY_INTERPRETER_NATIVE_ARRAY is
      do
         array_type := type
         capacity := a_capacity
         position := a_position
         elements := default_pointer
         check
            type.parameters.count = 1
         end
         type.parameters.first.known_type.accept(Current)
         Result := last_created
      ensure
         Result.type = type
      end

   from_external (type: like array_type; a_capacity: INTEGER; a_elements: POINTER; a_position: like position): LIBERTY_INTERPRETER_NATIVE_ARRAY is
      do
         array_type := type
         capacity := a_capacity
         position := a_position
         elements := a_elements
         check
            type.parameters.count = 1
         end
         type.parameters.first.known_type.accept(Current)
         Result := last_created
      end

feature {LIBERTY_UNIVERSE}
   visit_type_any (type: LIBERTY_ACTUAL_TYPE) is
      do
         check False end
      end

   visit_type_arguments (type: LIBERTY_ACTUAL_TYPE) is
      do
         create {LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED[LIBERTY_INTERPRETER_OBJECT]} last_created.make(interpreter, array_type, type, elements, capacity, position)
      end

   visit_type_platform (type: LIBERTY_ACTUAL_TYPE) is
      do
         check False end
      end

   visit_type_pointer (type: LIBERTY_ACTUAL_TYPE) is
      do
         create {LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED[POINTER]} last_created.make(interpreter, array_type, type, elements, capacity, position)
      end

   visit_type_integer_64 (type: LIBERTY_ACTUAL_TYPE) is
      do
         create {LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED[INTEGER_64]} last_created.make(interpreter, array_type, type, elements, capacity, position)
      end

   visit_type_integer_32 (type: LIBERTY_ACTUAL_TYPE) is
      do
         create {LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED[INTEGER_64]} last_created.make(interpreter, array_type, type, elements, capacity, position)
      end

   visit_type_integer_16 (type: LIBERTY_ACTUAL_TYPE) is
      do
         create {LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED[INTEGER_64]} last_created.make(interpreter, array_type, type, elements, capacity, position)
      end

   visit_type_integer_8 (type: LIBERTY_ACTUAL_TYPE) is
      do
         create {LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED[INTEGER_64]} last_created.make(interpreter, array_type, type, elements, capacity, position)
      end

   visit_type_real_64 (type: LIBERTY_ACTUAL_TYPE) is
      do
         create {LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED[REAL_128]} last_created.make(interpreter, array_type, type, elements, capacity, position)
      end

   visit_type_real_32 (type: LIBERTY_ACTUAL_TYPE) is
      do
         create {LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED[REAL_128]} last_created.make(interpreter, array_type, type, elements, capacity, position)
      end

   visit_type_real_80 (type: LIBERTY_ACTUAL_TYPE) is
      do
         create {LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED[REAL_128]} last_created.make(interpreter, array_type, type, elements, capacity, position)
      end

   visit_type_real_128 (type: LIBERTY_ACTUAL_TYPE) is
      do
         create {LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED[REAL_128]} last_created.make(interpreter, array_type, type, elements, capacity, position)
      end

   visit_type_character (type: LIBERTY_ACTUAL_TYPE) is
      do
         create {LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED[CHARACTER]} last_created.make(interpreter, array_type, type, elements, capacity, position)
      end

   visit_type_string (type: LIBERTY_ACTUAL_TYPE) is
      do
         create {LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED[LIBERTY_INTERPRETER_OBJECT]} last_created.make(interpreter, array_type, type, elements, capacity, position)
      end

   visit_type_boolean (type: LIBERTY_ACTUAL_TYPE) is
      do
         create {LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED[BOOLEAN]} last_created.make(interpreter, array_type, type, elements, capacity, position)
      end

   visit_type_native_array (type: LIBERTY_ACTUAL_TYPE) is
      do
         interpreter.fatal_error("Don't try to make NATIVE_ARRAY[NATIVE_ARRAY]!!!", position)
      end

   visit_type_tuple (type: LIBERTY_ACTUAL_TYPE) is
      do
         create {LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED[TUPLE]} last_created.make(interpreter, array_type, type, elements, capacity, position)
      end

   visit_type_routine (type: LIBERTY_ACTUAL_TYPE) is
      do
         create {LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED[LIBERTY_INTERPRETER_AGENT]} last_created.make(interpreter, array_type, type, elements, capacity, position)
      end

   visit_type_procedure (type: LIBERTY_ACTUAL_TYPE) is
      do
         create {LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED[LIBERTY_INTERPRETER_AGENT]} last_created.make(interpreter, array_type, type, elements, capacity, position)
      end

   visit_type_function (type: LIBERTY_ACTUAL_TYPE) is
      do
         create {LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED[LIBERTY_INTERPRETER_AGENT]} last_created.make(interpreter, array_type, type, elements, capacity, position)
      end

   visit_type_predicate (type: LIBERTY_ACTUAL_TYPE) is
      do
         create {LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED[LIBERTY_INTERPRETER_AGENT]} last_created.make(interpreter, array_type, type, elements, capacity, position)
      end

   visit_user_type (type: LIBERTY_ACTUAL_TYPE) is
      do
         create {LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED[LIBERTY_INTERPRETER_OBJECT]} last_created.make(interpreter, array_type, type, elements, capacity, position)
      end

feature {LIBERTY_VOID_TYPE}
   visit_void (type: LIBERTY_VOID_TYPE) is
      do
         check False end
      end

feature {}
   make (a_interpreter: like interpreter) is
      require
         a_interpreter /= Void
      do
         interpreter := a_interpreter
      ensure
         interpreter = a_interpreter
      end

   last_created: LIBERTY_INTERPRETER_NATIVE_ARRAY
   interpreter: LIBERTY_INTERPRETER

   position: LIBERTY_POSITION
   array_type: LIBERTY_ACTUAL_TYPE
   capacity: INTEGER
   elements: POINTER

   native_array_creator: LIBERTY_INTERPRETER_NATIVE_ARRAY_CREATOR

invariant
   interpreter /= Void
   native_array_creator /= Void

end -- class LIBERTY_INTERPRETER_NATIVE_ARRAY_CREATOR
