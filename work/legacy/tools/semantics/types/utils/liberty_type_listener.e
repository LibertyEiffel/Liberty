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
deferred class LIBERTY_TYPE_LISTENER

feature {LIBERTY_TYPE}
   on_type_known (type: LIBERTY_TYPE)
      require
         type /= Void
         type.is_known
      deferred
      end

   on_type_built (type: LIBERTY_ACTUAL_TYPE)
      require
         type /= Void
         type.is_built
      deferred
      end

end
