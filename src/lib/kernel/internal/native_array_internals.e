-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class NATIVE_ARRAY_INTERNALS[E_]
   --
   -- NATIVE_ARRAY_INTERNALS plays the same role as TYPED_INTERNALS, except they describe NATIVE_ARRAY's.
   --

inherit
   TYPED_INTERNALS[NATIVE_ARRAY[E_]]
      rename make_blank as make_empty,
         for_object as for_empty
      redefine object_attribute, type_attribute_name, type_attribute_generating_type, type_attribute_generator, set_object_attribute,
         type_attribute_count, type_attribute_is_expanded, type_is_native_array, type_can_be_assigned_to_attribute
      end

create {}
   for_object

create {INTERNALS_HANDLER}
   make_blank

feature {INTERNALS_HANDLER, INTERNALS} -- Getting information about the described object's type
   type_is_native_array: BOOLEAN True

   type_attribute_is_expanded (i: INTEGER): BOOLEAN
      do
         Result := type_item_is_expanded
      end

   type_item_is_expanded: BOOLEAN
      external "built_in"
      end

   type_can_be_assigned_to_attribute (other: INTERNALS; i: INTEGER): BOOLEAN
      do
         Result := type_can_be_assigned_to_item(other)
      end

   type_can_be_assigned_to_item (other: INTERNALS): BOOLEAN
      external "built_in"
      end

feature {INTERNALS_HANDLER}
   for_object (native_array: like object_memory; capacity_: like capacity)
         -- Attach `Current' to `native_array'
      require
         native_array.is_null = (capacity_ = 0)
         correct_generating_type(native_array)
      do
         object_memory := native_array
         capacity := capacity_
         set_object_can_be_retrieved
      ensure
         object_can_be_retrieved
         object = native_array
         capacity = capacity_
      end

   make_blank (capacity_: like capacity)
         -- Attach `Current' to a blank object: all items of the object have their default value
         -- (references are Void, INTEGERs are 0, BOOLEANs are False, etc)
      external "built_in"
      ensure
         object_can_be_modified
         capacity = capacity_
      end

feature {INTERNALS_HANDLER} -- Getting information about the type's attributes
   type_attribute_count: INTEGER
      external "built_in"
      ensure
         Result = capacity or Result = 0
      end

   capacity: INTEGER

   type_attribute_name (i: INTEGER): STRING
      do
         Result := once ""
         Result.copy(once "item(")
         i.append_in(Result)
         Result.extend(')')
      end

   type_attribute_generator (i: INTEGER): STRING
      do
         Result := type_item_generator
      end

   type_item_generator: STRING
      external "built_in"
      end

   type_attribute_generating_type (i: INTEGER): STRING
      do
         Result := type_item_generating_type
      end

   type_item_generating_type: STRING
      external "built_in"
      end

feature {INTERNALS_HANDLER} -- Accessing the object's attributes
   object_attribute (i: INTEGER): INTERNALS
      external "built_in"
      end

   set_object_attribute (element: INTERNALS; i: INTEGER)
      external "built_in"
      end

invariant
   type_generator.is_equal(once "NATIVE_ARRAY")

end -- class NATIVE_ARRAY_INTERNALS
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
