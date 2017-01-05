-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class MOCK_FUNCTION_EXPECTATION[T_ -> TUPLE, R_]

inherit
   MOCK_TYPED_EXPECTATION[T_]

create {MOCK_EXPECT}
   make

feature {MOCK_OBJECT}
   item (a_arguments: MOCK_ARGUMENTS): R_
      require
         can_call(target, feature_name, a_arguments)
      do
         call(a_arguments)
         Result := last_item
      end

feature {}
   do_call (args: MOCK_ARGUMENTS)
      do
         if side_effect /= Void then
            last_item := side_effect.item([args])
         else
            last_item := given_result
         end
      end

   last_item: R_

feature {ANY}
   result_ready: BOOLEAN

   then_return, infix "=>" (a_item: R_): like Current
      require
         not ready
         not result_ready
      do
         given_result := a_item
         check side_effect = Void end
         result_ready := True
         Result := Current
      ensure
         Result = Current
         given_result = a_item
         result_ready
      end

   with_side_effect, infix "~>" (a_side_effect: FUNCTION[TUPLE[MOCK_ARGUMENTS], R_]): like Current
      require
         not ready
      do
         side_effect := a_side_effect
         result_ready := True
         Result := Current
      ensure
         Result = Current
         side_effect = a_side_effect
         result_ready
      end

feature {}
   given_result: R_
   side_effect: FUNCTION[TUPLE[MOCK_ARGUMENTS], R_]

end -- class MOCK_FUNCTION_EXPECTATION
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
