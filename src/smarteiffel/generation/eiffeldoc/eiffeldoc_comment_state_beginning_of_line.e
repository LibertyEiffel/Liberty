-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELDOC_COMMENT_STATE_BEGINNING_OF_LINE
   --
   -- Handle the beginning of a line (either at beginning of the comment or upon a new line).
   --

inherit
   EIFFELDOC_COMMENT_STATE

create {EIFFELDOC_CONTEXT}
   make

feature {EIFFELDOC_COMMENT_WRITER, EIFFELDOC_COMMENT_STATE}
   can_handle (comment: STRING; offset: INTEGER): BOOLEAN
      do
         Result := offset = comment.lower
            or else (offset <= comment.upper
                     and then comment.item(offset) = '%N')
            or else offset > comment.upper
         if not Result then
            skipped := 0
         end
      end

   handle (comment: STRING; offset: INTEGER; for_feature: ANONYMOUS_FEATURE; states: STACK[EIFFELDOC_COMMENT_STATE]): INTEGER
      require else
         can_handle(comment, offset) -- To handle empty comments
      local
         done, skip: BOOLEAN
      do
         from
            Result := offset
         until
            done or else Result > comment.upper
         loop
            inspect
               comment.item(Result)
            when '%N' then
               done := skip
               if not done then
                  skip := True
                  skipped := skipped + 1
                  Result := Result + 1
               end
            when ' ', '%T' then
               Result := Result + 1
            else
               done := True
            end
         end
         if offset > comment.upper then
            close_children(states)
            html.close_div
            check Result = offset end
            if (not states.is_empty) and then states.top = Current then
               states.pop
            end
         elseif offset = comment.lower then
            html.open_div
            skipped := 2
            states.push(Current)
            Result := comment.lower
         else
            check Result > offset end
            check skipped > 0 end
            inspect skipped
            when 1 then
               html.put_character('%N')
            when 2 then
               close_children(states)
               html.close_div
               html.open_div
            else
               -- nothing: extra new lines not taken into account
            end
         end
      end

   abort (states: STACK[EIFFELDOC_COMMENT_STATE])
      do
         html.close_div
         states.pop
      end

   handle_first: BOOLEAN False

feature {}
   skipped: INTEGER

   make (a_context: like context)
      require
         a_context /= Void
      do
         context := a_context
      end

   close_children (states: STACK[EIFFELDOC_COMMENT_STATE])
         -- Allow pending constructs to close gracefully
      do
         from
         variant
            states.count
         until
            states.is_empty or else states.top = Current
         loop
            states.top.abort(states)
         end
      end

end -- class EIFFELDOC_COMMENT_STATE_BEGINNING_OF_LINE
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
