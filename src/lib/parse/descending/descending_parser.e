-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class DESCENDING_PARSER
   --
   -- The entry point to LL(n) parsing. Currently that top-down parsing is directly implemented in the
   -- PARSE_ATOM classes.
   --

insert
   TRISTATE_VALUES
   LOGGING

creation {ANY}
   make

feature {ANY}
   parse (buffer: MINI_PARSER_BUFFER; grammar: PARSE_TABLE; start: STRING; a_actions: COLLECTION[PARSE_ACTION]): BOOLEAN is
         -- Returns True if the parsing succeeded or definitely could not succeed, False if some more text
         -- could make it succeed.
      require
         a_actions /= Void
         grammar.is_coherent
         grammar.has(start)
      local
         atom: PARSE_ATOM
         parsed: TRISTATE
      do
         error := Void
         atom := grammar.item(start)
         parsed := atom.parse(buffer, a_actions)
         if parsed = yes then
            Result := True
         elseif parsed = no then
            error := buffer.last_error
            if error = Void then
               create error.make(1, once "This does not look like Eiffel, not even remotely.", Void)
            end
            Result := True
         else
            check
               should_add_more: not Result
            end
         end
      ensure
         a_actions.count >= old a_actions.count
      end

   eval (buffer: MINI_PARSER_BUFFER; grammar: PARSE_TABLE; start: STRING): BOOLEAN is
         -- Returns True if the parsing succeeded or definitely could not succeed, False if some more text
         -- could make it succeed.
      local
         i: INTEGER
      do
         save_actions
         Result := parse(buffer, grammar, start, actions)
         if Result and then error = Void then
            debug ("parse")
               log.trace.put_line(once "Actions:")
               log.trace.put_line(once "--8<-------- <start actions>")
               from
                  i := actions.lower
               until
                  i > actions.upper
               loop
                  log.trace.put_integer(i)
                  log.trace.put_character('%T')
                  log.trace.put_line(actions.item(i).name)
                  i := i + 1
               end
               log.trace.put_line(once "-------->8-- <end actions>")
            end
            from
               i := actions.lower
            until
               i > actions.upper
            loop
               debug ("parse")
                  log.trace.put_string(once "Calling action #")
                  log.trace.put_integer(i)
                  log.trace.put_string(once ": ")
                  log.trace.put_line(actions.item(i).name)
               end
               actions.item(i).call
               i := i + 1
            end
         end
         actions.clear_count
         restore_actions
      end

   error: PARSE_ERROR

feature {}
   make is
      do
      end

   used_actions: FAST_ARRAY[FAST_ARRAY[PARSE_ACTION]] is
      once
         create Result.make(0)
      end

   free_actions: FAST_ARRAY[FAST_ARRAY[PARSE_ACTION]] is
      once
         create Result.make(0)
      end

   actions: FAST_ARRAY[PARSE_ACTION]

   save_actions is
      do
         if actions = Void then
            actions := new_free_actions
         elseif not actions.is_empty then
            used_actions.add_last(actions)
            actions := new_free_actions
         end
      ensure
         actions.is_empty
         ;(old (actions /= Void and then not actions.is_empty)) implies (used_actions.last = old actions)
         ;(old (actions /= Void and then not actions.is_empty)) implies (used_actions.count = old used_actions.count + 1)
      end

   restore_actions is
      require
         actions.is_empty
      do
         if not used_actions.is_empty then
            free_actions.add_last(actions)
            actions := used_actions.last
            used_actions.remove_last
         end
      ensure
         actions /= Void
         ;(not old used_actions.is_empty) implies (actions = (old used_actions.twin).last)
         ;(not old used_actions.is_empty) implies (used_actions.count = old used_actions.count - 1)
      end

   new_free_actions: like actions is
      do
         if free_actions.is_empty then
            create Result.make(0)
         else
            Result := free_actions.last
            free_actions.remove_last
         end
      ensure
         Result.is_empty
      end

end -- class DESCENDING_PARSER
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
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
