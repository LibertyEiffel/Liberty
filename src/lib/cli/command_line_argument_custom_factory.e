-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class COMMAND_LINE_ARGUMENT_CUSTOM_FACTORY[D_]
--
-- A specialized factory for custom arguments.
--

insert
   COMMAND_LINE_ARGUMENT_FACTORY

feature {ANY} -- Options
   option_custom (short, long, name, usage: ABSTRACT_STRING; validate: PREDICATE[TUPLE[STRING]]; decode: FUNCTION[TUPLE[STRING], D_]): COMMAND_LINE_TYPED_ARGUMENT[D_]
      require
         short /= Void implies short_pattern.match(short.out)
         long /= Void implies long_pattern.match(long.out)
         short /= Void or else long /= Void
         name /= Void
         decode /= Void
      do
         create {CLARG_CUSTOM[D_]} Result.optional(short, long, name, usage, validate, decode)
      end

   option_customs (short, long, name, usage: ABSTRACT_STRING; validate: PREDICATE[TUPLE[STRING]]; decode: FUNCTION[TUPLE[STRING], D_]): COMMAND_LINE_TYPED_ARGUMENT[TRAVERSABLE[D_]]
      require
         short /= Void implies short_pattern.match(short.out)
         long /= Void implies long_pattern.match(long.out)
         short /= Void or else long /= Void
         name /= Void
         decode /= Void
      do
         create {CLARG_CUSTOMS[D_]} Result.optional(short, long, name, usage, validate, decode)
      end

feature {ANY} -- Positional
   positional_custom (name, usage: ABSTRACT_STRING; validate: PREDICATE[TUPLE[STRING]]; decode: FUNCTION[TUPLE[STRING], D_]): COMMAND_LINE_TYPED_ARGUMENT[D_]
      require
         name /= Void
         decode /= Void
      do
         create {CLARG_CUSTOM[D_]} Result.positional(name, usage, validate, decode)
      end

   positional_customs (name, usage: ABSTRACT_STRING; validate: PREDICATE[TUPLE[STRING]]; decode: FUNCTION[TUPLE[STRING], D_]): COMMAND_LINE_TYPED_ARGUMENT[TRAVERSABLE[D_]]
      require
         name /= Void
         decode /= Void
      do
         create {CLARG_CUSTOMS[D_]} Result.positional(name, usage, validate, decode)
      end

end -- class COMMAND_LINE_ARGUMENT_CUSTOM_FACTORY
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
