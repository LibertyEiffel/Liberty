-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class REPOSITORY_IMPL[O_ -> STORABLE]
   --
   -- Used to implement update and commit. Takes care of object references and cycles.
   --
   -- Update is usually event-driven; here are only tools to correctly create the objects layout (see
   -- `read_from_stream' and `update_from_stream').
   --
   -- Commit is, on the other hand, a method template with a few deferred methods (see `write_to_stream').
   --
   -- Vocabulary:
   --
   -- * layout: the description of the contents of an object (its layout). This object is referenced
   -- by a reference (see below).
   --
   -- * reference: a reference to an object. Note that the layout of the object MUST have been defined before
   -- any reference links to it. A special 'Void' ref indicates a Void object.
   --
   -- * embedded: a user-defined expanded object (i.e. not one of the basic objects)
   --
   -- * basic: a special expanded object, with a simple value, specially treated by the compiler and by this
   -- class. Basic types are INTEGER and co., READ and co., CHARACTER and BOOLEAN.
   --
   -- * array: a NATIVE_ARRAY of objects. The type is, in that particular case, the type of the items.
   --
   -- See also XML_REPOSITORY_IMPL
   --

inherit
   REPOSITORY[O_]

insert
   INTERNALS_HANDLER

feature {ANY} -- Error handling on repository update
   register_update_error_handler (a_error_handler: PROCEDURE[TUPLE[ABSTRACT_STRING, INTEGER, INTEGER]])
      do
         update_error_handlers.add_last(a_error_handler)
      end

feature {}
   update_error_handlers: FAST_ARRAY[PROCEDURE[TUPLE[ABSTRACT_STRING, INTEGER, INTEGER]]]

   fire_update_error (message: ABSTRACT_STRING; line, column: INTEGER)
      local
         i: INTEGER
      do
         breakpoint
         from
            i := update_error_handlers.lower
         until
            i > update_error_handlers.upper
         loop
            update_error_handlers.item(i).call([message, line, column])
            i := i + 1
         end
      end

feature {} -- Implementation of update
   solve_again: BOOLEAN

   update_layouts: STACK[REPOSITORY_LAYOUT]
      once
         create Result.make
      end

   updated_internals: AVL_DICTIONARY[INTERNALS, INTEGER]
      once
         create Result.make
      end

   internals_references: HASHED_DICTIONARY[INTEGER, POINTER]
      once
         create Result.make
      end

   layouts: FAST_ARRAY[REPOSITORY_LAYOUT]
      once
         create Result.make(0)
      end

   objects: AVL_DICTIONARY[INTEGER, STRING]
      once
         create Result.make
      end

   solve (ref: INTEGER): INTERNALS
      require
         ref > 0
      do
         Result := updated_internals.fast_reference_at(ref)
         if Result = Void then
            solve_again := True
         end
      end

   internals_reference (internals: INTERNALS): INTEGER
      require
         not internals.type_is_expanded
      local
         p: POINTER
      do
         p := internals.object_as_pointer
         if internals_references.fast_has(p) then
            Result := internals_references.fast_at(p)
         else
            Result := internals_references.count + 1 -- never 0 (is Void)
            internals_references.add(Result, p)
         end
      end

   solver: FUNCTION[TUPLE[INTEGER], INTERNALS]
      once
         Result := agent solve
      end

   read_from_stream (in_stream: INPUT_STREAM)
      local
         ref: INTEGER
      do
         repository.clear_count
         check
            update_layouts.is_empty
         end
         from
         until
            updated_internals.is_empty
         loop
            ref := updated_internals.key(updated_internals.lower)
            updated_internals.remove(ref)
         end
         update_from_stream(in_stream)
      end

   update_from_stream (in_stream: INPUT_STREAM)
      do
         register_transient_objects
         do_update(in_stream)
         unregister_transient_objects
         if not update_layouts.is_empty then
            fire_update_error(once "Some layouts are still to be consumed", last_line, last_column)
         end
      end

   last_line: INTEGER
      deferred
      end

   last_column: INTEGER
      deferred
      end

   do_update (in_stream: INPUT_STREAM)
      deferred
      end

   record_object (ref: INTEGER; name: STRING; line, column: INTEGER)
         -- Register the object as a high-level one, i.e. put it in the repository.
      local
         typed: TYPED_INTERNALS[O_]; error: STRING
      do
         if not updated_internals.has(ref) then
            error := once ""
            error.copy(once "Unknown reference: ")
            ref.append_in(error)
            fire_update_error(error, line, column)
         else
            typed ::= solve(ref)
            put(typed.object, name)
         end
      end

   check_non_empty_data (a_data, data_type: STRING; line, column: INTEGER)
      local
         error: STRING
      do
         if a_data = Void or else a_data.is_empty then
            error := once ""
            error.copy(once "Invalid empty ")
            error.append(data_type)
            error.append(once ": ")
            error.append(a_data)
            fire_update_error(error, line, column)
         end
      end

   open_repository (a_repository: REPOSITORY_LAYOUT; line, column: INTEGER)
      require
         a_repository.kind.is_equal(once "repository")
      do
         objects.clear_count
         layouts.clear_count
      end

   open_layout (a_type: STRING; a_ref: INTEGER; a_layout: REPOSITORY_LAYOUT; line, column: INTEGER)
      require
         a_layout.kind.is_equal(once "layout")
         a_ref > 0
      do
         check_non_empty_data(a_type, once "type", line, column)
         --check_non_empty_data(a_ref, once "ref", line, column)
         a_layout.set_type(a_type)
         a_layout.set_ref(a_ref)
      end

   open_reference (a_name: STRING; a_ref: INTEGER; a_reference: REPOSITORY_LAYOUT; line, column: INTEGER)
      require
         a_reference.kind.is_equal(once "reference")
         a_ref >= 0 -- 0 is Void
      do
         check_non_empty_data(a_name, once "name", line, column)
         --check_non_empty_data(a_ref, once "ref", line, column)
         a_reference.set_name(a_name)
         a_reference.set_ref(a_ref)
      end

   open_embedded (a_name, a_type: STRING; a_embedded: REPOSITORY_LAYOUT; line, column: INTEGER)
      require
         a_embedded.kind.is_equal(once "embedded")
      do
         check_non_empty_data(a_name, once "name", line, column)
         check_non_empty_data(a_type, once "type", line, column)
         a_embedded.set_name(a_name)
         a_embedded.set_type(a_type)
      end

   open_basic (a_name, a_type, a_value: STRING; a_basic: REPOSITORY_LAYOUT; line, column: INTEGER)
      require
         a_basic.kind.is_equal(once "basic")
      do
         check_non_empty_data(a_name, once "name", line, column)
         check_non_empty_data(a_type, once "type", line, column)
         check_non_empty_data(a_value, once "value", line, column)
         a_basic.set_name(a_name)
         a_basic.set_type(a_type)
         a_basic.set_value(a_value)
      end

   open_array (a_name, a_type: STRING; a_capacity: INTEGER; a_array: REPOSITORY_LAYOUT; line, column: INTEGER)
      require
         a_array.kind.is_equal(once "array")
      local
         error: STRING
      do
         check_non_empty_data(a_name, once "name", line, column)
         check_non_empty_data(a_type, once "type", line, column)
         if a_capacity < 0 then
            error := once ""
            error.copy(once "Invalid negative capacity: ")
            a_capacity.append_in(error)
            fire_update_error(error, line, column)
         end
         a_array.set_name(a_name)
         a_array.set_type(a_type)
         a_array.set_capacity(a_capacity)
      end

   close_repository (line, column: INTEGER)
      require
         update_layouts.top.kind.is_equal(once "repository")
      local
         layout: REPOSITORY_LAYOUT; internals: INTERNALS; i, c: INTEGER
      do
         update_layouts.pop
         check
            update_layouts.is_empty
         end
         from
            solve_again := True
            c := layouts.count
         variant
            c
         until
            not solve_again
         loop
            solve_again := False
            from
               i := layouts.lower
            until
               i > layouts.upper
            loop
               layout := layouts.item(i)
               check
                  layout.kind.is_equal(once "layout")
               end
               internals := layout.solve(solver)
               if internals = Void then
                  -- Cannot do anything, at this stage the object will never be found.
                  -- solve_again := True
               elseif updated_internals.has(layout.ref) then
                  check
                     internals = updated_internals.at(layout.ref)
                  end
               else
                  updated_internals.add(internals, layout.ref)
                  c := c - 1
               end
               i := i + 1
            end
         end
         from
            i := objects.lower
         until
            i > objects.upper
         loop
            record_object(objects.item(i), objects.key(i), line, column)
            i := i + 1
         end
      end

   close_layout (line, column: INTEGER)
      require
         update_layouts.top.kind.is_equal(once "layout")
      local
         layout: REPOSITORY_LAYOUT
      do
         layout := update_layouts.top
         update_layouts.pop
         layouts.add_last(layout)
      end

   close_reference (line, column: INTEGER)
      require
         update_layouts.top.kind.is_equal(once "reference")
      local
         layout: REPOSITORY_LAYOUT
      do
         layout := update_layouts.top
         update_layouts.pop
         if update_layouts.count = 1 then
            -- means only the "repository" node is open
            objects.add(layout.ref, layout.name)
         else
            update_layouts.top.add_layout(layout)
         end
      end

   close_embedded (line, column: INTEGER)
      require
         update_layouts.top.kind.is_equal(once "embedded")
      local
         layout: REPOSITORY_LAYOUT
      do
         layout := update_layouts.top
         update_layouts.pop
         update_layouts.top.add_layout(layout)
      end

   close_basic (line, column: INTEGER)
      require
         update_layouts.top.kind.is_equal(once "basic")
      local
         layout: REPOSITORY_LAYOUT
      do
         layout := update_layouts.top
         update_layouts.pop
         update_layouts.top.add_layout(layout)
      end

   close_array (line, column: INTEGER)
      require
         update_layouts.top.kind.is_equal(once "array")
      local
         layout: REPOSITORY_LAYOUT
      do
         layout := update_layouts.top
         update_layouts.pop
         update_layouts.top.add_layout(layout)
      end

feature {} -- Implementation of commit
   commit_map: SET[POINTER]
         -- Used when committing object not to commit them twice
      once
         create {HASHED_SET[POINTER]} Result.make
      end

   write_to_stream (out_stream: REPOSITORY_OUTPUT)
      require
         out_stream.is_connected
      local
         i: INTEGER; o: O_
      do
         register_transient_objects
         commit_map.clear_count
         internals_references.clear_count
         out_stream.start_write
         from
            i := lower
         until
            i > upper
         loop
            write_object(key(i), item(i), out_stream)
            i := i + 1
         end
         if o = Void then -- O_ is a reference type
            from
               i := lower
            until
               i > upper
            loop
               if item(i) /= Void then
                  write_layout(item(i).to_internals, out_stream)
               end
               i := i + 1
            end
         end
         out_stream.end_write
         unregister_transient_objects
      end

   write_object (name: like key; object: like item; out_stream: REPOSITORY_OUTPUT)
      local
         int: INTERNALS
      do
         if object /= Void then
            int := object.to_internals
         end
         write_internals(int, name, out_stream)
      end

   write_internals (int: INTERNALS; name: STRING; out_stream: REPOSITORY_OUTPUT)
      do
         if int /= Void and then int.type_is_expanded then
            write_expanded(int, name, out_stream)
         else
            write_reference_layout(int, name, out_stream)
         end
      end

   write_reference_layout (reference: INTERNALS; name: STRING; out_stream: REPOSITORY_OUTPUT)
      require
         reference /= Void implies not reference.type_is_expanded
      local
         ref: INTEGER; t_ref: STRING
      do
         if reference = Void then
            out_stream.write_reference(0, name)
         else
            t_ref := transient.reference(reference)
            if t_ref /= Void then
               out_stream.write_transient_reference(t_ref, name)
            else
               ref := internals_reference(reference)
               out_stream.write_reference(ref, name)
            end
         end
      end

   write_layout (layout: INTERNALS; out_stream: REPOSITORY_OUTPUT)
      require
         not commit_map.has(layout.object_as_pointer)
         not layout.type_is_expanded
      local
         i: INTEGER; int: INTERNALS; ref: INTEGER
      do
         -- Add the pointer to the map of "known objects" (those already written). It must be done first
         -- because of possible recursion
         commit_map.add(layout.object_as_pointer)
         if transient.reference(layout) = Void then
            -- Write the nested objects not already defined
            from
               i := 1
            until
               i > layout.type_attribute_count
            loop
               int := layout.object_attribute(i)
               if int /= Void then
                  if int.type_is_expanded then
                     if int.type_is_native_array then
                        write_array_fields_layouts(int, out_stream)
                     end
                  elseif not commit_map.has(int.object_as_pointer) then
                     write_layout(int, out_stream)
                  end
               end
               i := i + 1
            end
            ref := internals_reference(layout)
            out_stream.start_layout(ref, layout.type_generating_type)
            write_contents(layout, out_stream)
            out_stream.end_layout
         end
      ensure
         commit_map.has(layout.object_as_pointer)
      end

   write_contents (layout: INTERNALS; out_stream: REPOSITORY_OUTPUT)
      require
         layout.type_is_expanded or else transient.reference(layout) = Void
         not layout.type_is_native_array
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > layout.type_attribute_count
         loop
            write_internals(layout.object_attribute(i), layout.type_attribute_name(i), out_stream)
            i := i + 1
         end
      end

   write_array_contents (layout: INTERNALS; out_stream: REPOSITORY_OUTPUT)
      require
         layout.type_is_native_array
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > layout.type_attribute_count
         loop
            write_internals(layout.object_attribute(i), Void, out_stream)
            i := i + 1
         end
      end

   write_array_fields_layouts (array: INTERNALS; out_stream: REPOSITORY_OUTPUT)
      require
         array.type_is_expanded and then array.type_is_native_array
      local
         f: INTEGER; int: INTERNALS
      do
         from
            f := 1
         until
            f > array.type_attribute_count
         loop
            int := array.object_attribute(f)
            if int /= Void and then not int.type_is_expanded and then not commit_map.has(int.object_as_pointer) then
               write_layout(int, out_stream)
            end
            f := f + 1
         end
      end

   write_expanded (internals: INTERNALS; name: STRING; out_stream: REPOSITORY_OUTPUT)
      require
         internals.type_is_expanded
      local
         type: STRING
      do
         type := internals.type_generating_type
         inspect
            type
         when "CHARACTER" then
            out_stream.write_character_layout_object(internals, name)
         when "BOOLEAN" then
            out_stream.write_boolean_layout_object(internals, name)
         when "INTEGER_8" then
            out_stream.write_integer_8_layout_object(internals, name)
         when "INTEGER_16" then
            out_stream.write_integer_16_layout_object(internals, name)
         when "INTEGER" then
            out_stream.write_integer_layout_object(internals, name)
         when "INTEGER_32" then
            out_stream.write_integer_32_layout_object(internals, name)
         when "INTEGER_64" then
            out_stream.write_integer_64_layout_object(internals, name)
         when "REAL" then
            out_stream.write_real_layout_object(internals, name)
         when "REAL_32" then
            out_stream.write_real_32_layout_object(internals, name)
         when "REAL_64" then
            out_stream.write_real_64_layout_object(internals, name)
         when "REAL_80" then
            out_stream.write_real_80_layout_object(internals, name)
         when "REAL_128" then
            out_stream.write_real_128_layout_object(internals, name)
         when "REAL_EXTENDED" then
            out_stream.write_real_expanded_layout_object(internals, name)
         else
            if internals.type_is_native_array then
               write_array_layout_object(internals, name, out_stream)
            else
               write_embedded_layout_object(internals, name, out_stream)
            end
         end
      end

   write_array_layout_object (internals: INTERNALS; name: STRING; out_stream: REPOSITORY_OUTPUT)
      require
         internals.type_is_native_array
      do
         if internals.type_attribute_count > 0 then
            out_stream.start_array_layout(internals, name)
            write_array_contents(internals, out_stream)
            out_stream.end_array_layout(internals, name)
         end
      end

   write_embedded_layout_object (internals: INTERNALS; name: STRING; out_stream: REPOSITORY_OUTPUT)
      do
         out_stream.start_embedded_layout(internals, name)
         write_contents(internals, out_stream)
         out_stream.end_embedded_layout(internals, name)
      end

feature {} -- Internals
   layouts_pool: RECYCLING_POOL[REPOSITORY_LAYOUT]
      once
         create Result.make
      end

   new_layout (a_kind: STRING): REPOSITORY_LAYOUT
      do
         if layouts_pool.is_empty then
            create Result.make
         else
            Result := layouts_pool.item
         end
         check
            Result.is_clear
         end
         Result.set_kind(a_kind)
      ensure
         Result.kind.is_equal(a_kind)
      end

   release_layout (a_layout: REPOSITORY_LAYOUT)
      do
         layouts_pool.recycle(a_layout)
      end

   transient: REPOSITORY_TRANSIENT

feature {} -- Creation
   make
         -- Create a not-connected empty repository.
      do
         if repository = Void then
            create {LINKED_HASHED_DICTIONARY[O_, STRING]} repository.make
            create update_error_handlers.with_capacity(2)
         else
            repository.clear_count
            update_error_handlers.clear_count
         end
      end

feature {} -- Transient objects
   register_transient_objects
      deferred
      end

   unregister_transient_objects
      deferred
      end

end -- class REPOSITORY_IMPL
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
