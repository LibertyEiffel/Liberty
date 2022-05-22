-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class EIFFELDOC_COMMENT_STATE_IN_LIST

inherit
   EIFFELDOC_COMMENT_STATE

feature {}
   is_list_marker (c: CHARACTER): BOOLEAN
         -- True if the character at the beginning of the line is a list marker (bullet, number, and so forth)
      deferred
      end

   open_lists (how_many: INTEGER)
         -- Open new lists. Also open a list item.
      require
         how_many > 0
      deferred
      end

   close_lists (how_many: INTEGER)
         -- Close lists. If `how_many' < `depth', also open a new list item.
      require
         how_many.in_range(1, depth)
      deferred
      end

   next_list_item
         -- Open another list item
      deferred
      end

feature {EIFFELDOC_COMMENT_WRITER, EIFFELDOC_COMMENT_STATE}
   can_handle (comment: STRING; offset: INTEGER): BOOLEAN
      local
         i: INTEGER
      do
         if offset > comment.upper then
            list_marker_offset := offset
            newline := True
            Result := True
         else
            if offset = comment.lower then
               if comment.first = '%N' then
                  i := comment.lower + 1
               else
                  i := comment.lower
               end
               Result := i < comment.upper
            elseif comment.item(offset) = '%N' then
               i := offset + 1
               Result := i < comment.upper
            else
               newline := False
            end
            if Result then
               if (once " %T").has(comment.item(i)) then
                  i := i + 1
               end
               list_marker_offset := i
            end
         end
      end

   handle (comment: STRING; offset: INTEGER; for_feature: ANONYMOUS_FEATURE; states: STACK[EIFFELDOC_COMMENT_STATE]): INTEGER
      local
         d: INTEGER; newitem: BOOLEAN
      do
         check
            list_marker_offset >= offset
         end

         -- 1. count list markers
         from
            Result := list_marker_offset
         until
            Result > comment.upper or else not is_list_marker(comment.item(Result))
         loop
            d := d + 1
            newitem := True
            Result := Result + 1
         end

         -- 2. are we already in a list of the same kind?
         if not states.is_empty and then states.top = Current then
            -- yes, calculate how much depth has changed
            if d = 0 then
               if newline then
                  -- already skipped a line, lists must be closed
                  states.pop
                  d := -depth
                  newline := False
               else
                  -- just a new line in an item
                  newline := True
               end
            else
               -- depth has changed
               d := d - depth
               newline := False
            end
         elseif d > 0 then
            -- we begin a new list
            states.push(Current)
            newline := False
         else
            -- we're not in a list after all
            check
               d = 0
               not newitem
            end
            newline := False
            Result := offset
         end

         -- 3. `d' is the delta depth, open or close lists as required
         if d > 0 then
            open_lists(d)
            depth := depth + d
         elseif d < 0 then
            close_lists(-d)
            if newitem then
               depth := depth + d
               check depth > 0 end
            else
               check d = -depth end
               Result := offset
               depth := 0
            end
         elseif newitem then
            next_list_item
         elseif newline then
            html.put_new_line
         end
      ensure then
         (Result = offset) = (depth = 0)
      end

   abort (states: STACK[EIFFELDOC_COMMENT_STATE])
      do
         close_lists(depth)
         depth := 0
         states.pop
      end

   handle_first: BOOLEAN True

feature {}
   list_marker_offset: INTEGER
   depth: INTEGER
   newline: BOOLEAN

invariant
   depth >= 0

end -- class EIFFELDOC_COMMENT_STATE_IN_LIST
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
