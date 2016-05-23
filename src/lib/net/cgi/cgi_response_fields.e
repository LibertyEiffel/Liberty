-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
deferred class CGI_RESPONSE_FIELDS
   --
   -- CGI response partial implementation: extra fields
   --

insert
   CGI_UTILS

feature {CGI_HANDLER}
   fields: MAP[TRAVERSABLE[FIXED_STRING], FIXED_STRING]
      do
         Result := fields_memory
      end

feature {CGI, CGI_HANDLER}
   is_valid_field (a_field: ABSTRACT_STRING): BOOLEAN
      do
         Result := a_field /= Void
            and then field_pattern.match(a_field)
            and then not a_field.is_equal(once "Content-Type")
            and then not a_field.is_equal(once "Status")
            and then not a_field.is_equal(once "Location")
            and then not jar.is_field_reserved(a_field)
      end

   reset_field (a_field: ABSTRACT_STRING)
      require
         is_valid_field(a_field)
      local
         values: FAST_ARRAY[FIXED_STRING]
         field: FIXED_STRING
      do
         if fields_memory /= Void then
            field := a_field.intern
            values ::= fields_memory.reference_at(field)
            if values /= Void then
               values.clear_count
            end
         end
      end

   set_field (a_field, a_value: ABSTRACT_STRING)
      require
         is_valid_field(a_field)
         a_value.occurrences('%N') = 0
      local
         values: FAST_ARRAY[FIXED_STRING]
         field: FIXED_STRING
      do
         if fields_memory = Void then
            create fields_memory.make
         end
         field := a_field.intern
         values ::= fields_memory.reference_at(field)
         if values = Void then
            create values.with_capacity(1)
            fields_memory.add(values, field)
         end
         values.add_last(a_value.intern)
      ensure
         fields_memory.at(a_field.intern).last = a_value.intern
         value_count(a_field) = old value_count(a_field) + 1
      end

feature {}
   flush_fields (a_output: OUTPUT_STREAM)
      local
         i: INTEGER; values: TRAVERSABLE[FIXED_STRING]
      do
         if fields_memory /= Void then
            from
               i := fields_memory.lower
            until
               i > fields_memory.upper
            loop
               values := fields_memory.item(i)
               if not values.is_empty then
                  a_output.put_string(fields_memory.key(i))
                  a_output.put_character(':')
                  put_value(values, a_output)
                  a_output.put_string(crlf)
               end
               i := i + 1
            end
         end
         jar.flush(a_output)
      end

feature {}
   field_pattern: REGULAR_EXPRESSION
         -- ^[A-Za-z0-9]+(-[A-Za-z0-9]+)*$
      local
         builder: REGULAR_EXPRESSION_BUILDER
      once
         Result := builder.convert_posix_pattern("^[A-Za-z0-9]+(-[A-Za-z0-9]+)*$")
      end

   value_count (a_field: ABSTRACT_STRING): INTEGER
      require
         is_valid_field(a_field)
      local
         values: TRAVERSABLE[FIXED_STRING]
      do
         if fields_memory /= Void then
            values := fields_memory.reference_at(a_field.intern)
            if values /= Void then
               Result := values.count
            end
         end
      end

   put_value (a_values: TRAVERSABLE[FIXED_STRING]; a_output: OUTPUT_STREAM)
      local
         i: INTEGER; value: FIXED_STRING; values: FAST_ARRAY[FIXED_STRING]
      do
         values ::= a_values
         from
            i := values.lower
         until
            i > values.upper
         loop
            value := values.item(i)
            if is_token(value) or else is_separators(value) then
               a_output.put_string(value)
            else
               a_output.put_character('"')
               a_output.put_string(value)
               a_output.put_character('"')
            end
            i := i + 1
         end
      end

   jar: CGI_COOKIE_JAR

feature {}
   fields_memory: LINKED_HASHED_DICTIONARY[TRAVERSABLE[FIXED_STRING], FIXED_STRING]

end -- class CGI_RESPONSE_FIELDS
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
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
