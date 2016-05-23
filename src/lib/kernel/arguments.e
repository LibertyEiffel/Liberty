-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class ARGUMENTS
   --
   -- Insert this class when you need access to command-line arguments.
   --

feature {ANY}
   argument_count: INTEGER
         -- Number of arguments given to command that started system execution (command name does not count).
      do
         Result := command_arguments.upper
      ensure
         Result >= 0
      end

   argument (i: INTEGER): STRING
         -- `i' th argument of command that started system execution
         -- Gives the command name if `i' is 0.
      require
         i >= 0
         i <= argument_count
      do
         Result := command_arguments.item(i)
      ensure
         Result /= Void
      end

   command_name: STRING
      do
         Result := command_arguments.item(0)
      end

feature {}
   frozen command_arguments: FAST_ARRAY[STRING]
         -- Give access to arguments command line including the command name at index 0.
         -- This is a once function, so you can modify command-line arguments!
         -- (NOTE: just be sure not to remove the first argument, although you may change it)
      local
         i: INTEGER; arg: STRING
      once
         from
            i := 0
            create Result.make(se_argc)
         until
            i >= se_argc
         loop
            arg := se_argv(i)
            Result.put(arg, i)
            i := i + 1
         end
      ensure
         not Result.is_empty
      end

feature {} -- Implementation of ARGUMENTS (do not use directly):
   se_argc: INTEGER
         -- To implement `command_arguments'
      external "built_in"
      end

   se_argv (i: INTEGER): STRING
         -- To implement `command_arguments'
      external "built_in"
      end

end -- class ARGUMENTS
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
