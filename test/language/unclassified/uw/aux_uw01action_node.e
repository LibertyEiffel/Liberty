indexing
   description: "nodes representing an action";
   status: "See notice at end of class";
   author: "Ulrich Windl <Ulrich.Windl@rz.uni-regensburg.de>";
   version: "$Revision$";
   last_modification: "$Date$";
deferred class AUX_UW01ACTION_NODE

feature
   
   extra_io : AUX_UW01EXTRA_IO is   
         -- shared EXTRA_IO object
      once
         !!Result.make
      end; -- extra_io
   
   execute is
         -- perform action
      deferred
      end; -- execute
   
   language : AUX_UW01LANGUAGE;
         -- language to use
   
invariant
   good_language: language /= Void
   
end -- AUX_UW01ACTION_NODE
-- Copyright (c) 1998 by Ulrich Windl
-- Copyright (c) 1998 by Klinikum der Universität Regensburg,
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
