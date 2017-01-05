-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class CLARG_OPTIONS

feature {ANY}
   short: FIXED_STRING
   long: FIXED_STRING

feature {} -- patterns
   short_pattern: REGULAR_EXPRESSION
      local
         re: REGULAR_EXPRESSION_BUILDER
      once
         Result := re.convert_python_pattern("^(?:-|/)(?P<options>[A-Za-z0-9]+)$")
      end

   long_pattern: REGULAR_EXPRESSION
      local
         re: REGULAR_EXPRESSION_BUILDER
      once
         Result := re.convert_python_pattern("^(?:--)(?P<name>[A-Za-z0-9]([A-Za-z0-9_-]*[A-Za-z0-9])?)$")
      end

   long_equal_pattern: REGULAR_EXPRESSION
      local
         re: REGULAR_EXPRESSION_BUILDER
      once
         Result := re.convert_python_pattern("^(?:--)(?P<name>[A-Za-z0-9]([A-Za-z0-9_-]*[A-Za-z0-9])?)=(?P<value>.+)$")
      end

feature {} -- queries
   is_short (arg: STRING; a_index: INTEGER): BOOLEAN
      require
         short /= Void
      local
         options: STRING
      do
         if short_pattern.match(arg) and then short_pattern.named_group_matched(once "options") then
            options := short_pattern.named_group_value(arg, once "options")
            if options.valid_index(a_index) then
               Result := options.item(a_index) = short.first
            end
         end
      end

   is_long (arg: STRING): BOOLEAN
      require
         long /= Void
      local
         name_: FIXED_STRING
      do
         if long_pattern.match(arg) and then long_pattern.named_group_matched(once "name") then
            name_ := long_pattern.named_group_value(arg, once "name").intern
            Result := name_ = long
         end
      end

   is_long_equal (arg: STRING): BOOLEAN
      require
         long /= Void
      local
         name_: FIXED_STRING
      do
         if long_equal_pattern.match(arg) and then long_equal_pattern.named_group_matched(once "name") then
            name_ := long_equal_pattern.named_group_value(arg, once "name").intern
            Result := name_ = long
         end
      ensure
         Result implies long_equal_pattern.named_group_matched(once "value")
      end

feature {} -- usage output helpers
   put_short (stream: OUTPUT_STREAM)
      require
         short /= Void
      do
         stream.put_character('-')
         stream.put_character(short.first)
      end

   put_long (stream: OUTPUT_STREAM)
      require
         long /= Void
      do
         stream.put_character('-')
         stream.put_character('-')
         stream.put_string(long)
      end

end -- class CLARG_OPTIONS
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
