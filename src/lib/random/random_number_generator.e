-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class RANDOM_NUMBER_GENERATOR
   --
   -- Common abstract definition of a random number generator.
   -- The Liberty Eiffel library provides two implementations: MINIMAL_RANDOM_NUMBER_GENERATOR, and 
   -- PRESS_RANDOM_NUMBER_GENERATOR. Most applications can safely rely on MINIMAL_RANDOM_NUMBER_GENERATOR. 
   -- If you really need high quality randomizing, consider PRESS_RANDOM_NUMBER_GENERATOR. 
   --
   
feature {ANY}
   make
         -- Create (or reset) the random number generator with an automatic randomised setting of the 
         -- `seed_value' based on the CPU clock.
         --
         -- See also `with_seed'.
      deferred
      end

   with_seed (seed_value: INTEGER)
         -- Create (or reset) the random number generator with an explicit `seed_value'.
         -- By using an explicit `seed_value', one can replay the very same random sequense more than once
         --
         -- See also `make'.
      deferred
      end

   next
         -- Prepare the next random number in sequence.
         -- Change internal memory of `Current' in order to prepare the next random number in sequence.
         --
         -- See also `last_real', `last_integer'.
      deferred
      end

   last_real: REAL
         -- The last computed number in range 0.0 to 1.0 excluded (see ensure).
         -- Internal memory is not changed and two calls will give the same `Result'. 
         -- Use `next' to get a new random `last_real' value.
         --
         -- See also `last_integer'.
      deferred
      ensure
         Result > 0 and Result <= 1
      end

   last_integer (n: INTEGER): INTEGER
         -- The last computed number in range 1 to `n'(see ensure).
         -- Internal memory is not changed and two calls will give the same `Result'. 
         -- Use `next' to get a new random `last_integer' value.
         --
         -- See also `last_real'.
      require
         n >= 1
      deferred
      ensure
         1 <= Result and Result <= n
      end

feature {}
   clock_based_random_seed: INTEGER
         -- Some positive random value to be used as a seed which may change as much as possible in a random 
         -- way.
      local
         clock: CLOCK; microsecond_time: MICROSECOND_TIME
      do
         from
            microsecond_time.update
            Result := microsecond_time.microsecond #+ clock.value
         until
            Result > 0
         loop
            microsecond_time.update
            Result := ~Result #+ microsecond_time.microsecond
         end
      ensure
         Result > 0
      end
   
end -- class RANDOM_NUMBER_GENERATOR
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
