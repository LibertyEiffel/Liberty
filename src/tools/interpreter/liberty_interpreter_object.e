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
deferred class LIBERTY_INTERPRETER_OBJECT

inherit
   LIBERTY_EXPRESSION
      redefine
         is_equal
      end
   HASHABLE

insert
   ARRAYED_COLLECTION_HANDLER

feature {ANY}
   is_void: BOOLEAN is False

   is_equal (other: LIBERTY_INTERPRETER_OBJECT): BOOLEAN is
      deferred
      end

   result_type: LIBERTY_TYPE is
      do
         Result := type
      end

   type: LIBERTY_KNOWN_TYPE is
         -- the actual dynamic type of the object
      deferred
      end

   is_open: BOOLEAN is False

   is_between (lower, upper: LIBERTY_INTERPRETER_OBJECT; a_position: LIBERTY_POSITION): BOOLEAN is
      local
         fd: LIBERTY_FEATURE_DEFINITION
         cmp: LIBERTY_INTERPRETER_OBJECT_NATIVE[BOOLEAN]
      do
         fd := type.feature_definition(le_feature_name)
         cmp ::= interpreter.item_feature(lower, fd, {FAST_ARRAY[LIBERTY_INTERPRETER_OBJECT] << Current >> }, a_position)
         if cmp.item then
            cmp ::= interpreter.item_feature(Current, fd, {FAST_ARRAY[LIBERTY_INTERPRETER_OBJECT] << upper >> }, a_position)
            Result := cmp.item
         end
      end

   as_target (a_position: LIBERTY_POSITION): like Current is
         -- Current when used as a target
      do
         Result := Current
      ensure
         Result = Current
      end

   as_right_value: like Current is
         -- either Current or a twin depending on the storage class (expanded, reference, separate)
      do
         if type.is_expanded then
            Result := expanded_twin
         elseif type.is_separate then
            not_yet_implemented
         else
            Result := Current
         end
      ensure
         is_equal(Result)
      end

   converted_to (target_type: LIBERTY_ACTUAL_TYPE): LIBERTY_INTERPRETER_OBJECT is
      require
         type.converts_to(target_type)
      deferred
      ensure
         Result.type = target_type
      end

   specialized_in (a_type: LIBERTY_ACTUAL_TYPE): like Current is
      do
         check False end
         crash
      end

feature {LIBERTY_INTERPRETER_EXTERNAL_TYPE_ANY_BUILTINS} -- Standard builtings
   builtin_is_equal (other: LIBERTY_INTERPRETER_OBJECT; a_position: LIBERTY_POSITION): BOOLEAN is
      require
         not other.is_void
      deferred
      end

   builtin_standard_is_equal (other: LIBERTY_INTERPRETER_OBJECT; a_position: LIBERTY_POSITION): BOOLEAN is
      require
         not other.is_void
      deferred
      end

   builtin_is_deep_equal (other: LIBERTY_INTERPRETER_OBJECT; a_position: LIBERTY_POSITION): BOOLEAN is
      require
         not other.is_void
      local
         deep_equal_memory: SET[LIBERTY_INTERPRETER_OBJECT]
      do
         create {HASHED_SET[LIBERTY_INTERPRETER_OBJECT]} deep_equal_memory.make
         Result := do_deep_equal(other, deep_equal_memory, a_position)
      end

   builtin_copy (other: LIBERTY_INTERPRETER_OBJECT; a_position: LIBERTY_POSITION) is
      require
         not other.is_void
      deferred
      end

   builtin_twin (a_position: LIBERTY_POSITION): like Current is
      deferred
      end

   builtin_standard_copy (other: LIBERTY_INTERPRETER_OBJECT; a_position: LIBERTY_POSITION) is
      require
         not other.is_void
      deferred
      end

   builtin_standard_twin (a_position: LIBERTY_POSITION): like Current is
      deferred
      end

   builtin_deep_twin (a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT is
      local
         deep_twin_memory: DICTIONARY[LIBERTY_INTERPRETER_OBJECT, LIBERTY_INTERPRETER_OBJECT]
      do
         create {HASHED_DICTIONARY[LIBERTY_INTERPRETER_OBJECT, LIBERTY_INTERPRETER_OBJECT]} deep_twin_memory.make
         Result := do_deep_twin(deep_twin_memory, a_position)
      end

feature {LIBERTY_INTERPRETER_OBJECT}
   do_deep_twin (deep_twin_memory: DICTIONARY[LIBERTY_INTERPRETER_OBJECT, LIBERTY_INTERPRETER_OBJECT]; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT is
      require
         deep_twin_memory /= Void
      deferred
      end

   do_deep_equal (object: LIBERTY_INTERPRETER_OBJECT; deep_equal_memory: SET[LIBERTY_INTERPRETER_OBJECT]; a_position: LIBERTY_POSITION): BOOLEAN is
      require
         object /= Void
         deep_equal_memory /= Void
      deferred
      end

feature {LIBERTY_INTERPRETER_OBJECT_PRINTER, LIBERTY_INTERPRETER_FEATURE_CALL}
   show_stack (o: OUTPUT_STREAM; indent: INTEGER) is
      deferred
      end

feature {}
   expanded_twin: like Current is
      require
         type.is_expanded
      deferred
      ensure
         is_equal(Result)
      end

   interpreter: LIBERTY_INTERPRETER

   le_feature_name: LIBERTY_FEATURE_NAME is
      once
         create Result.infixed("<=".intern)
      end

feature {ANY}
   accept (visitor: VISITOR) is
      local
         v: LIBERTY_INTERPRETER_OBJECT_VISITOR
      do
         v ::= visitor
         v.visit_liberty_object(Current)
      end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
   mark_reachable_code (mark: INTEGER) is
      do
         check False end
      end

invariant
   type /= Void
   interpreter /= Void

end -- class LIBERTY_INTERPRETER_OBJECT
