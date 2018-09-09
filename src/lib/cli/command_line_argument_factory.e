-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class COMMAND_LINE_ARGUMENT_FACTORY
--
-- The command-line arguments factory.
--

feature {ANY} -- Options
   option_string (short, long, name, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[FIXED_STRING]
      require
         short /= Void implies short_pattern.match(short.out)
         long /= Void implies long_pattern.match(long.out)
         short /= Void or else long /= Void
         name /= Void
      do
         create {CLARG_STRING} Result.optional(short, long, name, usage)
      end

   option_strings (short, long, name, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[TRAVERSABLE[FIXED_STRING]]
      require
         short /= Void implies short_pattern.match(short.out)
         long /= Void implies long_pattern.match(long.out)
         short /= Void or else long /= Void
         name /= Void
      do
         create {CLARG_STRINGS} Result.optional(short, long, name, usage)
      end

   option_file (short, long, name, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[REGULAR_FILE]
      require
         short /= Void implies short_pattern.match(short.out)
         long /= Void implies long_pattern.match(long.out)
         short /= Void or else long /= Void
         name /= Void
      do
         create {CLARG_FILE} Result.optional(short, long, name, usage)
      end

   option_directory (short, long, name, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[DIRECTORY]
      require
         short /= Void implies short_pattern.match(short.out)
         long /= Void implies long_pattern.match(long.out)
         short /= Void or else long /= Void
         name /= Void
      do
         create {CLARG_DIRECTORY} Result.optional(short, long, name, usage)
      end

   option_integer (short, long, name, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[INTEGER]
      require
         short /= Void implies short_pattern.match(short.out)
         long /= Void implies long_pattern.match(long.out)
         short /= Void or else long /= Void
         name /= Void
      do
         create {CLARG_INTEGER} Result.optional(short, long, name, usage)
      end

   option_integers (short, long, name, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[TRAVERSABLE[INTEGER]]
      require
         short /= Void implies short_pattern.match(short.out)
         long /= Void implies long_pattern.match(long.out)
         short /= Void or else long /= Void
         name /= Void
      do
         create {CLARG_INTEGERS} Result.optional(short, long, name, usage)
      end

   option_boolean (short, long, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[BOOLEAN]
      require
         short /= Void implies short_pattern.match(short.out)
         long /= Void implies long_pattern.match(long.out)
         short /= Void or else long /= Void
      do
         create {CLARG_BOOLEAN} Result.make(short, long, usage)
      end

   option_counter (short, long, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[INTEGER]
      require
         short /= Void implies short_pattern.match(short.out)
         long /= Void implies long_pattern.match(long.out)
         short /= Void or else long /= Void
      do
         create {CLARG_COUNTER} Result.make(short, long, usage)
      end

feature {ANY} -- Positional
   positional_string (name, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[FIXED_STRING]
      require
         name /= Void
      do
         create {CLARG_STRING} Result.positional(name, usage)
      end

   positional_strings (name, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[TRAVERSABLE[FIXED_STRING]]
      require
         name /= Void
      do
         create {CLARG_STRINGS} Result.positional(name, usage)
      end

   positional_file (name, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[REGULAR_FILE]
      require
         name /= Void
      do
         create {CLARG_FILE} Result.positional(name, usage)
      end

   positional_directory (name, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[DIRECTORY]
      require
         name /= Void
      do
         create {CLARG_DIRECTORY} Result.positional(name, usage)
      end

   positional_integer (name, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[INTEGER]
      require
         name /= Void
      do
         create {CLARG_INTEGER} Result.positional(name, usage)
      end

   positional_integers (name, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[TRAVERSABLE[INTEGER]]
      require
         name /= Void
      do
         create {CLARG_INTEGERS} Result.positional(name, usage)
      end

feature {ANY}
   no_parameters: COMMAND_LINE_ARGUMENT
         -- useful to allow an empty command line.
      once
         create {CLARG_NOP} Result.make
      end

   remaining_parameters: COMMAND_LINE_TYPED_ARGUMENT[TRAVERSABLE[FIXED_STRING]]
         -- allows parameters to be set after a special "--" option
      once
         create {CLARG_REMAINING} Result.make
      end

feature {ANY} -- Option names validity
   short_pattern: REGULAR_EXPRESSION
      local
         re: REGULAR_EXPRESSION_BUILDER
      once
         Result := re.convert_posix_pattern("^[A-Za-z0-9]$")
      end

   long_pattern: REGULAR_EXPRESSION
      local
         re: REGULAR_EXPRESSION_BUILDER
      once
         Result := re.convert_posix_pattern("^[A-Za-z0-9]([A-Za-z0-9_-]*[A-Za-z0-9])?$")
      end

end -- class COMMAND_LINE_ARGUMENT_FACTORY
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
