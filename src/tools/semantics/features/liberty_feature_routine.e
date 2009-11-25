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
	block_instruction: LIBERTY_INSTRUCTION

	rescue_instruction: LIBERTY_INSTRUCTION

feature {LIBERTY_TYPE_BUILDER}
	set_rescue (a_rescue: like rescue_instruction) is
		require
			rescue_instruction = Void
			a_rescue /= Void
		do
			rescue_instruction := a_rescue
		ensure
			rescue_instruction = a_rescue
		end

feature {}
	make (a_instruction: like block_instruction) is
		require
			a_instruction /= Void
		do
			make_late_binding
			block_instruction := a_instruction
		ensure
			block_instruction = a_instruction
		end

invariant
	block_instruction /= Void

end
