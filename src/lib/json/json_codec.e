-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class JSON_CODEC[DATA_]
   --
   -- A JSON codec, to be subclassed for actual functionality
   --

inherit
   JSON_ANY_CODEC

feature {JSON_HANDLER}
   build (data: DATA_): JSON_TEXT
      deferred
      ensure
         Result /= Void
      end

   parse (data: INPUT_STREAM): JSON_TEXT
      require
         data.is_connected
      do
         Result := parser.parse_json_text(data)
      end

   on_error (message: ABSTRACT_STRING; line, column: INTEGER)
      deferred
      end

feature {}
   parser_: WEAK_REFERENCE[JSON_PARSER]

   parser: JSON_PARSER
      do
         if parser_ = Void then
            create Result.make(agent on_error)
            create parser_.set_item(Result)
         else
            Result := parser_.item
            if Result = Void then
               create Result.make(agent on_error)
               parser_.set_item(Result)
            end
         end
      end

end -- class JSON_CODEC
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
