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
class LIBERTY_INTERPRETER_DEBUGGER_NON_TERMINAL_NODE

inherit
   EIFFEL_NON_TERMINAL_NODE_IMPL
      rename
         make as make_impl
      redefine
         accept
      end

create {LIBERTY_INTERPRETER_DEBUGGER_FACTORY}
   make

feature {ANY}
   accept (visitor: VISITOR) is
      local
         v: LIBERTY_INTERPRETER_DEBUGGER_VISITOR
      do
         v ::= visitor
         action.call([v, Current])
      end

feature {}
   make (a_action: like action; a_name: like name; a_names: like names) is
      require
         a_action /= Void
      do
         make_impl(a_name, a_names)
         action := a_action
      ensure
         name = a_name
         names = a_names
         action = a_action
      end

   action: PROCEDURE[TUPLE[LIBERTY_INTERPRETER_DEBUGGER_VISITOR, LIBERTY_INTERPRETER_DEBUGGER_NON_TERMINAL_NODE]]

invariant
   action /= Void

end -- class LIBERTY_INTERPRETER_DEBUGGER_NON_TERMINAL_NODE
