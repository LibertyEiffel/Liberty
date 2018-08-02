note
   description:
      "nodes representing animals"
   status:
      "See notice at end of class"
   author:
      "Ulrich Windl <Ulrich.Windl@rz.uni-regensburg.de>"
   version:
      "$Revision$"
   last_modification:
      "$Date$"
class AUX_UW01ANIMAL_NODE

inherit
   AUX_UW01YES_NO_NODE
      rename make_full as make_full_yes_no,
         make_simple as make_simple_yes_no,
         description as name
      redefine yes_action, no_action
      end

create {ANY}
   make_simple, make_full

feature {ANY}
   make_simple (nam: STRING)
         -- set up node with name `nam'
      require
         good_name: nam /= Void and then nam.count > 0
      do
         make_simple_yes_no(nam)
      end

   make_full (y, n, p: AUX_UW01YES_NO_NODE; nam: STRING)
         -- set up node with name `nam', yes link `y',
         -- no link `n', and parent `p'
      require
         good_name: nam /= Void and then nam.count > 0
      do
         make_full_yes_no(y, n, p, nam)
      end

   execute
         -- perform action
      do
         extra_io.print_multi({ARRAY[STRING] 1, << language.s4, name, language.s5 >> })
      end

   yes_action
         -- the animal has been guessed correctly
      do
         io.put_string(language.s2)
      end

   no_action
         -- the animal is unknown
      do
         io.put_string(language.s3)
      end

   read_answer
         -- ask question about animal
      do
         extra_io.read_yes_no(language.s6)
         last_answer := extra_io.last_boolean
      end

end -- class AUX_UW01ANIMAL_NODE
-- Copyright (C) 1998-2018: by Ulrich Windl
-- Copyright (C) 1998-2018: by Klinikum der Universität Regensburg,
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
