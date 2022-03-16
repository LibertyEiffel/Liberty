-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class PACKRAT_PACK

insert
   TRISTATE_VALUES
      redefine
         default_create, is_equal
      end

feature {ANY}
   is_equal (other: like Current): BOOLEAN
      do
         Result := Precursor(other) -- because this class is expanded, therefore `twin` must succeed
            or else (is_set and then other.is_set
               and then (parsed = other.parsed
                  and then memo = other.memo
                  and then (actions = other.actions
                     or else (actions /= Void and then other.actions /= Void
                        and then actions.is_equal(other.actions)))))
      end

   parsed: TRISTATE
      require
         is_set
      do
         Result := my_parsed
      end

   memo: PACKRAT_CONTEXT_MEMO
      require
         is_set
      do
         Result := my_memo
      end

   actions: COLLECTION[PARSE_ACTION]
      require
         is_set
      do
         Result := my_actions
      end

   is_set: BOOLEAN

   default_create
      do
         is_set := False
      end

feature {PACKRAT_INTERNAL}
   set (a_parsed: like parsed; a_memo: like memo; a_actions: like actions)
      require
         not is_set
         ;(a_parsed = no) = (a_actions = Void)
      do
         my_parsed := a_parsed
         my_memo := a_memo
         my_actions := a_actions
         is_set := True
      ensure
         is_set
         parsed = a_parsed
         memo = a_memo
         actions = a_actions
      end

   my_parsed: TRISTATE
   my_memo: PACKRAT_CONTEXT_MEMO
   my_actions: COLLECTION[PARSE_ACTION]

invariant
   is_set implies ((parsed = no) = (actions = Void))

end -- class PACKRAT_PACK
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
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
