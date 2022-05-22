-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELDOC_COMMENT_STATE_IN_CHARACTER
   --
   -- Handle single characters (in single quotes)
   --

inherit
   EIFFELDOC_COMMENT_STATE

create {EIFFELDOC_CONTEXT}
   make

feature {EIFFELDOC_COMMENT_WRITER, EIFFELDOC_COMMENT_STATE}
   can_handle (comment: STRING; offset: INTEGER): BOOLEAN
      do
         if offset < comment.count and then comment.item(offset) = '%'' then
            if comment.item(offset + 1) = '%%' then
               Result := offset <= comment.count - 3 and then comment.item(offset + 3) = '%''
            else
               Result := offset <= comment.count - 2 and then comment.item(offset + 2) = '%''
            end
         end
      end

   handle (comment: STRING; offset: INTEGER; for_feature: ANONYMOUS_FEATURE; states: STACK[EIFFELDOC_COMMENT_STATE]): INTEGER
      do
         html.with_attribute(once "class", once "wiki_character")
         html.open_typeset
         html.put_character('%'')
         if offset < comment.count and then comment.item(offset) = '%'' then
            if comment.item(offset + 1) = '%%' then
               html.put_character('%%')
               html.put_character(comment.item(offset + 2))
               Result := offset + 4
            else
               html.put_character(comment.item(offset + 1))
               Result := offset + 3
            end
         end
         html.put_character('%'')
         html.close_typeset
      end

   abort (states: STACK[EIFFELDOC_COMMENT_STATE])
      do
         check
            False
         end
      end

   handle_first: BOOLEAN True

feature {}
   make (a_context: like context)
      require
         a_context /= Void
      do
         context := a_context
      end

end -- class EIFFELDOC_COMMENT_STATE_IN_CHARACTER
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
