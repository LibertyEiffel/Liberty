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
class LIBERTY_TYPE_DESCRIPTOR_DICTIONARY_NODE[E_]

inherit
   HASHED_DICTIONARY_NODE[E_, LIBERTY_TYPE_DESCRIPTOR]

feature {LIBERTY_TYPE_DESCRIPTOR_DICTIONARY}
   set_key (td: LIBERTY_TYPE_DESCRIPTOR) is
      do
         key := td
      end

end
