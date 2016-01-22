-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class MOCK_PROCEDURE_EXPECTATION[T_ -> TUPLE]

inherit
   MOCK_TYPED_EXPECTATION[T_]
      export {MOCK_OBJECT}
         call
      end

create {MOCK_EXPECT}
   make

feature {}
   do_call (args: MOCK_ARGUMENTS)
      do
         if side_effect /= Void then
            side_effect.call([args])
         end
      end

feature {ANY}
   with_side_effect, infix "~>" (a_side_effect: PROCEDURE[TUPLE[MOCK_ARGUMENTS]]): like Current
      require
         not ready
         not result_ready
      do
         side_effect := a_side_effect
         result_ready := True
         Result := Current
      ensure
         side_effect = a_side_effect
         Result = Current
         result_ready
      end

feature {}
   side_effect: PROCEDURE[TUPLE[MOCK_ARGUMENTS]]
   result_ready: BOOLEAN

end -- class MOCK_PROCEDURE_EXPECTATION
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
