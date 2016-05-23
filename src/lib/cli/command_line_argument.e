-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class COMMAND_LINE_ARGUMENT
   --
   -- Represents a (semantically unique) command-line argument (option or positional alike).
   -- The semantics of a command-line argument depends on how it is created, and includes:
   --  * arguments conjunction (a "set" of arguments)
   --  * arguments disjunction (a mutually exclusive set of arguments)
   --  * options (which may be mandatory)
   --  * positional arguments (which may be fixed at a given index)
   --
   -- "Simple" options and positional arguments may be set zero times (if not `is_mandatory'), once, or more
   -- (if `is_repeatable'), depending on the argument configuration.
   --

feature {ANY}
   infix "or", infix "or else" (other: COMMAND_LINE_ARGUMENT): COMMAND_LINE_ARGUMENT
         -- Arguments disjunction. Useful to implement mutually exclusive sets of arguments.
      require
         other /= Void
      do
         create {CLARG_OR} Result.make(Current, other)
      ensure
         Result /= Void
      end

   infix "and", infix "and then" (other: COMMAND_LINE_ARGUMENT): COMMAND_LINE_ARGUMENT
         -- Arguments conjunction. All the arguments are checked, in any order.
      require
         other /= Void
      do
         create {CLARG_AND} Result.make(Current, other)
      ensure
         Result /= Void
      end

   prefix "not": COMMAND_LINE_ARGUMENT
         -- (tentative; don't use it, the semantics is not well defined)
      do
         create {CLARG_NOT} Result.make(Current)
      ensure
         Result /= Void
      end

feature {ANY}
   is_set: BOOLEAN
         -- True if the option is present and correct.
      deferred
      end

   is_mandatory: BOOLEAN
         -- True if the argument must be present.
      deferred
      end

   is_repeatable: BOOLEAN
         -- True if the argument is repeatable; False if unique.
      deferred
      end

feature {COMMAND_LINE_ARGUMENTS, COMMAND_LINE_ARGUMENT}
   prepare_parse
      deferred
      ensure
         not is_set
      end

   parse_command_line (context: COMMAND_LINE_CONTEXT): COMMAND_LINE_CONTEXT
      require
         context.is_parsed
      deferred
      end

   undo_parse (context: COMMAND_LINE_CONTEXT)
      require
         is_set_at(context)
      deferred
      ensure
         not is_set_at(context)
         ;(not is_repeatable) implies not is_set
      end

   is_set_at (context: COMMAND_LINE_CONTEXT): BOOLEAN
         -- True if the option is present and correct at the given context.
      require
         context.is_parsed
      deferred
      ensure
         Result implies is_set
         ;(not is_repeatable) implies (Result = is_set)
      end

   usage_summary (stream: OUTPUT_STREAM)
      deferred
      ensure
         not detailed
      end

   usage_details (stream: OUTPUT_STREAM)
      deferred
      ensure
         detailed
      end

feature {}
   detailed: BOOLEAN
      deferred
      end

end -- class COMMAND_LINE_ARGUMENT
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
