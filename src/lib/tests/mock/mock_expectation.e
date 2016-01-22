-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class MOCK_EXPECTATION

insert
   ANY
      undefine
         out_in_tagged_out_memory
      end

feature {ANY}
   ready: BOOLEAN
      deferred
      end

   target: MOCK_OBJECT
      deferred
      end

   feature_name: FIXED_STRING
      deferred
      end

   can_call (a_target: like target; a_feature_name: like feature_name; a_arguments: MOCK_ARGUMENTS): BOOLEAN
      require
         ready
         a_target /= Void
         a_feature_name.is_interned
         a_arguments /= Void
      deferred
      ensure
         Result implies target.missing_expectations /= Void
      end

feature {MOCK_EXPECTATION_GROUP}
   start_replay (missing_expectations: COLLECTION[MOCK_EXPECTATION])
      require
         missing_expectations /= Void
      do
         target.start_replay(missing_expectations)
      ensure
         target.missing_expectations = missing_expectations
      end

   stop_replay
      do
         target.stop_replay
      end

   done
      deferred
      ensure
         ready
      end

   all_called
      deferred
      ensure
         target.missing_expectations = Void
      end

   all_done_message_in (message: STRING)
      require
         message /= Void
         ready
      deferred
      end

   all_done: BOOLEAN
      deferred
      end

invariant
   target /= Void
   feature_name.is_interned

end -- class MOCK_EXPECTATION
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
