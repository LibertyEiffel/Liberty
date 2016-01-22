-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class JSON_CODEC_IMPL[DATA_]

inherit
   JSON_CODEC[DATA_]
      redefine
         parse
      end

insert
   JSON_HANDLER

create {ANY}
   make

feature {ANY}
   error_message: ABSTRACT_STRING
   error_line, error_column: INTEGER

   nested: JSON_CODEC[DATA_]

feature {JSON_HANDLER}
   build (data: DATA_): JSON_TEXT
      do
         Result := nested.build(data)
      end

   parse (data: INPUT_STREAM): JSON_TEXT
      do
         error_message := Void
         error_line := -1
         error_column := -1
         Result := Precursor(data)
      end

   on_error (a_message: ABSTRACT_STRING; a_line, a_column: INTEGER)
      do
         error_message := a_message
         error_line := a_line
         error_column := a_column
         if nested /= Void then
            nested.on_error(a_message, a_line, a_column)
         end
      end

   create_array: JSON_DATA
      do
         Result := nested.create_array
      end

   add_to_array (array, value: JSON_DATA)
      do
         nested.add_to_array(array, value)
      end

   finalize_array (array: JSON_DATA)
      do
         nested.finalize_array(array)
      end

   create_object: JSON_DATA
      do
         Result := nested.create_object
      end

   add_to_object (object, key, value: JSON_DATA)
      do
         nested.add_to_object(object, key, value)
      end

   finalize_object (object: JSON_DATA)
      do
         nested.finalize_object(object)
      end

   create_string (string: JSON_STRING): JSON_DATA
      do
         Result := nested.create_string(string)
      end

   create_number (number: JSON_NUMBER): JSON_DATA
      do
         Result := nested.create_number(number)
      end

   true_value: JSON_DATA
      do
         Result := nested.true_value
      end

   false_value: JSON_DATA
      do
         Result := nested.false_value
      end

   null_value: JSON_DATA
      do
         Result := nested.null_value
      end

feature {}
   make (a_nested: like nested)
      require
         a_nested /= Void
      do
         nested := a_nested
      ensure
         nested = a_nested
      end

invariant
   nested /= Void

end -- class JSON_CODEC_IMPL
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
