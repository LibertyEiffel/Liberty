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
class LIBERTY_INTERPRETER_DEBUGGER_FACTORY

inherit
   EIFFEL_NODE_FACTORY

create {LIBERTY_INTERPRETER_DEBUGGER}
   make

feature {EIFFEL_GRAMMAR}
   list (name: FIXED_STRING): EIFFEL_LIST_NODE is
      do
         check False end
      end

   non_terminal (name: FIXED_STRING; names: TRAVERSABLE[FIXED_STRING]): EIFFEL_NON_TERMINAL_NODE is
      local
         action: PROCEDURE[TUPLE[LIBERTY_INTERPRETER_DEBUGGER_VISITOR, LIBERTY_INTERPRETER_DEBUGGER_NON_TERMINAL_NODE]]
      do
         inspect
            name
         when "Entry" then
            action := action_entry
         when "Show" then
            action := action_show
         when "Step" then
            action := action_step
         when "Up" then
            action := action_up
         when "Down" then
            action := action_down
         end
         create {LIBERTY_INTERPRETER_DEBUGGER_NON_TERMINAL_NODE} Result.make(action, name, names)
      end

   terminal (name: FIXED_STRING; image: EIFFEL_IMAGE): EIFFEL_TERMINAL_NODE is
      do
         create {EIFFEL_TERMINAL_NODE_IMPL} Result.make(name, image)
      end

feature {}
   action_entry: PROCEDURE[TUPLE[LIBERTY_INTERPRETER_DEBUGGER_VISITOR, LIBERTY_INTERPRETER_DEBUGGER_NON_TERMINAL_NODE]] is
      once
         Result := agent {LIBERTY_INTERPRETER_DEBUGGER_VISITOR}.visit_entry
      end

   action_show: PROCEDURE[TUPLE[LIBERTY_INTERPRETER_DEBUGGER_VISITOR, LIBERTY_INTERPRETER_DEBUGGER_NON_TERMINAL_NODE]] is
      once
         Result := agent {LIBERTY_INTERPRETER_DEBUGGER_VISITOR}.visit_show
      end

   action_step: PROCEDURE[TUPLE[LIBERTY_INTERPRETER_DEBUGGER_VISITOR, LIBERTY_INTERPRETER_DEBUGGER_NON_TERMINAL_NODE]] is
      once
         Result := agent {LIBERTY_INTERPRETER_DEBUGGER_VISITOR}.visit_step
      end

   action_up: PROCEDURE[TUPLE[LIBERTY_INTERPRETER_DEBUGGER_VISITOR, LIBERTY_INTERPRETER_DEBUGGER_NON_TERMINAL_NODE]] is
      once
         Result := agent {LIBERTY_INTERPRETER_DEBUGGER_VISITOR}.visit_up
      end

   action_down: PROCEDURE[TUPLE[LIBERTY_INTERPRETER_DEBUGGER_VISITOR, LIBERTY_INTERPRETER_DEBUGGER_NON_TERMINAL_NODE]] is
      once
         Result := agent {LIBERTY_INTERPRETER_DEBUGGER_VISITOR}.visit_down
      end

feature {}
   make is
      do
      end

end -- class LIBERTY_INTERPRETER_DEBUGGER_FACTORY
