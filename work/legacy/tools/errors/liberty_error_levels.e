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
expanded class LIBERTY_ERROR_LEVELS

feature {ANY} -- Error levels
   level_system_error: INTEGER_8 is -2
   level_fatal_error: INTEGER_8 is -1
   level_error: INTEGER_8 is 0
   level_warning: INTEGER_8 is 1
   level_info: INTEGER_8 is 2
   level_verbose: INTEGER_8 is 3
   level_debug: INTEGER_8 is 4

   valid_level (a_level: INTEGER_8): BOOLEAN is
      do
         Result := a_level.in_range(level_system_error, level_debug)
      end

   level_tag (a_level: INTEGER_8): STRING is
      require
         valid_level(a_level)
      do
         inspect
            a_level
         when level_system_error then
            Result := once "System error"
         when level_fatal_error then
            Result := once "Fatal error"
         when level_error then
            Result := once "Error"
         when level_warning then
            Result := once "Warning"
         when level_info then
            Result := once "Info"
         when level_verbose then
            Result := once "More info"
         when level_debug then
            Result := once "Debug"
         end
      end

end
