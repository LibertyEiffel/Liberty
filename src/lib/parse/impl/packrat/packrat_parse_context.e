-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PACKRAT_PARSE_CONTEXT

inherit
   PARSE_CONTEXT

insert
   PACKRAT_INTERNAL
   TRISTATE_VALUES

create {PACKRAT_PARSER}
   make

feature {ANY}
   buffer: MINI_PARSER_BUFFER
   actions: COLLECTION[PARSE_ACTION]

feature {PACKRAT_INTERNAL}
   memo: PACKRAT_CONTEXT_MEMO
      do
         Result.set(buffer.memo, actions.count)
      ensure
         Result.is_set
      end

   restore (a_memo: like memo)
      require
         a_memo.is_set
      do
         buffer.restore(a_memo.memo)
         if actions.count > memo.action_count then
            actions.remove_tail(actions.count - memo.action_count)
         end
      end

   save_actions: like actions
      do
         Result := actions
         create {FAST_ARRAY[PARSE_ACTION]} actions.make(0)
      ensure
         actions /= old actions
         Result = old actions
      end

   restore_old_actions (old_actions: like actions)
      require
         old_actions /= Void
      do
         actions := old_actions
      ensure
         actions = old_actions
      end

feature {PACKRAT_PRIMARY}
   pack (atom: PACKRAT_PRIMARY; index: INTEGER): PACKRAT_PACK
      local
         atom_data: AVL_DICTIONARY[PACKRAT_PACK, INTEGER]
      do
         atom_data := data.reference_at(atom)
         if atom_data /= Void and then atom_data.has(index) then
            Result := atom_data.at(index)
         end
      end

   set_pack (atom: PACKRAT_PRIMARY; index: INTEGER; parsed: TRISTATE; position: PACKRAT_CONTEXT_MEMO): PACKRAT_PACK
      require
         not pack(atom, index).is_set
      local
         atom_data: AVL_DICTIONARY[PACKRAT_PACK, INTEGER]
      do
         atom_data := data.reference_at(atom)
         if atom_data = Void then
            create atom_data.make
            data.put(atom_data, atom)
         end
         if parsed = no then
            Result.set(parsed, position, Void)
         else
            Result.set(parsed, position, actions)
         end
         atom_data.put(Result, index)
      ensure
         Result = pack(atom, index)
         Result.is_set
         parsed = no implies Result.actions = Void
         parsed /= no implies Result.actions = actions
      end

feature {}
   make (a_buffer: like buffer; a_actions: like actions)
      require
         a_buffer /= Void
         a_actions /= Void
      do
         buffer := a_buffer
         actions := a_actions
         create data.make
      ensure
         buffer = a_buffer
         actions = a_actions
      end

   data: HASHED_DICTIONARY[AVL_DICTIONARY[PACKRAT_PACK, INTEGER], PACKRAT_PRIMARY]
         -- atom name -> column -> (parsed, actions)

invariant
   data /= Void
   actions /= Void

end -- class PACKRAT_PARSE_CONTEXT
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
