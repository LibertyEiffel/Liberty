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
deferred class LIBERTY_ANCHORED_TYPE

creation {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	anchor: LIBERTY_ENTITY

	type: LIBERTY_TYPE is
		do
			Result := anchor.result_type.type
		ensure
			Result = anchor.result_type.type
		end

	is_type_set: BOOLEAN is
		do
			Result := anchor.is_result_type_set
		end

feature {}
	make (a_anchor: like anchor) is
		do
			anchor := a_anchor
		ensure
			anchor = a_anchor
		end

invariant
	anchor /= Void

end
