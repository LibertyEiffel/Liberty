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
class LIBERTY_TYPE_MANIFEST_ARRAY_FEATURES_LISTENER

inherit
   LIBERTY_TYPE_LISTENER

create {ANY}
   make

feature {LIBERTY_TYPE}
   on_type_known (type: LIBERTY_TYPE)
      do
         -- nothing
      end

   on_type_built (type: LIBERTY_ACTUAL_TYPE)
      do
         type.mark_manifest_array_features(mark)
      end

feature {}
   make (a_mark: like mark)
      do
         mark := a_mark
      end

   mark: INTEGER

end -- LIBERTY_TYPE_MANIFEST_ARRAY_FEATURES_LISTENER
