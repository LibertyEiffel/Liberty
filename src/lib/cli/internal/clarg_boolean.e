-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class CLARG_BOOLEAN

inherit
   COMMAND_LINE_TYPED_ARGUMENT[BOOLEAN]
      redefine
         out_in_tagged_out_memory
      end

insert
   ARGUMENTS
      redefine
         out_in_tagged_out_memory
      end
   CLARG_OPTIONS
      redefine
         out_in_tagged_out_memory
      end

create {COMMAND_LINE_ARGUMENT_FACTORY}
   make

feature {ANY}
   item: BOOLEAN

   usage: FIXED_STRING

   is_mandatory: BOOLEAN False
   can_be_mandatory: BOOLEAN False
   is_optional: BOOLEAN True
   can_be_optional: BOOLEAN True
   is_positional: BOOLEAN False
   is_repeatable: BOOLEAN False

   is_set: BOOLEAN
      do
         Result := item
      end

   force_index (a_index: INTEGER)
      do
         check False end
      end

   out_in_tagged_out_memory
      do
         if long /= Void then
            tagged_out_memory.append(once "--")
            tagged_out_memory.append(long)
         else
            tagged_out_memory.append(once "-")
            tagged_out_memory.append(short)
         end
      end

feature {COMMAND_LINE_ARGUMENTS, COMMAND_LINE_ARGUMENT}
   prepare_parse
      do
         item := False
      end

   parse_command_line (context: COMMAND_LINE_CONTEXT): COMMAND_LINE_CONTEXT
      local
         arg: STRING
      do
         Result := context
         if context.is_short then
            if is_short(argument(context.index), context.short_option_index) then
               item := True
               Result.set_index(context.index)
               Result.set_short(context.short_index, context.short_option_index + 1)
            elseif argument_count >= context.short_index and then is_long(argument(context.short_index)) then
               item := True
               Result.set_index(context.short_index + 1)
            end
         elseif argument_count >= context.index then
            arg := argument(context.index)
            if is_short(arg, 1) then
               item := True
               Result.set_index(context.index)
               Result.set_short(context.index + 1, context.short_option_index + 1)
            elseif is_long(arg) then
               item := True
               Result.set_index(context.index + 1)
            end
         end
      end

   is_set_at (context: COMMAND_LINE_CONTEXT): BOOLEAN
      do
         Result := item
      end

   undo_parse (context: COMMAND_LINE_CONTEXT)
      do
         item := False
      end

   usage_summary (stream: OUTPUT_STREAM)
      do
         if short /= Void then
            if long /= Void then
               stream.put_character('(')
               put_short(stream)
               stream.put_character('|')
               put_long(stream)
               stream.put_character(')')
            else
               put_short(stream)
            end
         elseif long /= Void then
            put_long(stream)
         end
         detailed := False
      end

   usage_details (stream: OUTPUT_STREAM)
      do
         if not detailed then
            usage_summary(stream)
            stream.put_character(':')
            stream.put_character(' ')
            if usage /= Void then
               stream.put_line(usage)
            else
               stream.put_line(once "Set the flag.")
            end
            detailed := True
         end
      end

   set_mandatory (parent_option: like Current; enable: BOOLEAN)
      do
         check False end
      end

feature {}
   make (a_short, a_long, a_usage: ABSTRACT_STRING)
      require
         a_short /= Void implies a_short.count = 1
         a_short /= Void or else a_long /= Void
      do
         if a_short /= Void then
            short := a_short.intern
         end
         if a_long /= Void then
            long := a_long.intern
         end
         if a_usage /= Void then
            usage := a_usage.intern
         end
      ensure
         a_short /= Void implies short.is_equal(a_short)
         a_long /= Void implies long.is_equal(a_long)
         a_usage /= Void implies usage.is_equal(a_usage)
      end

   parent: like Current

   detailed: BOOLEAN

invariant
   parent = Void
   is_optional

end -- class CLARG_BOOLEAN
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
