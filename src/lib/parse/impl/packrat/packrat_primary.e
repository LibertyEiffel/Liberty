-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class PACKRAT_PRIMARY

inherit
   HASHABLE

insert
   PACKRAT_INTERNAL
      redefine
         is_equal
      end
   TRISTATE_VALUES
      redefine
         is_equal
      end
   VISITABLE
      redefine
         is_equal
      end

feature {ANY}
   hash_code: INTEGER
      do
         Result := to_pointer.hash_code
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := other = Current
      end

   frozen positive_lookahead, prefix "@": PACKRAT_ALTERNATIVE
      do
         create {PACKRAT_AND} Result.make(Current)
      end

   frozen negative_lookahead, prefix "~": PACKRAT_ALTERNATIVE
      do
         create {PACKRAT_NOT} Result.make(Current)
      end

   is_coherent: BOOLEAN
      deferred
      ensure
         must_be_coherent: Result
      end

feature {ANY}
   accept (visitor: PACKRAT_VISITOR)
      deferred
      end

feature {PACKRAT_INTERNAL}
   frozen parse (context: PACKRAT_PARSE_CONTEXT): TRISTATE
      require
         context /= Void
      local
         actions: COLLECTION[PARSE_ACTION]
         pack: PACKRAT_PACK
         parsed: TRISTATE
         index: INTEGER
      do
         index := context.buffer.current_index
         debug ("parse")
            log.trace.put_string(once "**** parsing #(1) at #(2)" # out # index.out)
         end
         pack := context.pack(Current, index)
         if pack.is_set then
            debug ("parse")
               log.trace.put_line(once " (cached: parsed=#(1))" # pack.parsed.out)
            end
            context.restore(pack.memo)
            if pack.actions /= Void then
               context.actions.append_traversable(pack.actions)
            end
         else
            debug ("parse")
               log.trace.put_line(once " (NOT cached)")
            end
            actions := context.save_actions
            parsed := pack_parse(context)
            pack := context.set_pack(Current, index, parsed, context.memo)
            context.restore_old_actions(actions)
         end

         Result := pack.parsed
         if Result /= no then
            context.actions.append_traversable(pack.actions)
         end
      ensure
         Result /= yes implies context.buffer.current_index = old context.buffer.current_index
      end

   set_default_tree_builders (non_terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]]; terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, PARSER_IMAGE]])
      deferred
      end

   set_nt (a_nt: like nt)
      require
         a_nt /= Void
      do
         nt := a_nt
      ensure
         nt = a_nt
      end

   nt: PACKRAT_NON_TERMINAL

   set_paren (a_paren: like need_paren)
      do
         need_paren := a_paren
      ensure
         need_paren = a_paren
      end

feature {PACKRAT_INTERNAL, PACKRAT_VISITOR}
   need_paren: BOOLEAN

feature {}
   pack_parse (context: PACKRAT_PARSE_CONTEXT): TRISTATE
      require
         context /= Void
      deferred
      ensure
         Result /= yes implies context.buffer.current_index = old context.buffer.current_index
      end

end -- class PACKRAT_PRIMARY
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
