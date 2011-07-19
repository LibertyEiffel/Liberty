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
deferred class LIBERTY_INTERPRETER_NATIVE_ARRAY

inherit
   LIBERTY_INTERPRETER_OBJECT
      export {LIBERTY_INTERPRETER_NATIVE_ARRAY}
         interpreter
      undefine
         out_in_tagged_out_memory, copy
      end

feature {ANY}
   type: LIBERTY_ACTUAL_TYPE
   item_type: LIBERTY_ACTUAL_TYPE

   put (o: LIBERTY_INTERPRETER_OBJECT; index: INTEGER) is
      require
         valid_index(index)
      deferred
      end

   valid_index (index: INTEGER): BOOLEAN is
      do
         Result := index.in_range(lower, upper)
      end

   item (index: INTEGER): LIBERTY_INTERPRETER_OBJECT is
      require
         valid_index(index)
      deferred
      end

   first: LIBERTY_INTERPRETER_OBJECT is
      deferred
      end

   last: LIBERTY_INTERPRETER_OBJECT is
      deferred
      end

   lower: INTEGER is
      deferred
      end

   upper: INTEGER is
      deferred
      end

   count: INTEGER is
      deferred
      end

   is_empty: BOOLEAN is
      deferred
      end

   converted_to (target_type: LIBERTY_ACTUAL_TYPE): LIBERTY_INTERPRETER_OBJECT is
      do
         not_yet_implemented
      end

feature {LIBERTY_INTERPRETER_TO_EXTERNAL}
   to_external: POINTER is
      deferred
      end

feature {LIBERTY_INTERPRETER_NATIVE_ARRAY_CREATOR}
   from_external (a_external: POINTER; a_capacity: INTEGER) is
      deferred
      end

feature {LIBERTY_INTERPRETER_EXTERNAL_TYPE_NATIVE_ARRAY_BUILTINS}
   builtin_element_sizeof: INTEGER is
      deferred
      end

   builtin_calloc (capacity: INTEGER; a_position: LIBERTY_POSITION): like Current is
      deferred
      end

   builtin_item (index: INTEGER; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT is
      do
         if not valid_index(index) then
            interpreter.fatal_error("Invalid index: " + index.out, a_position)
         else
            Result := item(index)
         end
      end

   builtin_put (element: LIBERTY_INTERPRETER_OBJECT; index: INTEGER; a_position: LIBERTY_POSITION) is
      do
         if not valid_index(index) then
            interpreter.fatal_error("Invalid index: " + index.out, a_position)
         else
            put(element, index)
         end
      end

   builtin_slice_copy (at: INTEGER; src: like Current; src_min, src_max: INTEGER) is
      deferred
      end

feature {LIBERTY_INTERPRETER_OBJECT_PRINTER, LIBERTY_INTERPRETER_FEATURE_CALL}
   show_stack (o: OUTPUT_STREAM; indent: INTEGER) is
      deferred
      end

end -- class LIBERTY_INTERPRETER_NATIVE_ARRAY
