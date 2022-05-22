-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELDOC_COMMENT_STATE_IN_WIKI_WORD
   --
   -- Syntax: the word between double brackets, with possibly a pipe and a label
   --
   -- [[Main Page]]
   -- [[FAQ|the FAQ]]
   --

inherit
   EIFFELDOC_COMMENT_STATE

create {EIFFELDOC_CONTEXT}
   make

feature {}
   default_wiki_prefix: STRING "http://wiki.liberty-eiffel.org/en/index.php/"

   wiki_prefix: STRING

feature {EIFFELDOC_COMMENT_WRITER, EIFFELDOC_COMMENT_STATE}
   can_handle (comment: STRING; offset: INTEGER): BOOLEAN
      do
         if offset < comment.count - 1 then
            if comment.item(offset) = '[' and then comment.item(offset + 1) = '[' and then comment.substring_index(once "]]", offset) > offset then
               Result := True
            elseif comment.item(offset) = ']' and then comment.item(offset + 1) = ']' then
               Result := True
            end
         end
      end

   handle (comment: STRING; offset: INTEGER; for_feature: ANONYMOUS_FEATURE; states: STACK[EIFFELDOC_COMMENT_STATE]): INTEGER
      local
         pipe, bracket: INTEGER
      do
         Result := offset
         inspect comment.item(offset)
         when '[' then
            pipe := comment.index_of('|', offset)
            bracket := comment.substring_index(once "]]", offset)
            if pipe > 0 and then pipe < bracket then
               generate_wiki_word(comment, offset + 2, pipe - 1, False)
               Result := pipe + 1
               states.push(Current)
            else
               generate_wiki_word(comment, offset + 2, bracket - 1, True)
               Result := bracket + 2
            end
         when ']' then
            if states.top = Current then
               Result := offset + 2
               states.pop
               html.close_anchor
            end
         end
      end

   abort (states: STACK[EIFFELDOC_COMMENT_STATE])
      do
         html.close_anchor
         states.pop
      end

   handle_first: BOOLEAN True

feature {}
   generate_wiki_word (comment: STRING; first, last: INTEGER; close_anchor: BOOLEAN)
      local
         buffer, url: STRING
      do
         buffer := once ""
         buffer.copy(comment)
         buffer.shrink(first, last)
         url := once ""
         url.copy(wiki_prefix)
         url.append(buffer)
         html.with_attribute(once "class", once "wiki_word")
         html.with_attribute(once "href", filtered_attribute(url))
         html.open_anchor
         if close_anchor then
            html.put_string(buffer)
            html.close_anchor
         end
      end

feature {}
   make (a_context: like context)
      require
         a_context /= Void
      do
         context := a_context
         if context.options.wiki_prefix /= Void then
            wiki_prefix := context.options.wiki_prefix
         else
            wiki_prefix := default_wiki_prefix
         end
      end

end -- class EIFFELDOC_COMMENT_STATE_IN_WIKI_WORD
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
-- https://www.liberty-eiffel.org
-- ------------------------------------------------------------------------------------------------------------------------------
