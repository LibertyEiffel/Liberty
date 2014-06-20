-- This file is part of Liberty The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of th file.
--
class MOCKER_DEFERRED_LOOKUP

inherit
   EIFFEL_NODE_VISITOR
      redefine
         visit_eiffel_non_terminal_node_impl
      end

insert
   LOGGING
   EIFFEL_NODE_HANDLER

create {ANY}
   make

feature {ANY}
   is_deferred (node: EIFFEL_NON_TERMINAL_NODE_IMPL): BOOLEAN
      require
         has_deferred_features
         node /= Void
      do
         Result := deferred_features_list.fast_has(node)
      end

   has_deferred_features: BOOLEAN
      do
         Result := deferred_features_list /= Void
      end

feature {EIFFEL_TERMINAL_NODE_IMPL}
   visit_eiffel_terminal_node_impl (node: EIFFEL_TERMINAL_NODE_IMPL)
      do
         inspect
            node.name
         when "KW deferred" then
            if deferred_features_list = Void then
               create deferred_features_list.make(0)
            end
            deferred_features_list.add_last(last_feature)
         else
         end
      end

feature {EIFFEL_NON_TERMINAL_NODE_IMPL}
   visit_eiffel_non_terminal_node_impl (node: EIFFEL_NON_TERMINAL_NODE_IMPL)
      do
         inspect
            node.name
         when "Feature_Definition" then
            last_feature := node
            Precursor(node)
         else
            Precursor(node)
         end
      end

feature {}
   make (a_node: EIFFEL_NON_TERMINAL_NODE_IMPL)
      require
         a_node.name.same_as(once "Feature")
      do
         a_node.accept(Current)
      end

   last_feature: EIFFEL_NON_TERMINAL_NODE_IMPL
   deferred_features_list: FAST_ARRAY[EIFFEL_NON_TERMINAL_NODE_IMPL]

end -- class MOCKER_DEFERRED_LOOKUP
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as publhed by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 2013-2014: Cyril ADRIAN
--
-- http://www.gnu.org/software/liberty-eiffel/
--
-- ------------------------------------------------------------------------------------------------------------------------------
