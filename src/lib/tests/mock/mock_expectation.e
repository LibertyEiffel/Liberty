-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class MOCK_EXPECTATION

insert
   EIFFELTEST_TOOLS

feature {ANY}
   ready: BOOLEAN

   target: MOCK_OBJECT
   feature_name: FIXED_STRING
   arguments: TUPLE

   counter_ready: BOOLEAN
      do
         Result := counter /= Void
      end

feature {ANY}
   times, infix "*" (how_many: INTEGER): like Current
      require
         not ready
         not counter_ready
      do
         create {MOCK_TIMES_COUNTER} counter.set_item(how_many)
         Result := Current
      ensure
         Result = Current
         counter_ready
         --counter.item = how_many
      end

   whenever: like Current
      require
         not ready
         not counter_ready
      do
         counter := counter_any_time
         Result := Current
      ensure
         Result = Current
         counter_ready
      end

feature {}
   counter_any_time: MOCK_TIMES_ANY
      once
         create Result
      end

feature {ANY}
   can_call (a_target: like target; a_feature_name: like feature_name; a_arguments: like arguments): BOOLEAN
      require
         ready
         a_target /= Void
         a_feature_name.is_interned
         a_arguments /= Void
      do
         Result := target = a_target
            and then feature_name = a_feature_name
            and then arguments.is_equal(a_arguments)
            and then counter.can_call
      end

feature {MOCK_OBJECT}
   call
      require
         can_call(target, feature_name, arguments)
      do
         do_call
         counter.call
      end

feature {MOCK_EXPECTATION_GROUP}
   done
      do
         if counter = Void then
            create {MOCK_TIMES_COUNTER} counter.set_item(1)
         end
         ready := True
      ensure
         ready
      end

   all_called
      do
         counter.all_called
      end

   all_done_message_in (message: STRING)
      require
         message /= Void
         ready
      do
         if not all_done then
            message.append(" - (#(1)).#(2)(#(3))%N" # target.out # feature_name # arguments.out)
         end
      end

   all_done: BOOLEAN
      do
         Result := counter.all_done
      end

feature {}
   do_call
      deferred
      end

feature {}
   make (a_target: like target; a_feature_name: like feature_name; a_arguments: like arguments)
      require
         a_target /= Void
         a_feature_name.is_interned
      do
         target := a_target
         feature_name := a_feature_name
         arguments := a_arguments
      ensure
         target = a_target
         feature_name = a_feature_name
         arguments = a_arguments
         not ready
         not counter_ready
      end

   counter: MOCK_TIMES

invariant
   target /= Void
   feature_name.is_interned
   arguments /= Void
   ready implies counter_ready

end -- class MOCK_EXPECTATION
--
-- Copyright (c) 2013 Cyril ADRIAN <cyril.adrian@gmail.com>
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software
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
