-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TAG_NAME

inherit
   VISITABLE
insert
   GLOBALS

create {ANY}
   make

feature {ANY}
   hashed_name: HASHED_STRING
         -- The corresponding unique one.

   to_string: STRING
         -- An alias for `hashed_name.to_string'.
      do
         Result := hashed_name.to_string
      end

   start_position: POSITION

   to_key: STRING
      do
         Result := to_string
      end

   short
      local
         i: INTEGER; c: CHARACTER
      do
         short_printer.hook("Btag")
         from
            i := 1
         until
            i > to_string.count
         loop
            c := to_string.item(i)
            if c = '_' then
               short_printer.hook_or("Utag", "_")
            else
               short_printer.put_character(c)
            end
            i := i + 1
         end
         short_printer.hook("Atag")
      end

feature {ANY}
   accept (visitor: TAG_NAME_VISITOR)
      do
         visitor.visit_tag_name(Current)
      end

feature {}
   make (hn: like hashed_name; sp: like start_position)
      require
         hn /= Void
      do
         hashed_name := hn
         start_position := sp
      ensure
         hashed_name = hn
         start_position = sp
      end

end -- class TAG_NAME
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
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
