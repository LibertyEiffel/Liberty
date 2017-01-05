-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class LOGGING
   --
   -- This class is meant to be inserted.
   --

feature {}
   log: LOGGER
         -- There is one logger per concrete type; for performance reasons it is cached in each instance.
      local
         conf: LOG_CONFIGURATION
      do
         Result := log_memory__0_
         if Result = Void or else not Result.is_valid then
            Result := conf.logger(generating_type.intern)
            log_memory__0_ := Result
         end
      ensure
         Result /= Void
      end

   log_memory__0_: LOGGER
         -- The cached logger. The ugly name is intentional. Don't use directly.

end -- class LOGGING
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
