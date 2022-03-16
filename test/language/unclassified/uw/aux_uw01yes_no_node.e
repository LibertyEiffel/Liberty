note
   description:
      "nodes with two actions, yes and no, and link to parent node"
   status:
      "See notice at end of class"
   author:
      "Ulrich Windl <Ulrich.Windl@rz.uni-regensburg.de>"
   version:
      "$Revision$"
   last_modification:
      "$Date$"
deferred class AUX_UW01YES_NO_NODE

inherit
   AUX_UW01ACTION_NODE
      redefine out
      end

feature {ANY}
   yes: AUX_UW01YES_NO_NODE -- yes action

   no: AUX_UW01YES_NO_NODE -- no action

   parent: AUX_UW01YES_NO_NODE -- parent

   description: STRING -- description

   last_answer: BOOLEAN -- last answer

feature {ANY} -- operations
   make_simple (desc: STRING)
         -- set minimum features of node
      require
         valid_desc: desc /= Void and then desc.count > 0
      do
         description := desc
         create {AUX_UW01PREFERRED_LANGUAGE} language
      end

   make_full (y, n, p: AUX_UW01YES_NO_NODE; desc: STRING)
         -- initialize node with name `nam', yes link `y',
         -- no link `n', and parent `p'
      require
         valid_desc: desc /= Void and then desc.count > 0
      do
         yes := y
         no := n
         parent := p
         description := desc
         create {AUX_UW01PREFERRED_LANGUAGE} language
      end

   set_yes_node (new_node: AUX_UW01YES_NO_NODE)
         -- change `yes' to `new_node'
      do
         yes := new_node
      end

   set_no_node (new_node: AUX_UW01YES_NO_NODE)
         -- change `no' to `new_node'
      do
         no := new_node
      end

   set_parent_node (new_node: AUX_UW01YES_NO_NODE)
         -- change `parent' to `new_node'
      do
         parent := new_node
      end

   yes_action
         -- perform "yes" action
      require
         valid_choice: yes /= Void
      do
         yes.execute
      end

   no_action
         -- perform "no" action
      require
         valid_choice: no /= Void
      do
         no.execute
      end

   read_answer
         -- Ask yes/no question and set `last_answer'
      deferred
      end

   decision: AUX_UW01YES_NO_NODE
         -- decide which action to take
      do
         if last_answer then
            Result := yes
            if yes /= Void then
               yes_action
            end
         else
            Result := no
            if no /= Void then
               no_action
            end
         end
      end

feature {ANY} -- I/O
   out: STRING
         -- printable representation
      do
         Result := description.out
      end

invariant
   valid_description: description /= Void and then description.count > 0
      --consistent_yes: yes /= Void implies yes.parent = Current;
      --consistent_no: no /= Void implies no.parent = Current

end -- class AUX_UW01YES_NO_NODE
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
