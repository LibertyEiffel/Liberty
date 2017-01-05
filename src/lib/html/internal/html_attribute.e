-- See the Copyright notice at the end of this file.
--
class HTML_ATTRIBUTE

create {HTML_NODE}
   make

feature {ANY}
   name: STRING

   value: STRING

   to_string: STRING
      do
         Result := ""
         append_in(Result)
      end

   append_in (buffer: STRING)
      do
         buffer.append(name)
         if value /= Void then
            buffer.append(once "='")
            buffer.append(value)
            buffer.extend('%'')
         end
      end

   to_html_stream (html: HTML_OUTPUT_STREAM)
      do
         html.with_attribute(name, value)
      end

feature {}
   make (a_name, a_value: STRING)
      require
         a_name /= Void
      do
         name := a_name
         value := a_value
      end

end -- class HTML_ATTRIBUTE
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
