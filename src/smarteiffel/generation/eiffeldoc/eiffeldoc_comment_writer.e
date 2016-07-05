-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELDOC_COMMENT_WRITER
   --
   -- Produces a nicely formatted comment, using a very light wiki syntax.
   --
   -- '''Note:''' HTML tags are not supported, neither is the special <nowiki> tag.
   --
   -- See also EIFFELDOC_COMMENT_STATE and its children.
   --

inherit
   IN_OUT_VISITOR

insert
   EIFFELDOC_GLOBALS
   PLATFORM

create {EIFFELDOC_CONTEXT}
   make

feature {EIFFELDOC_CONTEXT}
   write (comment: COMMENT; for_feature: ANONYMOUS_FEATURE; first_sentence, last_sentence: INTEGER)
         -- Write the comment from sentence `first_sentence' (included) to the sentence `last_sentence'
         -- (excluded).  If `last_sentence' = 0, then all the sentences from `from_sentence' will be written.
      require
         comment /= Void
         from_sentence >= 1
         from_sentence <= to_sentence or else to_sentence = 0
      local
         i: INTEGER; line: STRING
      do
         from_sentence := first_sentence
         if last_sentence = 0 then
            to_sentence := Maximum_integer
         else
            to_sentence := last_sentence - 1
         end
         from
            line := once ""
            buffer.clear_count
            comment_open_braces.clear_count
            state := 1
            sentence_count := 1
            i := comment.list.lower
         until
            i > comment.list.upper
         loop
            line.copy(comment.list.item(i))
            line.extend('%N')
            append_comment_line_in(line)
            i := i + 1
         end

         if not buffer.is_empty then
            put_comment_buffer(for_feature)
         end
      end

feature {}
   append_comment_line_in (line: STRING)
         -- Appends a formatted comment `line' in the `buffer' (only the given sentence interval are actually
         -- included).
         -- Some care is taken to correctly finish a sentence (i.e. cases when a dot is in parentheses, or
         -- more than one dot follow in a row, and so on)
      require
         buffer /= Void
      local
         i: INTEGER; c: CHARACTER
      do
         -- A big finite-state automaton to be sure to correctly stop at an end of sentence.
         -- `p' is the previous character.
         from
            i := 1
         until
            state = 0 or else i > line.count
         loop
            c := line.item(i)
            inspect
               state
            when 1 then
               -- Normal state.
               inspect
                  c
               when ' ', '%N', '%F', '%R', '%T' then
                  extend(c)
                  state := 2
               when '(', '[', '{', '<', '`' then
                  extend(c)
                  comment_open_braces.add_last(c)
               when '%%' then
                  state := 4
               when '"' then
                  if comment_open_braces.count > 0 and then comment_open_braces.last = '"' then
                     -- closing '"'
                     comment_open_braces.remove_last
                  else
                     -- opening '"'
                     comment_open_braces.add_last(c)
                  end
                  extend(c)
               when '>' then
                  if comment_open_braces.count > 0 and then comment_open_braces.last = '<' then
                     comment_open_braces.remove_last
                  end
                  extend(c)
               when '}' then
                  if comment_open_braces.count > 0 and then comment_open_braces.last = '{' then
                     comment_open_braces.remove_last
                  end
                  extend(c)
               when ']' then
                  if comment_open_braces.count > 0 and then comment_open_braces.last = '[' then
                     comment_open_braces.remove_last
                  end
                  extend(c)
               when ')' then
                  if comment_open_braces.count > 0 and then comment_open_braces.last = '(' then
                     comment_open_braces.remove_last
                  end
                  extend(c)
               when '%'' then
                  if comment_open_braces.count > 0 and then comment_open_braces.last = '`' then
                     comment_open_braces.remove_last
                  end
                  extend(c)
               when '.', '!', '?' then
                  extend(c)
                  state := 3
               else
                  extend(c)
               end
            when 2 then
               -- After a separator.
               inspect
                  c
               when ' ', '%N', '%F', '%R', '%T' then
                  extend(c)
               when '(', '[', '{', '<', '`' then
                  extend(c)
                  comment_open_braces.add_last(c)
                  state := 1
               when '%%' then
                  state := 4
               when '"' then
                  comment_open_braces.add_last(c)
                  extend(c)
                  state := 1
               when '>' then
                  if comment_open_braces.count > 0 and then comment_open_braces.last = '<' then
                     comment_open_braces.remove_last
                  end
                  extend(c)
                  state := 1
               when '}' then
                  if comment_open_braces.count > 0 and then comment_open_braces.last = '{' then
                     comment_open_braces.remove_last
                  end
                  extend(c)
                  state := 1
               when ']' then
                  if comment_open_braces.count > 0 and then comment_open_braces.last = '[' then
                     comment_open_braces.remove_last
                  end
                  extend(c)
                  state := 1
               when ')' then
                  if comment_open_braces.count > 0 and then comment_open_braces.last = '(' then
                     comment_open_braces.remove_last
                  end
                  extend(c)
                  state := 1
               when '%'' then
                  if comment_open_braces.count > 0 and then comment_open_braces.last = '`' then
                     comment_open_braces.remove_last
                  end
                  extend(c)
                  state := 1
               else
                  extend(c)
                  state := 1
               end
            when 3 then
               -- Reached a dot ('.', '!' or '?').
               inspect
                  c
               when ' ', '%N', '%F', '%R', '%T' then
                  if comment_open_braces.is_empty then
                     sentence_count := sentence_count + 1
                  end
                  extend(c)
                  state := 1
               when '%%' then
                  state := 5
               when '"' then
                  extend(c)
                  if comment_open_braces.is_empty then
                     sentence_count := sentence_count + 1
                     state := 1
                  elseif comment_open_braces.last = '"' then
                     comment_open_braces.remove_last
                  else
                     state := 1
                  end
               when '>' then
                  extend(c)
                  if comment_open_braces.is_empty then
                     sentence_count := sentence_count + 1
                     state := 1
                  elseif comment_open_braces.last = '<' then
                     comment_open_braces.remove_last
                  else
                     state := 1
                  end
               when '}' then
                  extend(c)
                  if comment_open_braces.is_empty then
                     sentence_count := sentence_count + 1
                     state := 1
                  elseif comment_open_braces.last = '{' then
                     comment_open_braces.remove_last
                  else
                     state := 1
                  end
               when ']' then
                  extend(c)
                  if comment_open_braces.is_empty then
                     sentence_count := sentence_count + 1
                     state := 1
                  elseif comment_open_braces.last = '[' then
                     comment_open_braces.remove_last
                  else
                     state := 1
                  end
               when ')' then
                  extend(c)
                  if comment_open_braces.is_empty then
                     sentence_count := sentence_count + 1
                     state := 1
                  elseif comment_open_braces.last = '(' then
                     comment_open_braces.remove_last
                  else
                     state := 1
                  end
               when '%'' then
                  extend(c)
                  if comment_open_braces.is_empty then
                     sentence_count := sentence_count + 1
                     state := 1
                  elseif comment_open_braces.last = '`' then
                     comment_open_braces.remove_last
                  else
                     state := 1
                  end
               when '.', '!', '?' then
                  extend(c)
               else
                  extend(c) -- not an end of sentence because there is no separator
                  state := 1
               end
            when 4, 5 then
               -- After an escape.
               inspect
                  c
               when '%%' then
                  buffer.extend('%%')
               when '.', '!', '?', '(', ')', '[', ']', '<', '>', '{', '}', '"', '`', '%'' then
                  -- allows to bypass the end-of-sentence checks
                  extend(c)
               when 'U' then
                  -- discarded
               else
                  buffer.extend('%%')
                  extend(c)
               end
               if state = 4 then
                  state := 1
               else
                  state := 3
               end
            end
            i := i + 1
         end
      end

   extend (c: CHARACTER)
      do
         if sentence_count.in_range(from_sentence, to_sentence) then
            buffer.extend(c)
         end
      end

   comment_open_braces: FAST_ARRAY[CHARACTER]
      once
         create Result.make(0)
      end

feature {}
   put_comment_buffer (for_feature: ANONYMOUS_FEATURE)
      require
         not buffer.is_empty
      local
         offset, next_offset, i, lower: INTEGER; current_state, top_state: EIFFELDOC_COMMENT_STATE
         all_states: FAST_ARRAY[EIFFELDOC_COMMENT_STATE]
      do
         all_states := context.all_states
         lower := all_states.lower
         from
            offset := buffer.lower
         until
            offset > buffer.count
         loop
            from
               i := lower
               next_offset := offset
               if top_state /= Void and then top_state.handle_first and then top_state.can_handle(buffer, offset) then
                  next_offset := top_state.handle(buffer, offset, for_feature, states)
                  if states.is_empty then
                     top_state := Void
                  elseif next_offset /= offset then
                     top_state := states.top
                  else
                     check
                        top_state = states.top
                     end
                  end
               end
            until
               next_offset > offset
            loop
               check
                  next_offset = offset
                  i <= all_states.upper
               end
               current_state := all_states.item(i)
               if (current_state /= top_state or else not top_state.handle_first)
                  and then current_state.can_handle(buffer, offset)
                then
                  next_offset := current_state.handle(buffer, offset, for_feature, states)
                  if states.is_empty then
                     top_state := Void
                  elseif next_offset /= offset then
                     top_state := states.top
                  else
                     check
                        top_state = states.top
                     end
                  end
               end
               i := i + 1
            end
            debug
               context.html.put_comment(current_state.generating_type)
            end
            offset := next_offset
         end
         from
            -- The stack should be empty for correctly formatted text, but people are not always that nice.
            -- The wiki syntax must be kept flexible.
         variant
            states.count
         until
            states.is_empty
         loop
            states.top.abort(states)
         end
      end

feature {}
   make (a_context: like context)
      do
         context := a_context
         create states.make
      end

   context: EIFFELDOC_CONTEXT

   states: STACK[EIFFELDOC_COMMENT_STATE]

   sentence_count: INTEGER

   buffer: STRING ""

   from_sentence, to_sentence: INTEGER

   state: INTEGER
         -- The states are:
         -- + 0 - the sentence is finished, exit the automaton.
         -- + 1 - initial state; waiting for more characters.
         -- + 2 - just after some separator character; a sentence cannot finish here.
         -- + 3 - and end-of-sentence character ('.', '?', '!') has been reached. It does not mean that
         --       the sentence finishes now, because we can be inside parentheses; we should wait for
         --       those to close.
         --       Note that "parentheses" are indeed one of round, square, curly, or angle brackets or
         --       double quotes.
         -- + 4 - just after a '%%' escape character in normal state or after a separator.
         -- + 5 - just after a '%%' escape character in end-of-sentence state.

end -- class EIFFELDOC_COMMENT_WRITER
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2005: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://liberty-eiffel.blogspot.com - liberty-eiffel.blogspot.com
-- ------------------------------------------------------------------------------------------------------------------------------
