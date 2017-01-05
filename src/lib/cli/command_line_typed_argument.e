-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class COMMAND_LINE_TYPED_ARGUMENT[E_]
   --
   -- A "single" argument which bears a value aka `item'.
   --

inherit
   COMMAND_LINE_ARGUMENT

feature {ANY}
   item: E_
         -- The argument value, if `is_set'
      deferred
      end

   as_mandatory, prefix "+": like Current
         -- Make the option mandatory (default for positionals)
      require
         can_be_mandatory
      do
         if is_mandatory then
            Result := Current
         else
            Result := twin
            Result.set_mandatory(Current, True)
         end
      ensure
         Result.is_mandatory
      end

   as_optional, prefix "-": like Current
         -- Make the option optional (default for options)
      require
         can_be_optional
      do
         if is_optional then
            Result := Current
         else
            Result := twin
            Result.set_mandatory(Current, False)
         end
      ensure
         not Result.is_mandatory
      end

feature {ANY}
   is_mandatory: BOOLEAN
         -- True if the argument must be set at least once.
      deferred
      ensure
         Result implies can_be_mandatory
      end

   is_optional: BOOLEAN
         -- True if the argument may not be set.
      deferred
      ensure
         Result implies not is_positional
         is_mandatory implies not Result
         Result implies can_be_optional
      end

   is_positional: BOOLEAN
         -- True if the argument is not introduced by a flag. Such an argument is mandatory and may have an
         -- explicit position on the command line (see `force_index').
      deferred
      ensure
         Result implies not is_optional
         Result implies is_mandatory
      end

   can_be_mandatory: BOOLEAN
         -- True if the argument can be `set_mandatory'(True).
      deferred
      end

   can_be_optional: BOOLEAN
         -- True if the argument can be `set_mandatory'(False).
      deferred
      end

feature {ANY}
   short: FIXED_STRING
         -- The short (one-letter) option flag introducing the argument, Void for positionals
      deferred
      ensure
         is_positional implies Result = Void
         Result /= Void implies Result.count = 1
      end

   long: FIXED_STRING
         -- The long option flag introducing the argument, Void for positionals
      deferred
      ensure
         is_positional implies Result = Void
         Result /= Void implies not Result.is_empty
      end

   usage: FIXED_STRING
         -- The option usage
      deferred
      end

   force_index (a_index: INTEGER)
         -- Force a positional parameter to be valid only at the given index
      require
         a_index > 0
         is_positional
         not is_repeatable
      deferred
      end

feature {COMMAND_LINE_ARGUMENTS, COMMAND_LINE_ARGUMENT}
   set_mandatory (parent_option: like Current; enable: BOOLEAN)
      require
         parent_option /= Void
         enable /= is_mandatory
         enable implies can_be_mandatory
         ;(not enable) implies can_be_optional
      deferred
      ensure
         parent = parent_option
         is_mandatory = enable
      end

feature {}
   parent: like Current
         -- Internal technical trick to ensure that arguments with a non-standard behaviour (`set_mandatory')
         -- are correctly managed.
      deferred
      end

invariant
   is_optional or else is_positional or else is_mandatory

end -- class COMMAND_LINE_TYPED_ARGUMENT
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
