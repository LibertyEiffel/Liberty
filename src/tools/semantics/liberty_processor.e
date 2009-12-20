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
expanded class LIBERTY_PROCESSOR
--
-- Non-total order. Two "new" processors can never be equal.
--

insert
	ANY
		redefine
			is_equal
		end

feature {ANY}
	none: LIBERTY_PROCESSOR is
		once
			Result := with_value(-1, 0)
		end

	any: LIBERTY_PROCESSOR is
		once
			Result := with_value(1, 0)
		end

	new: LIBERTY_PROCESSOR is
		do
			counter.increment
			Result := with_value(0, counter.item)
		end

	currents: LIBERTY_PROCESSOR is
			-- Current's, i.e. non-separate
		once
			Result := with_value(0, 0)
		end

	infix "<" (other: like Current): BOOLEAN is
		do
			if major = other.major then
				Result := major = 0
			else
				Result := major < other.major
			end
		end

	is_equal (other: like Current): BOOLEAN is
		do
			Result := major = other.major and then minor = other.minor
		end

feature {LIBERTY_PROCESSOR}
	with_value (a_major: like major; a_minor: like minor): LIBERTY_PROCESSOR is
		do
			major := a_major
			minor := a_minor
			Result := Current
		ensure
			major = a_major
			minor = a_minor
		end

	major: INTEGER_8
	minor: INTEGER

	counter: COUNTER is
		once
			create Result
		end

end
