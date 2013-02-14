-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class MOCK_EXPECT

insert
   EIFFELTEST_TOOLS

feature {ANY}
   all_done: BOOLEAN is
      do
         Result := calls = Void or else calls.is_empty
      end

   all_done_message: STRING is
      local
         i: INTEGER
      do
         if calls /= Void then
            Result := "Missing calls: "
            from
               i := calls.lower
            until
               i > calls.upper
            loop
               if i > calls.lower then
                  Result.append(once ", ")
               end
               Result.append("#(1)#(2)" # calls.item(i).first # calls.item(i).second.out)
               i := i + 1
            end
         end
      end

feature {}
   calls: RING_ARRAY[TUPLE[ABSTRACT_STRING, TUPLE, MOCK_EXPECTATION]]

   add_call (feature_name: STRING; arguments: TUPLE; return: MOCK_EXPECTATION) is
      require
         feature_name /= Void
      do
         if calls = Void then
            create calls.make(1, 0)
         end
         calls.add_last([feature_name.intern, arguments, return])
      end

   check_call (feature_name: STRING; arguments: TUPLE): MOCK_EXPECTATION is
      require
         feature_name /= Void
      local
         call: TUPLE[ABSTRACT_STRING, TUPLE, MOCK_EXPECTATION]
      do
         if calls /= Void then
            call := calls.first
         end
         if call = Void or else call.first /= feature_name.intern then
            label_assert("expect call to #(1)" # feature_name, False)
         elseif not call.second.is_equal(arguments) then
            label_assert("bad arguments to call to #(1)" # feature_name, False)
         else
            Result := call.third
            calls.remove_first
         end
      end

end -- class MOCK_EXPECT
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
