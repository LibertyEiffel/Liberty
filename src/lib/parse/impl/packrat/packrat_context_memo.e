-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class PACKRAT_CONTEXT_MEMO

insert
   PACKRAT_INTERNAL
      redefine
         is_equal
      end

feature {ANY}
   is_equal (other: like Current): BOOLEAN
      do
         Result := is_set = other.is_set
            and then memo = other.memo
            and then action_count = other.action_count
      end

feature {PACKRAT_INTERNAL}
   is_set: BOOLEAN

   memo: INTEGER
      require
         is_set
      do
         Result := my_memo
      end

   action_count: INTEGER
      require
         is_set
      do
         Result := my_action_count
      end

feature {PACKRAT_PARSE_CONTEXT}
   set (a_memo: like memo; a_action_count: like action_count)
      require
         not is_set
      do
         my_memo := a_memo
         my_action_count := a_action_count
         is_set := True
      ensure
         is_set
         memo = a_memo
         action_count = a_action_count
      end

   my_memo: INTEGER
   my_action_count: INTEGER

end -- class PACKRAT_CONTEXT_MEMO
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
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
