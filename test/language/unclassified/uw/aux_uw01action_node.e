note
   description:
      "nodes representing an action"
   status:
      "See notice at end of class"
   author:
      "Ulrich Windl <Ulrich.Windl@rz.uni-regensburg.de>"
   version:
      "$Revision$"
   last_modification:
      "$Date$"
deferred class AUX_UW01ACTION_NODE

feature {ANY}
   extra_io: AUX_UW01EXTRA_IO
         -- shared EXTRA_IO object
      once
         create Result.make
      end

   execute
         -- perform action
      deferred
      end

   language: AUX_UW01LANGUAGE
      -- language to use

invariant
   good_language: language /= Void

end -- class AUX_UW01ACTION_NODE
-- Copyright (C) 1998-2017: by Ulrich Windl
-- Copyright (C) 1998-2017: by Klinikum der Universität Regensburg,
--      D-93042 Regensburg
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, write to the Free Software
--  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301, USA
