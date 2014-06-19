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
class LIBERTY_AST_ASSIGNMENT_OR_CALL

inherit
   LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
   make

feature {LIBERTY_AST_HANDLER}
   writable: LIBERTY_AST_WRITABLE
      require
         is_assignment
      do
         Result ::= nodes.item(0)
      end

   expression: LIBERTY_AST_EXPRESSION
      require
         is_assignment
      do
         Result ::= nodes.item(2)
      end

   target: LIBERTY_AST_TARGET
      require
         is_call
      do
         Result ::= nodes.item(0)
      end

   r10: LIBERTY_AST_R10
      require
         is_call
      do
         Result ::= nodes.item(1)
      end

   is_regular_assignment: BOOLEAN
      require
         is_assignment
      do
         Result := nodes.item(1).name.is_equal(once "KW :=")
      ensure
         Result implies not is_assignment_attempt and then not is_forced_assignment
      end

   is_assignment_attempt: BOOLEAN
      require
         is_assignment
      do
         Result := nodes.item(1).name.is_equal(once "KW ?=")
      ensure
         Result implies not is_regular_assignment and then not is_forced_assignment
      end

   is_forced_assignment: BOOLEAN
      require
         is_assignment
      do
         Result := nodes.item(1).name.is_equal(once "KW ::=")
      ensure
         Result implies not is_assignment_attempt and then not is_regular_assignment
      end

   is_assignment: BOOLEAN
      do
         Result := count = 3
      ensure
         Result = not is_call
      end

   is_call: BOOLEAN
      do
         Result := count = 2
      ensure
         Result = not is_assignment
      end

feature {ANY}
   count: INTEGER
      do
         Result := nodes.count
      end

   name: STRING "Assignment_Or_Call"

feature {}
   possible_counts: SET[INTEGER]
      once
         Result := {AVL_SET[INTEGER] << 2, 3 >> }
      end

end
