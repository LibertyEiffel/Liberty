-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EXPORT_ITEM
   --
   -- To store one item of the option "inherit ... export ... end".
   --

inherit
   VISITABLE
insert
   GLOBALS

create {ANY}
   make_all, make

feature {ANY}
   accept (visitor: EXPORT_ITEM_VISITOR)
      do
         visitor.visit_export_item(Current)
      end

   clients: CLIENT_LIST

   list: FEATURE_NAME_LIST

feature {}
   make_all (c: like clients)
      require
         c /= Void
      do
         clients := c
         list := Void
      end

   make (c: like clients; l: like list)
      require
         c /= Void
      do
         clients := c
         list := l
      ensure
         clients = c
         list = l
      end

feature {ANY}
   for_all: BOOLEAN
         -- True when "all" primitives affected
      do
         Result := list = Void
      end

   affect (fn: FEATURE_NAME): BOOLEAN
      do
         if for_all then
            Result := True
         else
            Result := list.has(fn)
         end
      end

   pretty (rank: INTEGER)
      do
         if rank > 1 then
            pretty_printer.set_indent_level(3)
         end
         clients.pretty(3)
         pretty_printer.put_character(' ')
         if for_all then
            pretty_printer.keyword(once "all")
         else
            list.pretty(4)
         end
      end

invariant
   clients /= Void

end -- class EXPORT_ITEM
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
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
