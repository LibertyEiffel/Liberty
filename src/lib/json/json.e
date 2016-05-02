-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class JSON[DATA_]
   --
   -- JSON management.
   --
   -- Notes:
   --  * only UTF-8 is supported.
   --  * number overflows are not well managed (if at all)
   --

insert
   JSON_HANDLER

create {ANY}
   make

feature {ANY}
   encode_to (data: DATA_; strout: OUTPUT_STREAM)
      require
         strout.is_connected
      local
         value: JSON_VALUE
      do
         value := codec.build(data)
         encoder.encode_in(value, strout)
      end

   encode_in (data: DATA_; str: STRING)
      require
         str /= Void
      local
         strout: STRING_OUTPUT_STREAM
      do
         create strout.connect_to(str)
         encode_to(data, strout)
         strout.disconnect
      end

   encode (data: DATA_): STRING
      do
         Result := ""
         encode_in(data, Result)
      end

   decode_from (strin: INPUT_STREAM): DATA_
      require
         strin.is_connected
      local
         value: JSON_VALUE
         d: JSON_TYPED_DATA[DATA_]
      do
         value := codec.parse(strin)
         if value /= Void then
            d ::= decoder.decode(codec, value)
            Result := d.item
         end
      end

   decode (data: STRING): DATA_
      require
         data /= Void
      local
         strin: STRING_INPUT_STREAM
      do
         create strin.from_string(data)
         Result := decode_from(strin)
         strin.disconnect
      end

   error_message: ABSTRACT_STRING
      do
         Result := codec.error_message
      end

   error_line: INTEGER
      do
         Result := codec.error_line
      end

   error_column: INTEGER
      do
         Result := codec.error_column
      end

   encoder: JSON_ENCODER
      once
         create Result.make
      end

   decoder: JSON_DECODER
      once
         create Result.make
      end

feature {}
   make (a_codec: JSON_CODEC[DATA_])
      require
         a_codec /= Void
      do
         create codec.make(a_codec)
      ensure
         codec.nested = a_codec
      end

   codec: JSON_CODEC_IMPL[DATA_]

invariant
   codec /= Void

end -- class JSON
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
