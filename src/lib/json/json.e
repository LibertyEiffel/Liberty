-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class JSON[DATA_]
   --
   -- JSON management.
   --
   -- Notes:
   --  * only utf-8 is supported.
   --  * number overflows are not well managed (if at all)
   --

insert
   JSON_HANDLER

create {ANY}
   make

feature {ANY}
   encode_in (data: DATA_; str: STRING) is
      require
         str /= Void
      local
         value: JSON_VALUE
      do
         value := codec.build(data)
         encoder.encode_in(value, str)
      end

   encode (data: DATA_): STRING is
      do
         Result := ""
         encode_in(data, Result)
      end

   decode (data: STRING): DATA_ is
      local
         value: JSON_VALUE
         d: JSON_TYPED_DATA[DATA_]
      do
         parse_error := Void
         value := codec.parse(data)
         if value /= Void then
            d ::= decoder.decode(codec, value)
            Result := d.item
         else
            parse_error := codec.parse_error
         end
      end

   parse_error: ABSTRACT_STRING

   encoder: JSON_ENCODER is
      once
         create Result.make
      end

   decoder: JSON_DECODER is
      once
         create Result.make
      end

feature {}
   make (a_codec: like codec) is
      require
         a_codec /= Void
      do
         codec := a_codec
      ensure
         codec = a_codec
      end

   codec: JSON_CODEC[DATA_]

end -- class JSON
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
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
