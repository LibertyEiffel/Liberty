-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELDOC_COMMENT_STATE_IN_PREFORMATTED
   --
   -- This is an example of preformatted text:
   --
   --  if element.is_fifth then
   --     zorg.game_over
   --  end
   --

inherit
   EIFFELDOC_COMMENT_STATE_IN_LIST

create {EIFFELDOC_CONTEXT}
   make

feature {}
   is_list_marker (c: CHARACTER): BOOLEAN
      do
         Result := (once " %T").has(c)
      end

   open_lists (how_many: INTEGER)
      local
         i, d: INTEGER
      do
         if depth = 0 then
            html.with_attribute(once "class", once "wiki_preformatted")
            html.open_preformatted
         else
            html.put_new_line
         end
         from
            d := depth + how_many
         until
            i = d
         loop
            html.put_character(' ')
            i := i + 1
         end
      end

   close_lists (how_many: INTEGER)
      local
         i, d: INTEGER
      do
         if how_many = depth then
            html.close_preformatted
         else
            html.put_new_line
            from
               d := depth - how_many
            until
               i = d
            loop
               html.put_character(' ')
               i := i + 1
            end
         end
      end

   next_list_item
      local
         i: INTEGER
      do
         html.put_new_line
         from
         until
            i = depth
         loop
            html.put_character(' ')
            i := i + 1
         end
      end

feature {}
   make (a_context: like context)
      require
         a_context /= Void
      do
         context := a_context
      end

end -- class EIFFELDOC_COMMENT_STATE_IN_PREFORMATTED
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
