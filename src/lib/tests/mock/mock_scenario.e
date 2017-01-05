-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class MOCK_SCENARIO

feature {EIFFELTEST_TOOLS}
   expect (expectations: TRAVERSABLE[MOCK_EXPECTATION])
      require
         not is_replaying
      do
         groups.expect(expectations)
      end

   next
      require
         not is_replaying
      do
         groups.next
      end

   replay_all
      require
         not is_replaying
      local
         mexps: FAST_ARRAY[MOCK_EXPECTATION]
      do
         create mexps.with_capacity(0)
         missing_expectations := mexps
         groups.replay_all(mexps)
         do_at_exit(agent check_all_done)
      ensure
         is_replaying
         missing_expectations.is_empty
      end

   is_replaying: BOOLEAN
      do
         Result := groups.is_replaying
      end

   check_all_done
      require
         is_replaying
      local
         mem: MEMORY
      do
         groups.check_all_done
         mem.forbid_gc_before_exit
      ensure
         not is_replaying
      end

feature {ANY}
   missing_expectations: TRAVERSABLE[MOCK_EXPECTATION]

feature {MOCK_EXPECT}
   check_call (a_target: MOCK_OBJECT; a_feature_name: FIXED_STRING; a_arguments: MOCK_ARGUMENTS): MOCK_EXPECTATION
      require
         a_target /= Void
         a_feature_name.is_interned
         a_arguments /= Void
         is_replaying
      do
         debug
            io.put_string(once "SCENARIO: Looking up {")
            io.put_string(a_target.generating_type)
            io.put_string(once "}.")
            io.put_string(a_feature_name)
            io.put_line(a_arguments.out)
         end
         Result := groups.check_call(a_target, a_feature_name, a_arguments)
      ensure
         Result /= Void implies Result.can_call(a_target, a_feature_name, a_arguments)
      end

feature {}
   groups: MOCK_EXPECTATION_GROUPS
      once
         create Result.make
      end

end -- class MOCK_SCENARIO
--
-- Copyright (C) 2013-2017: Cyril ADRIAN <cyril.adrian@gmail.com>
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
