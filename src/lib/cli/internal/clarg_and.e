-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class CLARG_AND

inherit
   COMMAND_LINE_ARGUMENT
      redefine
         infix "and", infix "and then"
      end

create {COMMAND_LINE_ARGUMENT}
   make

feature {ANY}
   is_repeatable: BOOLEAN False

   infix "and", infix "and then" (other: COMMAND_LINE_ARGUMENT): COMMAND_LINE_ARGUMENT
      do
         args.add_last(other)
         mandatory_count_memory := -1
         Result := Current
      end

   is_set: BOOLEAN

   is_mandatory: BOOLEAN
      do
         Result := args.exists(agent {COMMAND_LINE_ARGUMENT}.is_mandatory)
      end

   is_set_at (context: COMMAND_LINE_CONTEXT): BOOLEAN
      do
         Result := args.exists(agent {COMMAND_LINE_ARGUMENT}.is_set_at(context))
      end

feature {COMMAND_LINE_ARGUMENTS, COMMAND_LINE_ARGUMENT}
   prepare_parse
      do
         is_set := False
         set_count := 0
         args.for_each(agent {COMMAND_LINE_ARGUMENT}.prepare_parse)
      end

   parse_command_line (context: COMMAND_LINE_CONTEXT): COMMAND_LINE_CONTEXT
      do
         Result := parse_cli(context)
         is_set := set_count = mandatory_count
      end

   undo_parse (context: COMMAND_LINE_CONTEXT)
      do
         args.for_each(agent {COMMAND_LINE_ARGUMENT}.undo_parse(context))
      end

   usage_summary (stream: OUTPUT_STREAM)
      local
         i: INTEGER
      do
         from
            i := args.lower
         until
            i > args.upper
         loop
            if i > args.lower then
               stream.put_character(' ')
            end
            args.item(i).usage_summary(stream)
            i := i + 1
         end
         detailed := False
      end

   usage_details (stream: OUTPUT_STREAM)
      do
         if not detailed then
            args.for_each(agent {COMMAND_LINE_ARGUMENT}.usage_details(stream))
            detailed := True
         end
      end

feature {}
   parse_cli (context: COMMAND_LINE_CONTEXT): COMMAND_LINE_CONTEXT
      local
         i: INTEGER; arg: COMMAND_LINE_ARGUMENT; ctx: COMMAND_LINE_CONTEXT
      do
         from
            Result := context
            i := args.lower
         until
            not Result.is_parsed or else i > args.upper
         loop
            arg := args.item(i)
            if not arg.is_set_at(Result) then
               ctx := arg.parse_command_line(Result)
               if ctx.is_parsed and then arg.is_set_at(Result) then
                  ctx := parse_cli(ctx)
                  check
                     arg.is_set_at(Result)
                  end
                  if ctx.is_parsed then
                     Result := ctx
                     if arg.is_mandatory then
                        set_count := set_count + 1
                     end
                  else
                     arg.undo_parse(Result)
                  end
               end
            end
            i := i + 1
         end
      end

   mandatory_count: INTEGER
      local
         i: INTEGER
      do
         Result := mandatory_count_memory
         if Result < 0 then
            from
               Result := 0
               i := args.lower
            invariant
            variant
               (args.upper - args.lower + 1) - i
            until
               i > args.upper
            loop
               if args.item(i).is_mandatory then
                  Result := Result + 1
               end
               i := i + 1
            end
            mandatory_count_memory := Result
         end
      end

feature {}
   args: FAST_ARRAY[COMMAND_LINE_ARGUMENT]
   set_count: INTEGER
   mandatory_count_memory: INTEGER

   make (a_left, a_right: COMMAND_LINE_ARGUMENT)
      require
         a_left /= Void
         a_right /= Void
      do
         args := {FAST_ARRAY[COMMAND_LINE_ARGUMENT] << a_left, a_right >> }
         mandatory_count_memory := -1
      end

   detailed: BOOLEAN

invariant
   args.count >= 2

end -- class CLARG_AND
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
