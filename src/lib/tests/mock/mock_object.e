-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class MOCK_OBJECT
   --
   -- Tag type used by the mock framework
   --

insert
   ANY
      undefine
         out_in_tagged_out_memory
      end

feature {MOCK_EXPECT}
   add_missing_expectation (expectation: MOCK_EXPECTATION)
      require
         expectation /= Void
      do
         missing_expectations.add_last(expectation)
      end

   can_add_missing_expectation: BOOLEAN
      do
         Result := missing_expectations /= Void
      end

feature {MOCK_EXPECTATION}
   missing_expectations: COLLECTION[MOCK_EXPECTATION]

   start_replay (a_missing_expectations: like missing_expectations)
      do
         missing_expectations := a_missing_expectations
      ensure
         missing_expectations = a_missing_expectations
      end

   stop_replay
      do
         missing_expectations := Void
      ensure
         missing_expectations = Void
      end

end -- class MOCK_OBJECT
--
-- Copyright (C) 2013-2016: Cyril ADRIAN <cyril.adrian@gmail.com>
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
