-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class JSON_DECODER

inherit
   JSON_VISITOR

insert
   JSON_HANDLER

create {JSON_HANDLER}
   make

feature {JSON_HANDLER}
   decode (a_codec: like codec; value: JSON_VALUE): JSON_DATA
      require
         value /= Void
         a_codec /= Void
      do
         codec := a_codec
         value.accept(Current)
         Result := data
         data := Void
         codec := Void
      end

feature {JSON_ARRAY}
   visit_array (json: JSON_ARRAY)
      local
         array, value: JSON_DATA
         i: INTEGER
      do
         array := codec.create_array
         if array /= Void then
            from
               i := json.array.lower
            until
               i > json.array.upper
            loop
               json.array.item(i).accept(Current)
               value := data

               codec.add_to_array(array, value)
               i := i + 1
            end
            codec.finalize_array(array)
         end
         data := array
      end

feature {JSON_FALSE}
   visit_false (json: JSON_FALSE)
      do
         data := codec.false_value
      end

feature {JSON_NULL}
   visit_null (json: JSON_NULL)
      do
         data := codec.null_value
      end

feature {JSON_NUMBER}
   visit_number (json: JSON_NUMBER)
      do
         data := codec.create_number(json)
      end

feature {JSON_OBJECT}
   visit_object (json: JSON_OBJECT)
      local
         object, key, value: JSON_DATA
         i: INTEGER
      do
         object := codec.create_object
         if object /= Void then
            from
               i := json.members.lower
            until
               i > json.members.upper
            loop
               json.members.key(i).accept(Current)
               key := data
               json.members.item(i).accept(Current)
               value := data

               codec.add_to_object(object, key, value)
               i := i + 1
            end
            codec.finalize_object(object)
         end
         data := object
      end

feature {JSON_STRING}
   visit_string (json: JSON_STRING)
      do
         data := codec.create_string(json)
      end

feature {JSON_TRUE}
   visit_true (json: JSON_TRUE)
      do
         data := codec.true_value
      end

feature {}
   data: JSON_DATA
   codec: JSON_ANY_CODEC

   make
      do
      end

end -- class JSON_DECODER
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
