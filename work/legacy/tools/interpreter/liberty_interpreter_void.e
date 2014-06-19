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
class LIBERTY_INTERPRETER_VOID

inherit
   LIBERTY_INTERPRETER_OBJECT
      redefine
         as_target, is_void, builtin_deep_twin
      end

create {LIBERTY_INTERPRETER, LIBERTY_INTERPRETER_VOID}
   make

feature {ANY}
   type: LIBERTY_KNOWN_TYPE

   is_void: BOOLEAN True

   hash_code: INTEGER 31

   is_equal (other: LIBERTY_INTERPRETER_OBJECT): BOOLEAN
      do
         Result := other.is_void
      end

   converted_to (target_type: LIBERTY_ACTUAL_TYPE): LIBERTY_INTERPRETER_OBJECT
      require else
         True
      do
         create {LIBERTY_INTERPRETER_VOID} Result.make(interpreter, target_type, position)
      end

   as_target (a_position: LIBERTY_POSITION): like Current
      do
         interpreter.fatal_error("Call on Void target", a_position)
         Result := Current
      end

feature {LIBERTY_INTERPRETER_EXTERNAL_TYPE_ANY_BUILTINS} -- Standard builtings
   builtin_is_equal (other: LIBERTY_INTERPRETER_OBJECT; a_position: LIBERTY_POSITION): BOOLEAN
      do
         Result := other.is_void
      end

   builtin_standard_is_equal (other: LIBERTY_INTERPRETER_OBJECT; a_position: LIBERTY_POSITION): BOOLEAN
      do
         Result := other.is_void
      end

   builtin_copy (other: LIBERTY_INTERPRETER_OBJECT; a_position: LIBERTY_POSITION)
      do
         interpreter.fatal_error("Call on Void target", a_position)
      end

   builtin_twin (a_position: LIBERTY_POSITION): like Current
      do
         interpreter.fatal_error("Call on Void target", a_position)
      end

   builtin_standard_copy (other: LIBERTY_INTERPRETER_OBJECT; a_position: LIBERTY_POSITION)
      do
         interpreter.fatal_error("Call on Void target", a_position)
      end

   builtin_standard_twin (a_position: LIBERTY_POSITION): like Current
      do
         interpreter.fatal_error("Call on Void target", a_position)
      end

   builtin_deep_twin (a_position: LIBERTY_POSITION): like Current
      do
         interpreter.fatal_error("Call on Void target", a_position)
      end

feature {LIBERTY_INTERPRETER_OBJECT_PRINTER, LIBERTY_INTERPRETER_FEATURE_CALL}
   show_stack (o: OUTPUT_STREAM; indent: INTEGER)
      do
         o.put_line(once "Void")
      end

feature {LIBERTY_INTERPRETER_OBJECT}
   do_deep_twin (deep_twin_memory: DICTIONARY[LIBERTY_INTERPRETER_OBJECT, LIBERTY_INTERPRETER_OBJECT]; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT
      do
         Result := Current
      end

   do_deep_equal (object: LIBERTY_INTERPRETER_OBJECT; deep_equal_memory: SET[LIBERTY_INTERPRETER_OBJECT]; a_position: LIBERTY_POSITION): BOOLEAN
      do
         Result := object.is_void
      end

feature {}
   expanded_twin: like Current
      do
         Result := Current
      end

   make (a_interpreter: like interpreter; a_type: like type; a_position: like position)
      require
         a_interpreter /= Void
         a_type /= Void
         a_position /= Void
      do
         interpreter := a_interpreter
         type := a_type
         position := a_position
      ensure
         interpreter = a_interpreter
         type = a_type
         position = a_position
      end

invariant
   type /= Void

end -- class LIBERTY_INTERPRETER_VOID
