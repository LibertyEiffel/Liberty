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
expanded class LIBERTY_MAIN_LOG_LEVEL

feature {ANY}
   is_error: BOOLEAN
      do
         Result := value = log_error
      end

   is_warning: BOOLEAN
      do
         Result := value = log_warning
      end

   is_info: BOOLEAN
      do
         Result := value = log_info
      end

   is_trace: BOOLEAN
      do
         Result := value = log_trace
      end

feature {LIBERTY_MAIN}
   valid_arg (arg: STRING): BOOLEAN
      do
         inspect
            arg
         when "error", "warning", "info", "trace" then
            Result := True
         else
         end
      end

   set (arg: STRING): LIBERTY_MAIN_LOG_LEVEL
      do
         inspect
            arg
         when "error" then
            value := log_error
         when "warning" then
            value := log_warning
         when "info" then
            value := log_info
         when "trace" then
            value := log_trace
         else
            check False end
         end
         Result := Current
      end

feature {}
   value: INTEGER_8

   log_error: INTEGER_8 -2
   log_warning: INTEGER_8 -1
   log_info: INTEGER_8 0
   log_trace: INTEGER_8 1

invariant
   value.in_range(log_error, log_trace)

end -- class LIBERTY_MAIN_LOG_LEVEL
