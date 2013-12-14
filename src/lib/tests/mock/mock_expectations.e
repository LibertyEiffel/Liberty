-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class MOCK_EXPECTATIONS

insert
   EIFFELTEST_TOOLS
      rename
         expect as et_expect,
         replay_all as et_replay_all
      end

feature {EIFFELTEST_TOOLS}
   expect (expectations: TRAVERSABLE[MOCK_EXPECTATION]) is
      do
         groups.last.expect(expectations)
      end

   next is
      do
         groups.add_last(create {MOCK_EXPECTATION_GROUP}.make)
      end

   replay_all is
      do
         check_index.set_item(groups.lower)
      end

   check_all_done is
      do
         message_assert(agent all_done_message, all_done)
      end

feature {MOCK_EXPECT}
   check_call (a_target: MOCK_OBJECT; a_feature_name: FIXED_STRING; a_arguments: TUPLE): MOCK_EXPECTATION is
      require
         a_target /= Void
         a_feature_name.is_interned
         a_arguments /= Void
      do
         from
         until
            Result /= Void or else not groups.valid_index(check_index.item)
         loop
            Result := groups.item(check_index.item).check_call(a_target, a_feature_name, a_arguments)
            if Result = Void then
               groups.item(check_index.item).all_called
               check_index.increment
            end
         end
      ensure
         Result /= Void implies Result.can_call(a_target, a_feature_name, a_arguments)
      end

feature {}
   check_index: COUNTER is
      once
         create Result
      end

   groups: FAST_ARRAY[MOCK_EXPECTATION_GROUP] is
      once
         create Result.with_capacity(2)
         Result.add_last(create {MOCK_EXPECTATION_GROUP}.make)
      end

   all_done_message: STRING is
      require
         not all_done
      do
         Result := "Some features were not called:%N"
         groups.do_all(agent {MOCK_EXPECTATION_GROUP}.all_done_message_in(Result))
      end

   all_done: BOOLEAN is
      do
         Result := groups.for_all(agent {MOCK_EXPECTATION_GROUP}.all_done)
      end

invariant
   not groups.is_empty

end -- class MOCK_EXPECTATIONS
--
-- Copyright (c) 2013 Cyril ADRIAN <cyril.adrian@gmail.com>
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
