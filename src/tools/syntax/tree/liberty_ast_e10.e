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
class LIBERTY_AST_E10

inherit
   LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
   make

feature {LIBERTY_AST_HANDLER}
   is_call: BOOLEAN is
      do
         Result := count = 1 and then nodes.first.name.is_equal(once "Call")
      end

   call: LIBERTY_AST_CALL is
      require
         is_call
      do
         Result ::= nodes.item(0)
      end

   is_tuple: BOOLEAN is
      do
         Result := nodes.first.name.is_equal(once "KW [")
         check
            Result = nodes.last.name.is_equal(once "KW ]")
         end
      end

   tuple_actuals: EIFFEL_LIST_NODE is
         -- Void if empty tuple
      require
         is_tuple
      do
         if count = 3 then
            Result ::= nodes.item(1)
         end
      end

   is_open_argument: BOOLEAN is
      do
         Result := count = 1 and then nodes.first.name.is_equal(once "KW ?")
      end

   is_inline_agent: BOOLEAN is
      do
         Result := count = 4
         check
            Result = nodes.item(0).name.is_equal(once "Agent_Signature")
         end
      end

   inline_agent_signature: LIBERTY_AST_AGENT_SIGNATURE is
      require
         is_inline_agent
      do
         Result ::= nodes.item(0)
      end

   inline_agent_definition: LIBERTY_AST_ROUTINE_DEFINITION is
      require
         is_inline_agent
      do
         Result ::= nodes.item(2)
      end

   inline_agent_actuals: LIBERTY_AST_ACTUALS is
      require
         is_inline_agent
      do
         Result ::= nodes.item(3)
      end

   is_agent_creation: BOOLEAN is
      do
         Result := count = 2 and then nodes.item(0).name.is_equal(once "KW agent")
      end

   agent_creation_expression: LIBERTY_AST_EXPRESSION is
      require
         is_agent_creation
      do
         Result ::= nodes.item(1)
      end

   is_creation_expression: BOOLEAN is
      do
         Result := count = 1 and then nodes.item(0).name.is_equal(once "Creation_Expression")
      end

   creation_expression: LIBERTY_AST_CREATION_EXPRESSION is
      require
         is_creation_expression
      do
         Result ::= nodes.item(0)
      end

   is_void: BOOLEAN is
      do
         Result := count = 1 and then nodes.item(0).name.is_equal(once "KW Void")
      end

feature {ANY}
   count: INTEGER is
      do
         Result := nodes.count
      end

   name: STRING is "e10"

feature {}
   possible_counts: SET[INTEGER] is
      once
         Result := {AVL_SET[INTEGER] << 1, 2, 3, 4 >> }
      end

end
