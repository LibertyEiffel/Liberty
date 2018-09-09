-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class INTERNALS
   --
   -- INTERNALS serves as a gateway between the typed ideal world of Eiffel objects and the untyped physical
   -- world of raw memory, files on disks, streams on networks...
   --
   -- All instances of INTERNALS must be of type TYPED_INTERNALS. Each INTERNALS object describes the physical
   -- structure of exactly one type. For instance, TYPED_INTERNALS[STRING] describes the physical structure of
   -- class STRING.
   --
   -- Optionally, an object of an INTERNAL's associated type can be attached to that INTERNAL. The INTERNAL
   -- can then be used to inspect and change the values of the attributes of the attached object.  For
   -- instance, a STRING could be attached to a TYPED_INTERNALS[STRING]. The TYPED_INTERNALS[STRING] could
   -- then be used to get or set this STRING's attributes.
   --
   -- This class is meant as a very basic building block. Please read the following advice to use INTERNALS
   -- wisely:
   --
   -- # Don't use INTERNALS
   --
   -- # If rule 1 is inapplicable, use INTERNALS to build a higher-level abstraction, and use that abstraction
   -- in your application. You really don't want INTERNALS scattered around your application code.
   --

feature {INTERNALS_HANDLER, INTERNALS} -- Getting information about the described object's type
   type_generator: STRING
         -- Name of the base class of the type described by `Current'. For instance, if `Current' is a
         -- TYPED_INTERNALS[ARRAY[INTEGER]], `type_generator' is "ARRAY".
      deferred
      end

   type_generating_type: STRING
         -- Name of the type described by `Current'. For instance, if `Current' is a
         -- TYPED_INTERNALS[ARRAY[INTEGER]], `type_generating_type' is "ARRAY[INTEGER]".
      deferred
      end

   type_is_expanded: BOOLEAN
         -- Is the type described by `Current' expanded?
      deferred
      end

   type_is_native_array: BOOLEAN
         -- Is the type described by `Current' a NATIVE_ARRAY?
      do
      ensure
         Result = type_generator.is_equal(once "NATIVE_ARRAY")
      end

   type_attribute_is_expanded (i: INTEGER): BOOLEAN
         -- Is the type of the `i'th attribute expanded?
      require
         i.in_range(1, type_attribute_count)
      deferred
      end

   type_can_be_assigned_to_attribute (other: INTERNALS; i: INTEGER): BOOLEAN
         -- Can the object attached to `other' be assigned to the `i'th attribute?
      require
         i.in_range(1, type_attribute_count)
      deferred
      ensure
         other = Void implies Result = not type_attribute_is_expanded(i)
      end

feature {INTERNALS_HANDLER} -- Getting information about the type's attributes
   type_attribute_count: INTEGER
         -- Number of attributes of the type described by `Current'
      deferred
      end

   type_attribute_name (i: INTEGER): STRING
         -- Name of the `i'th attribute of the type described by `Current'.
      require
         i.in_range(1, type_attribute_count)
      deferred
      ensure
         Result /= Void
      end

   type_attribute_generator (i: INTEGER): STRING
         -- Name of the base class of the `i'th attribute of the type described by `Current'.
      require
         i.in_range(1, type_attribute_count)
      deferred
      ensure
         Result /= Void
      end

   type_attribute_generating_type (i: INTEGER): STRING
         -- Name of the type of the `i'th attribute of the type described by `Current'.
      require
         i.in_range(1, type_attribute_count)
      deferred
      ensure
         Result /= Void
      end

feature {INTERNALS_HANDLER} -- Accessing the object
   object_as_pointer: POINTER
         -- Pointer to the object currently attached to `Current'.
      require
         type_is_expanded implies type_generator.is_equal(once "NATIVE_ARRAY")
      deferred
      ensure
         Result.is_not_null
      end

feature {INTERNALS_HANDLER} -- Accessing the object's attributes
   object_attribute (i: INTEGER): INTERNALS
         -- Read the `i'th attribute of the type described by `Current' (also see `type_attribute'). If this
         -- attribute is attached to an object, then `Result' is also attached to that object
      require
         i.in_range(1, type_attribute_count)
      deferred
      ensure
         type_attribute_is_expanded(i) implies Result /= Void
      end

   set_object_attribute (element: INTERNALS; i: INTEGER)
         -- Write the `i'th attribute of the type described by `Current'
      require
         i.in_range(1, type_attribute_count)
         type_can_be_assigned_to_attribute(element, i)
         object_can_be_modified
      deferred
      ensure
         element = Void implies object_attribute(i) = Void
         element /= Void implies object_attribute(i).is_equal(element)
      end

   object_can_be_retrieved: BOOLEAN
         -- Can the object be retrieved by the rest of the system through `object'?

   object_can_be_modified: BOOLEAN
         -- Can the object be modified through `set_object_attribute', i.e. is it safely isolated from the rest of
         -- the system?
      do
         Result := not object_can_be_retrieved
      ensure
         Result = not object_can_be_retrieved
      end

   set_object_can_be_retrieved
         -- Forbid further modification of the object through `set_object_attribute', so that it can safely be
         -- released into the system.
         -- Note that the embedded object is notified via its `internals_can_be_retrieved' feature.
      deferred
      ensure
         object_can_be_retrieved
      end

end -- class INTERNALS
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
