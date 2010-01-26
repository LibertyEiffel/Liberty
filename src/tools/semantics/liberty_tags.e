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
expanded class LIBERTY_TAGS

feature {ANY} -- Tags on expressions
	is_void: LIBERTY_TAG_REF[TRISTATE] is
			-- This tag checks if the expression is always Void.
		once
			create Result.make("is void".intern)
		end

	has_side_effect: LIBERTY_TAG_REF[TRISTATE] is
			-- This tag checks if the expression has side effects (useful to drop targets when optimizing).
		once
			create Result.make("has side effect".intern)
		end

	runtime_set: LIBERTY_TAG_REF[COLLECTION[LIBERTY_ACTUAL_TYPE]] is
			-- This tag contains the complete set of actual types an expression may have at runtime.
		once
			create Result.make("runtime set".intern)
		end

end
