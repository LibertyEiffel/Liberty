-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class CLARG_NOP

inherit
   COMMAND_LINE_ARGUMENT
      redefine
         out_in_tagged_out_memory
      end

insert
   ARGUMENTS
      redefine
         out_in_tagged_out_memory
      end

create {COMMAND_LINE_ARGUMENT_FACTORY}
   make

feature {ANY}
   is_set: BOOLEAN
   is_mandatory: BOOLEAN False
   is_repeatable: BOOLEAN False

   out_in_tagged_out_memory
      do
         tagged_out_memory.append(once "<no parameters>")
      end

feature {COMMAND_LINE_ARGUMENTS, COMMAND_LINE_ARGUMENT}
   prepare_parse
      do
         is_set := False
      end

   parse_command_line (context: COMMAND_LINE_CONTEXT): COMMAND_LINE_CONTEXT
      do
         Result := context
         is_set := argument_count = 0
      ensure
         Result.is_parsed
         Result.index = context.index
      end

   usage_summary (stream: OUTPUT_STREAM)
      do
         detailed := False
      end

   usage_details (stream: OUTPUT_STREAM)
      do
         detailed := True
      end

   undo_parse (context: COMMAND_LINE_CONTEXT)
      do
         is_set := False
      end

   is_set_at (context: COMMAND_LINE_CONTEXT): BOOLEAN
      do
         Result := is_set
      end

feature {}
   make
      do
      end

   detailed: BOOLEAN

end -- class CLARG_NOP
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
