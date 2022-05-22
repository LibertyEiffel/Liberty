-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELDOC_COMMENT_STATE_IN_URL
   --
   -- Handle URLs which must be put in single brackets: first the URL, then a possible label after a space.
   --
   -- Non-bracketed URLS such as http://liberty-eiffel.blogspot.com are also handled.
   --

inherit
   EIFFELDOC_COMMENT_STATE

create {EIFFELDOC_CONTEXT}
   make

feature {EIFFELDOC_COMMENT_WRITER, EIFFELDOC_COMMENT_STATE}
   can_handle (comment: STRING; offset: INTEGER): BOOLEAN
      do
         if offset < comment.count then
            if comment.item(offset) = '[' then
               Result := is_url(comment, offset + 1)
            elseif comment.item(offset) = ']' then
               Result := True
            else
               Result := is_url(comment, offset)
            end
         end
      end

   handle (comment: STRING; offset: INTEGER; for_feature: ANONYMOUS_FEATURE; states: STACK[EIFFELDOC_COMMENT_STATE]): INTEGER
      local
         i: INTEGER; buffer: STRING; tagged: BOOLEAN
      do
         if comment.item(offset) = ']' then
            if not states.is_empty and then states.top = Current then
               states.pop
               html.close_anchor
            else
               html.put_character(']')
            end
            Result := offset + 1
         else
            buffer := once ""
            buffer.clear_count
            tagged := comment.item(offset) = '['
            from
               if tagged then
                  i := offset + 1
               else
                  i := offset
               end
            until
               i > comment.count or else comment.item(i).is_separator or else (tagged and then comment.item(i) = ']')
            loop
               buffer.extend(comment.item(i))
               i := i + 1
            end
            html.with_attribute(once "class", once "wiki_url")
            html.with_attribute(once "href", filtered_attribute(buffer))
            html.open_anchor
            if i > comment.count or else comment.item(i) = ']' or else not tagged then
               html.put_string(buffer)
               html.close_anchor
               if tagged then
                  Result := i + 1
               else
                  Result := i
               end
            else
               states.push(Current)
               Result := i
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
   is_url (comment: STRING; offset: INTEGER): BOOLEAN
      local
         i, o: INTEGER
      do
         o := comment.index_of(':', offset)
         if o > 0 then
            from
               i := url_protocols.lower
            until
               Result or else i > url_protocols.upper
            loop
               Result := comment.substring_index(url_protocols.item(i), offset) = offset
               i := i + 1
            end
         end
      end

   url_protocols: FAST_ARRAY[STRING]
      once
         Result := {FAST_ARRAY[STRING] << "http:", "ftp:", "https:", "mailto:" >>}
      end

feature {}
   make (a_context: like context)
      require
         a_context /= Void
      do
         context := a_context
      end

end -- class EIFFELDOC_COMMENT_STATE_IN_URL
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
