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
class LIBERTY_AST_OLD_CREATION

inherit
   LIBERTY_AST_CREATION
      redefine
         has_type_definition, has_creation_feature_call,
         writable, type_definition, creation_feature_name, creation_feature_actuals,
         possible_counts, name
      end

create {LIBERTY_NODE_FACTORY}
   make

feature {LIBERTY_AST_HANDLER}
   has_type_definition: BOOLEAN is
      do
         Result := count = 4 or else count = 7
      end

   has_creation_feature_call: BOOLEAN is
      do
         Result := count = 6 or else count = 7
      end

   writable: LIBERTY_AST_WRITABLE is
      do
         if has_type_definition then
            Result ::= nodes.item(3)
         else
            Result ::= nodes.item(2)
         end
      end

   type_definition: LIBERTY_AST_TYPE_DEFINITION is
      do
         Result ::= nodes.item(1)
      end

   creation_feature_name: LIBERTY_AST_ENTITY_NAME is
      do
         if has_type_definition then
            Result ::= nodes.item(5)
         else
            Result ::= nodes.item(4)
         end
      end

   creation_feature_actuals: LIBERTY_AST_ACTUALS is
      do
         if has_type_definition then
            Result ::= nodes.item(6)
         else
            Result ::= nodes.item(5)
         end
      end

feature {ANY}
   name: STRING is "Old_Creation"

feature {}
   possible_counts: SET[INTEGER] is
      once
         Result := {AVL_SET[INTEGER] << 3, 4, 6, 7 >> }
      end

end
