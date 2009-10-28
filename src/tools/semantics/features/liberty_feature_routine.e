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
deferred class LIBERTY_FEATURE_ROUTINE

inherit
	LIBERTY_FEATURE
		rename
			make as make_late_binding
		end

feature {ANY}
	block_instructions: TRAVERSABLE[LIBERTY_INSTRUCTION]

	rescue_instructions: TRAVERSABLE[LIBERTY_INSTRUCTION]

feature {LIBERTY_TYPE_BUILDER}
	set_rescue (a_rescue: like rescue_instructions) is
		require
			rescue_instructions = Void
			a_rescue /= Void
		do
			rescue_instructions := a_rescue
		ensure
			rescue_instructions = a_rescue
		end

feature {}
	make (a_instructions: like block_instructions) is
		require
			a_instructions /= Void
		do
			make_late_binding
			block_instructions := a_instructions
		ensure
			block_instructions = a_instructions
		end

invariant
	block_instructions /= Void

end
