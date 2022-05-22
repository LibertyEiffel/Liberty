-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELDOC_COMMENT_STATE_IN_STRING
   --
   -- Handle Eiffel strings
   --
   -- '' Known bug:'' '%"' in strings not correctly handled. Verbatim multi-line strings are not handled either.
   --

inherit
   EIFFELDOC_COMMENT_STATE

create {EIFFELDOC_CONTEXT}
   make

feature {EIFFELDOC_COMMENT_WRITER, EIFFELDOC_COMMENT_STATE}
   can_handle (comment: STRING; offset: INTEGER): BOOLEAN
      do
         Result := offset < comment.count and then comment.item(offset) = '"' and then comment.index_of('"', offset + 1) > offset
      end

   handle (comment: STRING; offset: INTEGER; for_feature: ANONYMOUS_FEATURE; states: STACK[EIFFELDOC_COMMENT_STATE]): INTEGER
      local
         i: INTEGER
      do
         html.with_attribute(once "class", once "wiki_string")
         html.open_typeset
         i := comment.index_of('"', offset + 1)
         buffer.copy(comment)
         buffer.shrink(offset, i)
         html.put_string(buffer)
         html.close_typeset
         Result := i + 1
      end

   abort (states: STACK[EIFFELDOC_COMMENT_STATE])
      do
         check
            False
         end
      end

   handle_first: BOOLEAN True

feature {}
   buffer: STRING ""

feature {}
   make (a_context: like context)
      require
         a_context /= Void
      do
         context := a_context
      end

end -- class EIFFELDOC_COMMENT_STATE_IN_STRING
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
