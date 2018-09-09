-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class JSON_REPOSITORY_OUTPUT

inherit
   REPOSITORY_OUTPUT

insert
   JSON_HANDLER
   JSON_STRINGS

create {JSON_REPOSITORY_IMPL}
   make

feature {REPOSITORY_IMPL}
   is_connected: BOOLEAN
      do
         Result := out_stream.is_connected
      end

   start_write
      local
         shell_object: LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING]
      do
         check
            no_crumbs_in_stack: object_stack.is_empty
         end

         shell_object := {LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING] <<
            json_repository,      json_star;
            json_string(version), json_version;
         >>}
         create_object(shell_object)
         create references.make(0)
         shell_object.add(create {JSON_ARRAY}.make(references), json_refs)
         create text.make(shell_object)
      end

   end_write
      local
         encoder: JSON_ENCODER
      do
         check
            all_objects_popped: object_stack.is_empty
         end

         create encoder.make
         encoder.set_pretty(True)
         encoder.set_raw(True)
         encoder.encode_in(text, out_stream)
      end

   write_reference (ref: INTEGER; name: STRING)
      do
         current_object.add(create {JSON_NUMBER}.make(1, ref.to_natural_64, 0.to_natural_64, 0, 0), json_string(name))
      end

   write_transient_reference (ref, name: STRING)
      do
         current_object.add(json_ref, json_string(name))
      end

   start_layout (ref: INTEGER; type: STRING)
      local
         shell_object: LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING]
      do
         shell_object := {LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING] <<
            json_layout,       json_star;
            json_string(type), json_type;
         >>}
         shell_object.add(create {JSON_NUMBER}.make(1, ref.to_natural_64, 0.to_natural_64, 0, 0), json_ref)
         push_object(Void, ref, agent create_object(?), shell_object)
      end

   end_layout
      do
         pop_object
      end

   write_character_layout_object (internals: INTERNALS; name: STRING)
      local
         t: TYPED_INTERNALS[CHARACTER]; c: CHARACTER
      do
         t ::= internals
         c := t.object
         add_object(name, 0, {LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING] <<
            json_basic,              json_star;
            json_type_character,     json_type;
            json_string(c.code.out), json_value;
         >>})
      end

   write_boolean_layout_object (internals: INTERNALS; name: STRING)
      local
         t: TYPED_INTERNALS[BOOLEAN]; c: BOOLEAN
      do
         t ::= internals
         c := t.object
         add_object(name, 0, {LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING] <<
            json_basic,         json_star;
            json_type_boolean,  json_type;
            json_string(c.out), json_value;
         >>})
      end

   write_integer_8_layout_object (internals: INTERNALS; name: STRING)
      local
         t: TYPED_INTERNALS[INTEGER_8]; c: INTEGER_8
      do
         t ::= internals
         c := t.object
         add_object(name, 0, {LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING] <<
            json_basic,          json_star;
            json_type_integer_8, json_type;
            json_string(c.out),  json_value;
         >>})
      end

   write_integer_16_layout_object (internals: INTERNALS; name: STRING)
      local
         t: TYPED_INTERNALS[INTEGER_16]; c: INTEGER_16
      do
         t ::= internals
         c := t.object
         add_object(name, 0, {LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING] <<
            json_basic,           json_star;
            json_type_integer_16, json_type;
            json_string(c.out),   json_value;
         >>})
      end

   write_integer_32_layout_object (internals: INTERNALS; name: STRING)
      local
         t: TYPED_INTERNALS[INTEGER_32]; c: INTEGER_32
      do
         t ::= internals
         c := t.object
         add_object(name, 0, {LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING] <<
            json_basic,           json_star;
            json_type_integer_32, json_type;
            json_string(c.out),   json_value;
         >>})
      end

   write_integer_64_layout_object (internals: INTERNALS; name: STRING)
      local
         t: TYPED_INTERNALS[INTEGER_64]; c: INTEGER_64
      do
         t ::= internals
         c := t.object
         add_object(name, 0, {LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING] <<
            json_basic,           json_star;
            json_type_integer_64, json_type;
            json_string(c.out),   json_value;
         >>})
      end

   write_integer_layout_object (internals: INTERNALS; name: STRING)
      local
         t: TYPED_INTERNALS[INTEGER]; c: INTEGER
      do
         t ::= internals
         c := t.object
         add_object(name, 0, {LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING] <<
            json_basic,         json_star;
            json_type_integer,  json_type;
            json_string(c.out), json_value;
         >>})
      end

   write_real_32_layout_object (internals: INTERNALS; name: STRING)
      local
         t: TYPED_INTERNALS[REAL_32]; c: REAL_32
      do
         t ::= internals
         c := t.object
         add_object(name, 0, {LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING] <<
            json_basic,         json_star;
            json_type_real_32,  json_type;
            json_string(c.out), json_value;
         >>})
      end

   write_real_64_layout_object (internals: INTERNALS; name: STRING)
      local
         t: TYPED_INTERNALS[REAL_64]; c: REAL_64
      do
         t ::= internals
         c := t.object
         add_object(name, 0, {LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING] <<
            json_basic,         json_star;
            json_type_real_64,  json_type;
            json_string(c.out), json_value;
         >>})
      end

   write_real_80_layout_object (internals: INTERNALS; name: STRING)
      local
         t: TYPED_INTERNALS[REAL_80]; c: REAL_80
      do
         t ::= internals
         c := t.object
         add_object(name, 0, {LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING] <<
            json_basic,         json_star;
            json_type_real_80,  json_type;
            json_string(c.out), json_value;
         >>})
      end

   write_real_128_layout_object (internals: INTERNALS; name: STRING)
      local
         t: TYPED_INTERNALS[REAL_128]; c: REAL_128
      do
         t ::= internals
         c := t.object
         add_object(name, 0, {LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING] <<
            json_basic,          json_star;
            json_type_real_128,  json_type;
            json_string(c.out),  json_value;
         >>})
      end

   write_real_layout_object (internals: INTERNALS; name: STRING)
      local
         t: TYPED_INTERNALS[REAL]; c: REAL
      do
         t ::= internals
         c := t.object
         add_object(name, 0, {LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING] <<
            json_basic,         json_star;
            json_type_real,     json_type;
            json_string(c.out), json_value;
         >>})
      end

   write_real_expanded_layout_object (internals: INTERNALS; name: STRING)
      local
         t: TYPED_INTERNALS[REAL_EXTENDED]; c: REAL_EXTENDED
      do
         t ::= internals
         c := t.object
         add_object(name, 0, {LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING] <<
            json_basic,              json_star;
            json_type_real_expanded, json_type;
            json_string(c.out),      json_value;
         >>})
      end

   start_array_layout (array: INTERNALS; name: STRING)
      local
         shell_object: LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING]
      do
         shell_object := {LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING] <<
            json_array,                                          json_star;
            json_array_element_type(array.type_generating_type), json_type;
         >>}
         shell_object.add(create {JSON_NUMBER}.make(1, array.type_attribute_count.to_natural_64, 0.to_natural_64, 0, 0), json_capacity);
         push_object(name, 0, agent create_array(?), shell_object)
      end

   end_array_layout (array: INTERNALS; name: STRING)
      do
         pop_object
      end

   start_embedded_layout (layout: INTERNALS; name: STRING)
      do
         push_object(name, 0, agent create_object(?), {LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING] <<
            json_embedded,                            json_star;
            json_string(layout.type_generating_type), json_type;
         >>})
      end

   end_embedded_layout (layout: INTERNALS; name: STRING)
      do
         pop_object
      end

feature {}
   out_stream: OUTPUT_STREAM
   version: STRING
   text: JSON_OBJECT
   current_object: LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING]
   current_array: FAST_ARRAY[JSON_VALUE]
   references: FAST_ARRAY[JSON_VALUE]
   object_stack: STACK[TUPLE[LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING], FAST_ARRAY[JSON_VALUE]]]

   add_shell_object (name: STRING; ref: INTEGER; shell_object: LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING]; to_object: like current_object; to_array: like current_array)
      require
         ref >= 0
         shell_object /= Void
         name /= Void implies (to_object /= Void or to_array /= Void)
         to_object /= Void implies to_array = Void
         to_array /= Void implies to_object = Void
      do
         if ref > 0 then
            references.force(create {JSON_OBJECT}.make(shell_object), ref - 1)
         elseif to_array /= Void then
            to_array.add_last(create {JSON_OBJECT}.make(shell_object))
         else
            check
               to_object /= Void
            end
            to_object.add(create {JSON_OBJECT}.make(shell_object), json_string(name))
         end
      end

   add_object (name: STRING; ref: INTEGER; shell_object: LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING])
      require
         ref >= 0
         name /= Void implies (current_object /= Void xor current_array /= Void)
         shell_object /= Void
         not shell_object.has(json_data)
         not shell_object.has(json_refs)
      do
         add_shell_object(name, ref, shell_object, current_object, current_array)
      ensure
         object_stack.count = old object_stack.count
         current_object = old current_object
         --object_stack.is_empty or else object_stack.top = old object_stack.top
      end

   push_object (name: STRING; ref: INTEGER; agent_create: PROCEDURE[TUPLE[LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING]]]; shell_object: LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING])
      require
         name /= Void implies (current_object /= Void xor current_array /= Void)
         shell_object /= Void
         not shell_object.has(json_data)
         not shell_object.has(json_refs)
         ref >= 0
         (ref /= 0) = shell_object.has(json_ref)
      local
         old_object: like current_object
         old_array: like current_array
      do
         old_object := current_object
         old_array := current_array
         agent_create.call([shell_object])
         add_shell_object(name, ref, shell_object, old_object, old_array)
         object_stack.push([old_object, old_array])
      ensure
         object_stack.count = old object_stack.count + 1
         object_stack.top.first = old current_object
         object_stack.top.second = old current_array
      end

   pop_object
      require
         not object_stack.is_empty
      do
         current_object := object_stack.top.first
         current_array := object_stack.top.second
         object_stack.pop
      ensure
         object_stack.count = old object_stack.count - 1
         current_object = old object_stack.top.first
         current_array = old object_stack.top.second
      end

   create_object (shell_object: LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING])
      do
         create current_object.make
         current_array := Void
         shell_object.add(create {JSON_OBJECT}.make(current_object), json_data)
      ensure
         current_object /= Void and current_object /= old current_object
      end

   create_array (shell_object: LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING])
      do
         create current_array.make(0)
         current_object := Void
         shell_object.add(create {JSON_ARRAY}.make(current_array), json_data)
      ensure
         current_array /= Void and current_array /= old current_array
      end

   make (a_out_stream: like out_stream; a_version: like version)
      require
         a_out_stream /= Void
         a_version /= Void
      do
         out_stream := a_out_stream
         version := a_version
         create object_stack.make
      ensure
         out_stream = a_out_stream
         version = a_version
      end

invariant
   out_stream /= Void

end -- class JSON_REPOSITORY_OUTPUT
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
