-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class MOCK_TYPED_EXPECTATION[T_ -> TUPLE]

inherit
   MOCK_EXPECTATION

insert
   EIFFELTEST_TOOLS
      redefine
         out_in_tagged_out_memory
      end

feature {ANY}
   ready: BOOLEAN

   target: MOCK_OBJECT
   feature_name: FIXED_STRING
   arg_matchers: MOCK_MATCHERS

   counter_ready: BOOLEAN
      do
         Result := counter /= Void
      end

   out_in_tagged_out_memory
      do
         if counter_ready then
            tagged_out_memory.extend('(')
            counter.out_in_tagged_out_memory
            tagged_out_memory.extend(')')
            tagged_out_memory.extend(' ')
         end
         target.out_in_tagged_out_memory
         tagged_out_memory.extend('.')
         tagged_out_memory.append(feature_name)
         arg_matchers.out_in_tagged_out_memory
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
   can_call (a_target: like target; a_feature_name: like feature_name; a_arguments: MOCK_ARGUMENTS): BOOLEAN
      do
         Result := target = a_target
            and then feature_name = a_feature_name
            and then match_arguments(a_arguments)
            and then counter.can_call
            and then target.missing_expectations /= Void
      end

feature {}
   match_arguments (a_arguments: MOCK_ARGUMENTS): BOOLEAN
      local
         i: INTEGER; m: MOCK_MATCHER; a: MOCK_ARGUMENT
      do
         from
            i := 1
            Result := True
         until
            not Result or else i > arg_matchers.count
         loop
            m := arg_matchers.item(i)
            a := a_arguments.item(i)
            Result := m.match(a)
            i := i + 1
         end
      end

feature {}
   call (a_arguments: MOCK_ARGUMENTS)
      require
         can_call(target, feature_name, a_arguments)
      do
         debug
            io.put_string(once " => Calling ")
            io.put_string(out)
            io.put_string(once " with arguments ")
            io.put_line(a_arguments.out)
         end
         do_call(a_arguments)
         counter.call
      end

feature {MOCK_EXPECTATION_GROUP}
   done
      do
         if counter = Void then
            create {MOCK_TIMES_COUNTER} counter.set_item(1)
         end
         ready := True
      end

   all_called
      do
         counter.all_called
         target.stop_replay
      end

   all_done_message_in (message: STRING)
      do
         if not all_done then
            message.append(" - #(1)%N" # out)
         end
      end

   all_done: BOOLEAN
      do
         Result := counter.all_done
      end

feature {}
   counter: MOCK_TIMES

   do_call (args: MOCK_ARGUMENTS)
      deferred
      end

feature {}
   make (a_target: like target; a_feature_name: like feature_name; a_arg_matchers: like arg_matchers)
      require
         a_target /= Void
         a_feature_name.is_interned
      do
         target := a_target
         feature_name := a_feature_name
         arg_matchers := a_arg_matchers
      ensure
         target = a_target
         feature_name = a_feature_name
         arg_matchers = a_arg_matchers
         not ready
         not counter_ready
      end

invariant
   target /= Void
   feature_name.is_interned
   arg_matchers /= Void
   ready implies counter_ready

end -- class MOCK_TYPED_EXPECTATION
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
