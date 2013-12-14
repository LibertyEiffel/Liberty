-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class MOCK_FUNCTION_EXPECTATION[E_]

inherit
   MOCK_EXPECTATION

create {MOCK_EXPECT}
   make

feature {MOCK_OBJECT}
   item: E_

feature {}
   do_call is
      do
         if side_effect /= Void then
            item := side_effect.item([])
         else
            item := given_result
         end
      end

feature {ANY}
   result_ready: BOOLEAN

   then_return, infix "=>" (a_item: E_): like Current is
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

   with_side_effect, infix "~>" (a_side_effect: FUNCTION[TUPLE, E_]): like Current is
      require
         not ready
      local
         def: E_
      do
         check given_result = def end
         side_effect := a_side_effect
         result_ready := True
         Result := Current
      ensure
         Result = Current
         side_effect = a_side_effect
         result_ready
      end

feature {}
   given_result: E_
   side_effect: FUNCTION[TUPLE, E_]

end -- class MOCK_FUNCTION_EXPECTATION[E_]
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
