-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class CLARG_REMAINING

inherit
   COMMAND_LINE_TYPED_ARGUMENT[TRAVERSABLE[FIXED_STRING]]
      rename
         item as items
      undefine
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
   items: TRAVERSABLE[FIXED_STRING]
      do
         Result := list
      end

   short: FIXED_STRING do end
   long: FIXED_STRING do end
   usage: FIXED_STRING do end
   is_mandatory: BOOLEAN False
   can_be_mandatory: BOOLEAN False
   is_optional: BOOLEAN True
   can_be_optional: BOOLEAN True
   is_positional: BOOLEAN True
   is_repeatable: BOOLEAN False

   is_set: BOOLEAN
      do
         Result := escape_option_index > 0
      end

   force_index (a_index: INTEGER)
      do
         check False end
      end

   out_in_tagged_out_memory
      do
         tagged_out_memory.append(once "<remaining arguments>")
      end

feature {COMMAND_LINE_ARGUMENTS, COMMAND_LINE_ARGUMENT}
   prepare_parse
      do
         undo
      end

   parse_command_line (context: COMMAND_LINE_CONTEXT): COMMAND_LINE_CONTEXT
      local
         index: INTEGER
      do
         if context.is_short then
            index := context.short_index
         else
            index := context.index
         end
         if index <= argument_count and then argument(index).is_equal(once "--") then
            fill_from(index)
            Result.set_index(argument_count + 1)
         else
            Result := context
         end
      end

   usage_summary (stream: OUTPUT_STREAM)
      do
         stream.put_string(once "{-- ...}")
         detailed := False
      end

   usage_details (stream: OUTPUT_STREAM)
      do
         stream.put_line(once "Extra parameters.")
         detailed := True
      end

   is_set_at (context: COMMAND_LINE_CONTEXT): BOOLEAN
      do
         Result := is_set
      end

   undo_parse (context: COMMAND_LINE_CONTEXT)
      do
         undo
      end

   set_mandatory (parent_option: like Current; enable: BOOLEAN)
      do
         check False end
      end

feature {}
   undo
      do
         escape_option_index := 0
         list.clear_count
      end

   fill_from (index: INTEGER)
      local
         i: INTEGER
      do
         escape_option_index := index
         list.make(0)
         list.with_capacity(argument_count - index)
         from
            i := index + 1
         until
            i > argument_count
         loop
            list.add_last(argument(i).intern)
            i := i + 1
         end
      end

   escape_option_index: INTEGER

feature {}
   list: FAST_ARRAY[FIXED_STRING]
   parent: like Current do end
   detailed: BOOLEAN

   make
      do
         create list.make(0)
      end

invariant
   list /= Void
   parent = Void

end -- class CLARG_REMAINING
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
