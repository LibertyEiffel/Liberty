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
expanded class LIBERTY_FLAME
--
-- LIBERTY_ENLIGHTENING_THE_WORLD state save ("Memo" design pattern)
--

feature {LIBERTY_ENLIGHTENING_THE_WORLD}
	light: INTEGER

	set (candela: like light) is
		do
			light := candela
		ensure
			light = candela
		end

end -- class LIBERTY_FLAME
