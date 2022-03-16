-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class CLARG_NOT

inherit
   COMMAND_LINE_ARGUMENT
      redefine
         prefix "not"
      end

create {COMMAND_LINE_ARGUMENT}
   make

feature {ANY}
   is_repeatable: BOOLEAN False

   prefix "not": COMMAND_LINE_ARGUMENT
      do
         Result := arg
      end

   is_set: BOOLEAN
      do
         Result := not arg.is_set
      end

   is_mandatory: BOOLEAN
      do
         Result := arg.is_mandatory
      end

   is_set_at (context: COMMAND_LINE_CONTEXT): BOOLEAN
      do
         Result := not arg.is_set_at(context)
      end

feature {COMMAND_LINE_ARGUMENTS, COMMAND_LINE_ARGUMENT}
   prepare_parse
      do
         arg.prepare_parse
      end

   parse_command_line (context: COMMAND_LINE_CONTEXT): COMMAND_LINE_CONTEXT
      do
         Result := arg.parse_command_line(context)
         if not Result.is_parsed then
            Result := Result.default
         elseif arg.is_set then
            arg.undo_parse(context)
            Result := context
         end
      end

   undo_parse (context: COMMAND_LINE_CONTEXT)
      do
         arg.undo_parse(context)
      end

   usage_summary (stream: OUTPUT_STREAM)
      local
         i: INTEGER
      do
         stream.put_character('~')
         stream.put_character('(')
         arg.usage_summary(stream)
         stream.put_character(')')
         detailed := False
      end

   usage_details (stream: OUTPUT_STREAM)
      do
         if not detailed then
            arg.usage_details(stream)
            detailed := True
         end
      end

feature {}
   arg: COMMAND_LINE_ARGUMENT

   make (a_arg: COMMAND_LINE_ARGUMENT)
      require
         a_arg /= Void
      do
         arg := a_arg
      end

   detailed: BOOLEAN

invariant
   arg /= Void

end -- class CLARG_NOT
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
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
