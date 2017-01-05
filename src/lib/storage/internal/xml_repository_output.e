-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class XML_REPOSITORY_OUTPUT

inherit
   REPOSITORY_OUTPUT

create {XML_REPOSITORY_IMPL}
   make

feature {REPOSITORY_IMPL}
   is_connected: BOOLEAN
      do
         Result := out_stream.is_connected
      end

   start_write
      do
         out_stream.put_string(once "<?xml version='1.1'?>%N<repository version='")
         out_stream.put_string(version)
         out_stream.put_string(once "'>%N")
      end

   end_write
      do
         out_stream.put_string(once "</repository>%N")
      end

   write_reference (ref: INTEGER; name: STRING)
      do
         out_stream.put_string(once "<reference ref='")
         out_stream.put_integer(ref)
         if name /= Void then
            out_stream.put_string(once "' name='")
            out_stream.put_string(name)
         end
         out_stream.put_string(once "' transient='false'/>%N")
      end

   write_transient_reference (ref, name: STRING)
      do
         out_stream.put_string(once "<reference ref='")
         out_stream.put_string(ref)
         if name /= Void then
            out_stream.put_string(once "' name='")
            out_stream.put_string(name)
         end
         out_stream.put_string(once "' transient='true'/>%N")
      end

   start_layout (ref: INTEGER; type: STRING)
      do
         out_stream.put_string(once "<layout ref='")
         out_stream.put_integer(ref)
         out_stream.put_string(once "' type='")
         out_stream.put_string(type)
         out_stream.put_string(once "'>%N")
      end

   end_layout
      do
         out_stream.put_string(once "</layout>%N")
      end

   write_character_layout_object (internals: INTERNALS; name: STRING)
      local
         t: TYPED_INTERNALS[CHARACTER]; c: CHARACTER
      do
         t ::= internals
         c := t.object
         out_stream.put_string(once "<basic type='CHARACTER' value='")
         out_stream.put_integer(c.code)
         if name /= Void then
            out_stream.put_string(once "' name='")
            out_stream.put_string(name)
         end
         out_stream.put_string(once "'/>%N")
      end

   write_boolean_layout_object (internals: INTERNALS; name: STRING)
      local
         t: TYPED_INTERNALS[BOOLEAN]; c: BOOLEAN
      do
         t ::= internals
         c := t.object
         out_stream.put_string(once "<basic type='BOOLEAN' value='")
         out_stream.put_boolean(c)
         if name /= Void then
            out_stream.put_string(once "' name='")
            out_stream.put_string(name)
         end
         out_stream.put_string(once "'/>%N")
      end

   write_integer_8_layout_object (internals: INTERNALS; name: STRING)
      local
         t: TYPED_INTERNALS[INTEGER_8]; c: INTEGER_8
      do
         t ::= internals
         c := t.object
         out_stream.put_string(once "<basic type='INTEGER_8' value='")
         out_stream.put_integer(c)
         if name /= Void then
            out_stream.put_string(once "' name='")
            out_stream.put_string(name)
         end
         out_stream.put_string(once "'/>%N")
      end

   write_integer_16_layout_object (internals: INTERNALS; name: STRING)
      local
         t: TYPED_INTERNALS[INTEGER_16]; c: INTEGER_16
      do
         t ::= internals
         c := t.object
         out_stream.put_string(once "<basic type='INTEGER_16' value='")
         out_stream.put_integer(c)
         if name /= Void then
            out_stream.put_string(once "' name='")
            out_stream.put_string(name)
         end
         out_stream.put_string(once "'/>%N")
      end

   write_integer_32_layout_object (internals: INTERNALS; name: STRING)
      local
         t: TYPED_INTERNALS[INTEGER_32]; c: INTEGER_32
      do
         t ::= internals
         c := t.object
         out_stream.put_string(once "<basic type='INTEGER_32' value='")
         out_stream.put_integer(c)
         if name /= Void then
            out_stream.put_string(once "' name='")
            out_stream.put_string(name)
         end
         out_stream.put_string(once "'/>%N")
      end

   write_integer_64_layout_object (internals: INTERNALS; name: STRING)
      local
         t: TYPED_INTERNALS[INTEGER_64]; c: INTEGER_64
      do
         t ::= internals
         c := t.object
         out_stream.put_string(once "<basic type='INTEGER_64' value='")
         out_stream.put_integer(c)
         if name /= Void then
            out_stream.put_string(once "' name='")
            out_stream.put_string(name)
         end
         out_stream.put_string(once "'/>%N")
      end

   write_integer_layout_object (internals: INTERNALS; name: STRING)
      local
         t: TYPED_INTERNALS[INTEGER]; c: INTEGER
      do
         t ::= internals
         c := t.object
         out_stream.put_string(once "<basic type='INTEGER' value='")
         out_stream.put_integer(c)
         if name /= Void then
            out_stream.put_string(once "' name='")
            out_stream.put_string(name)
         end
         out_stream.put_string(once "'/>%N")
      end

   write_real_32_layout_object (internals: INTERNALS; name: STRING)
      local
         t: TYPED_INTERNALS[REAL_32]; c: REAL_32
      do
         t ::= internals
         c := t.object
         out_stream.put_string(once "<basic type='REAL_32' value='")
         out_stream.put_real(c)
         if name /= Void then
            out_stream.put_string(once "' name='")
            out_stream.put_string(name)
         end
         out_stream.put_string(once "'/>%N")
      end

   write_real_64_layout_object (internals: INTERNALS; name: STRING)
      local
         t: TYPED_INTERNALS[REAL_64]; c: REAL_64
      do
         t ::= internals
         c := t.object
         out_stream.put_string(once "<basic type='REAL_64' value='")
         out_stream.put_real(c)
         if name /= Void then
            out_stream.put_string(once "' name='")
            out_stream.put_string(name)
         end
         out_stream.put_string(once "'/>%N")
      end

   write_real_80_layout_object (internals: INTERNALS; name: STRING)
      local
         t: TYPED_INTERNALS[REAL_80]; c: REAL_80
      do
         t ::= internals
         c := t.object
         out_stream.put_string(once "<basic type='REAL_80' value='")
         out_stream.put_real(c.force_to_real_64)
         if name /= Void then
            out_stream.put_string(once "' name='")
            out_stream.put_string(name)
         end
         out_stream.put_string(once "'/>%N")
      end

   write_real_128_layout_object (internals: INTERNALS; name: STRING)
      local
         t: TYPED_INTERNALS[REAL_128]; c: REAL_128
      do
         t ::= internals
         c := t.object
         out_stream.put_string(once "<basic type='REAL_128' value='")
         out_stream.put_real(c.force_to_real_64)
         if name /= Void then
            out_stream.put_string(once "' name='")
            out_stream.put_string(name)
         end
         out_stream.put_string(once "'/>%N")
      end

   write_real_layout_object (internals: INTERNALS; name: STRING)
      local
         t: TYPED_INTERNALS[REAL]; c: REAL
      do
         t ::= internals
         c := t.object
         out_stream.put_string(once "<basic type='REAL' value='")
         out_stream.put_real(c)
         if name /= Void then
            out_stream.put_string(once "' name='")
            out_stream.put_string(name)
         end
         out_stream.put_string(once "'/>%N")
      end

   write_real_expanded_layout_object (internals: INTERNALS; name: STRING)
      local
         t: TYPED_INTERNALS[REAL_EXTENDED]; c: REAL_EXTENDED
      do
         t ::= internals
         c := t.object
         out_stream.put_string(once "<basic type='REAL_EXTENDED' value='")
         out_stream.put_real(c.force_to_real_64)
         if name /= Void then
            out_stream.put_string(once "' name='")
            out_stream.put_string(name)
         end
         out_stream.put_string(once "'/>%N")
      end

   start_array_layout (array: INTERNALS; name: STRING)
      local
         type: STRING
      do
         type := once ""
         type.copy(array.type_generating_type)
         type.remove_prefix(once "NATIVE_ARRAY[")
         type.remove_suffix(once "]")
         out_stream.put_string(once "<array type='")
         out_stream.put_string(type)
         out_stream.put_string(once "' capacity='")
         out_stream.put_integer(array.type_attribute_count)
         if name /= Void then
            out_stream.put_string(once "' name='")
            out_stream.put_string(name)
         end
         out_stream.put_string(once "'>%N")
      end

   end_array_layout (array: INTERNALS; name: STRING)
      do
         out_stream.put_string(once "</array>%N")
      end

   start_embedded_layout (layout: INTERNALS; name: STRING)
      do
         out_stream.put_string(once "<embedded type='")
         out_stream.put_string(layout.type_generating_type)
         if name /= Void then
            out_stream.put_string(once "' name='")
            out_stream.put_string(name)
         end
         out_stream.put_string(once "'>%N")
      end

   end_embedded_layout (layout: INTERNALS; name: STRING)
      do
         out_stream.put_string(once "</embedded>%N")
      end

feature {}
   out_stream: OUTPUT_STREAM
   version: STRING

   make (a_out_stream: like out_stream; a_version: like version)
      require
         a_out_stream /= Void
         a_version /= Void
      do
         out_stream := a_out_stream
         version := a_version
      ensure
         out_stream = a_out_stream
         version = a_version
      end

invariant
   out_stream /= Void
   version /= Void

end -- class XML_REPOSITORY_OUTPUT
--
-- Copyright (C) 2009-2017: by all the people cited in the AUTHORS file.
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
