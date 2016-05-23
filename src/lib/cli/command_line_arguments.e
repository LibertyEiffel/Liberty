-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class COMMAND_LINE_ARGUMENTS
   --
   -- An object of that class manages a command-line parsing.
   --

insert
   ARGUMENTS

create {ANY}
   make

feature {ANY}
   set_helper (a_helper: like helper)
      do
         if a_helper /= Void then
            helper := a_helper
         else
            helper := agent default_helper(?)
         end
      ensure
         a_helper /= Void implies helper = a_helper
      end

   parse_command_line: BOOLEAN
      do
         Result := parse_argument(cli_argument)
         if not Result and then parse_argument(help_argument) then
            if help_argument.is_set then
               helper.call([Current])
               Result := True
            end
         end
      end

   usage (stream: OUTPUT_STREAM)
      do
         stream.put_line(once "Usage: ")
         stream.put_string(command_name)
         stream.put_character(' ')
         cli_argument.usage_summary(stream)
         stream.put_new_line
         stream.put_new_line
         stream.put_line(once "Options:")
         stream.put_new_line
         cli_argument.usage_details(stream)
      end

feature {}
   parse_argument (a_argument: COMMAND_LINE_ARGUMENT): BOOLEAN
      local
         context: COMMAND_LINE_CONTEXT
      do
         context.init
         a_argument.prepare_parse
         context := a_argument.parse_command_line(context)
         Result := context.is_parsed
            and then (a_argument.is_mandatory implies a_argument.is_set)
            and then (context.index = argument_count + 1 or else (context.is_short and then context.short_index = argument_count + 1))
      end

   make (a_argument: like cli_argument)
      require
         a_argument /= Void
      do
         cli_argument := a_argument
         helper := agent default_helper(?)
      ensure
         cli_argument = a_argument
      end

   cli_argument: COMMAND_LINE_ARGUMENT

   help_argument: COMMAND_LINE_ARGUMENT
      local
         factory: COMMAND_LINE_ARGUMENT_FACTORY
      once
         Result := factory.option_boolean("h", "help", Void)
      end

   helper: PROCEDURE[TUPLE[COMMAND_LINE_ARGUMENTS]]

   default_helper (a_arguments: COMMAND_LINE_ARGUMENTS)
      do
         check a_arguments = Current end
         a_arguments.usage(std_output)
         die_with_code(0)
      end

invariant
   cli_argument /= Void

end -- COMMAND_LINE_ARGUMENTS
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
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
