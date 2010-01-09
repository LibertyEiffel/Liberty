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
expanded class LIBERTY_HEART_BEAT
--
-- Allows that the compiler is still progressing. Useful to avoid staying stuck in an infinite loop.
--

feature {ANY}
	beat is
		do
			magic.set_item(magic.item + 1)
		end

	pressure: LIBERTY_HEART_BEAT_PRESSURE is
		do
			Result.set(magic.item)
		end

	is_alive (a_memo: like memo): BOOLEAN is
		do
			Result := magic.item > a_memo.item
		end

feature {}
	magic: REFERENCE[INTEGER] is
		once
			create Result
		end

end -- class LIBERTY_HEART_BEAT
