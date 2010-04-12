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
class LIBERTY_ASSERTION

insert
	LIBERTY_REACHABLE

create {LIBERTY_TYPE_BUILDER_TOOLS, LIBERTY_ASSERTION}
	make

feature {ANY}
	tag: FIXED_STRING
	assertion: LIBERTY_EXPRESSION

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
	mark_reachable_code (mark: INTEGER) is
		do
			assertion.mark_reachable_code(mark)
		end

feature {LIBERTY_ASSERTIONS}
	specialized_in (a_type: LIBERTY_ACTUAL_TYPE_IMPL): like Current is
		require
			a_type /= Void
		local
			a: like assertion
		do
			a := assertion.specialized_in(a_type)
			if a = assertion then
				Result := Current
			else
				create Result.make(tag, a)
			end
		end

feature {}
	make (a_tag: like tag; a_assertion: like assertion) is
		do
			tag := a_tag
			assertion := a_assertion
		ensure
			tag = a_tag
			assertion = a_assertion
		end

end
