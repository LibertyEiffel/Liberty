-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class MOCK_EXPECTATION_GROUP

insert
   EIFFELTEST_TOOLS
      rename
         expect as et_expect,
         replay_all as et_replay_all
      end

create {MOCK_EXPECTATIONS}
   make

feature {MOCK_EXPECTATIONS}
   expect (expectations: TRAVERSABLE[MOCK_EXPECTATION]) is
      require
         not expectations.exists(agent {MOCK_EXPECTATION}.ready)
      do
         expectations.do_all(agent (expectation: MOCK_EXPECTATION) is
                                local
                                   exps: FAST_ARRAY[MOCK_EXPECTATION]
                                do
                                   expectation.done
                                   exps := scenario.fast_reference_at(expectation.target)
                                   if exps = Void then
                                      create exps.with_capacity(4)
                                      scenario.add(exps, expectation.target)
                                   end
                                   exps.add_last(expectation)
                                end (?))
      ensure
         expectations.for_all(agent {MOCK_EXPECTATION}.ready)
      end

   check_call (a_target: MOCK_OBJECT; a_feature_name: FIXED_STRING; a_arguments: TUPLE): MOCK_EXPECTATION is
      require
         a_target /= Void
         a_feature_name.is_interned
         a_arguments /= Void
      local
         exps: FAST_ARRAY[MOCK_EXPECTATION]
         i: INTEGER
      do
         exps := scenario.fast_reference_at(a_target)
         if exps /= Void then
            from
               i := exps.lower
            until
               Result /= Void or else i > exps.upper
            loop
               Result := exps.item(i)
               if not Result.can_call(a_target, a_feature_name, a_arguments) then
                  Result := Void
               end
               i := i + 1
            end
         end
      ensure
         Result /= Void implies Result.can_call(a_target, a_feature_name, a_arguments)
      end

   all_called is
      do
         scenario.do_all(agent {FAST_ARRAY[MOCK_EXPECTATION]}.do_all(agent {MOCK_EXPECTATION}.all_called))
      end

   all_done_message_in (message: STRING) is
      require
         message /= Void
      do
         scenario.do_all(agent {FAST_ARRAY[MOCK_EXPECTATION]}.do_all(agent {MOCK_EXPECTATION}.all_done_message_in(message)))
      end

   all_done: BOOLEAN is
      do
         Result := scenario.for_all(agent {FAST_ARRAY[MOCK_EXPECTATION]}.for_all(agent {MOCK_EXPECTATION}.all_done))
      end

feature {}
   make is
      do
         create scenario.make(hash_coder)
      end

   scenario: EXT_HASHED_DICTIONARY[FAST_ARRAY[MOCK_EXPECTATION], MOCK_OBJECT]

   hash_coder: FUNCTION[TUPLE[MOCK_OBJECT], INTEGER] is
      once
         Result := agent (a_target: MOCK_OBJECT): INTEGER is
                      require
                         a_target /= Void
                      do
                         Result := a_target.to_pointer.hash_code
                      end (?)
      end

invariant
   scenario.for_all(agent (exps: FAST_ARRAY[MOCK_EXPECTATION]; target: MOCK_OBJECT): BOOLEAN is
                       do
                          Result := exps.for_all(agent (exp: MOCK_EXPECTATION): BOOLEAN is
                                                    do
                                                       Result := exp.target = target
                                                    end (?))
                       end (?,?))

end -- class MOCK_EXPECTATION_GROUP
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
