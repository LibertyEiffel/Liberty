-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
class LIBERTY_AST_TYPE_DEFINITION

inherit
   LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
   make

feature {LIBERTY_AST_HANDLER}
   is_class_type: BOOLEAN
      do
         Result := nodes.last.name.is_equal(once "Effective_Type_Parameters")
      end

   is_separate: BOOLEAN
      do
         Result := nodes.first.name.is_equal(once "KW separate")
      end

   type_name: LIBERTY_AST_CLASS_NAME
      require
         is_class_type
      do
         if is_separate then
            Result ::= nodes.item(1)
         else
            Result ::= nodes.item(0)
         end
      end

   type_parameters: LIBERTY_AST_EFFECTIVE_TYPE_PARAMETERS
      require
         is_class_type
      do
         Result ::= nodes.last
      end

   is_anchor: BOOLEAN
      do
         Result := nodes.first.name.is_equal(once "KW like")
      end

   is_like_result: BOOLEAN
      do
         Result := is_anchor and then nodes.item(1).name.is_equal(once "KW Result")
      ensure
         Result implies is_anchor
      end

   is_like_current: BOOLEAN
      do
         Result := is_anchor and then nodes.item(1).name.is_equal(once "KW Current")
      ensure
         Result implies is_anchor
      end

   is_like_entity: BOOLEAN
      do
         Result := is_anchor and then nodes.item(1).name.is_equal(once "KW entity name")
      ensure
         Result implies is_anchor
      end

   entity_anchor: LIBERTY_AST_ENTITY_NAME
      require
         is_like_entity
      do
         Result ::= nodes.item(1)
      end

   anchor_remainder: LIBERTY_AST_R10
      require
         is_anchor
      do
         Result ::= nodes.item(2)
      end

   anchor_index: INTEGER
      require
         is_anchor
      local
         anchor: EIFFEL_TERMINAL_NODE
      do
         anchor ::= nodes.first
         Result := anchor.image.index
      end

feature {ANY}
   count: INTEGER
      do
         Result := nodes.count
      end

   name: STRING "Type_Definition"

feature {}
   possible_counts: SET[INTEGER]
      once
         Result := {AVL_SET[INTEGER] << 2, 3 >> }
      end

end
