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
class LIBERTYI
   --
   -- The interpreter.
   --

insert
   LIBERTY_MAIN

create {}
   make

feature {}
   run (root: LIBERTY_ACTUAL_TYPE; root_feature_name: LIBERTY_FEATURE_NAME) is
      local
         interpreter: LIBERTY_INTERPRETER
         options: LIBERTY_INTERPRETER_OPTIONS
      do
         log.info.put_line(once "Starting the liberty interpreter.")
         options.set(opt_check_level.item, opt_debug.item)
         create interpreter.make(universe, root, root_feature_name)
         interpreter.run
         log.info.put_line(once "Exiting the liberty interpreter.")
      end

   default_log_location: STRING is "${path_liberty}/resources/log/libertyi-log.rc"

end -- class LIBERTYI
