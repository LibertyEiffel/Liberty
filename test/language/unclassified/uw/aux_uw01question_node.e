note
   description:
      "nodes representing yes/no questions (properties)"
   status:
      "See notice at end of class"
   author:
      "Ulrich Windl <Ulrich.Windl@rz.uni-regensburg.de>"
   version:
      "$Revision$"
   last_modification:
      "$Date$"
class AUX_UW01QUESTION_NODE

inherit
   AUX_UW01YES_NO_NODE
      rename make_simple as make_simple_yes_no,
         make_full as make_full_yes_no,
         description as property
      end

create {ANY}
   make_simple, make_full

feature {ANY}
   make_simple (prop: STRING)
         -- set up node with property `prop'
      require
         good_property: prop /= Void and then prop.count > 0
      do
         make_simple_yes_no(prop)
      end

   make_full (y, n, p: AUX_UW01YES_NO_NODE; prop: STRING)
         -- set up node with property `prop', yes link `y',
         -- no link `n', and parent `p'
      require
         good_property: prop /= Void and then prop.count > 0
      do
         make_full_yes_no(y, n, p, prop)
      end

   execute
         -- perform action
      do
         extra_io.print_multi({ARRAY[STRING] 1, << property, language.s5 >> })
      end

   read_answer
         -- ask question
      do
         extra_io.read_yes_no(language.s6)
         last_answer := extra_io.last_boolean
      end

end -- class AUX_UW01QUESTION_NODE
-- Copyright (C) 1998-2022: by Ulrich Windl
-- Copyright (C) 1998-2022: by Klinikum der Universität Regensburg,
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
