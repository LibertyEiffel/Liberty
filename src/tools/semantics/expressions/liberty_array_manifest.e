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
class LIBERTY_ARRAY_MANIFEST

inherit
	LIBERTY_EXPRESSION

create {LIBERTY_TYPE_BUILDER_TOOLS}
	make, make_array

feature {ANY}
	parameters: TRAVERSABLE[LIBERTY_EXPRESSION] is
		do
			Result := parameters_list
		end

	contents: TRAVERSABLE[LIBERTY_EXPRESSION] is
		do
			Result := contents_list
		end

	result_type: LIBERTY_TYPE

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
	mark_reachable_code (mark: INTEGER) is
		do
			expressions_marker.mark_reachable_code(mark, parameters_list)
			expressions_marker.mark_reachable_code(mark, contents_list)
		end

feature {LIBERTY_TYPE_BUILDER_TOOLS}
	add_parameter (a_parameter: LIBERTY_EXPRESSION) is
		do
			parameters_list.add_last(a_parameter)
		end

	add_content (a_content: LIBERTY_EXPRESSION) is
		do
			contents_list.add_last(a_content)
		end

feature {}
	make (a_type: like result_type; a_position: like position) is
		require
			a_type /= Void
			a_position /= Void
		do
			result_type := a_type
			create {FAST_ARRAY[LIBERTY_EXPRESSION]} parameters_list.make(0)
			create {FAST_ARRAY[LIBERTY_EXPRESSION]} contents_list.make(0)
			position := a_position
		ensure
			result_type = a_type
			position = a_position
		end

	make_array (a_type: like result_type; a_contents: like contents_list; a_position: like position) is
		require
			a_type /= Void
			a_contents /= Void
			-- all a_contents items conform to a_type
			a_position /= Void
		do
			result_type := a_type
			create {FAST_ARRAY[LIBERTY_EXPRESSION]} parameters_list.make(0)
			contents_list := a_contents
			position := a_position
		ensure
			result_type = a_type
			contents = a_contents
			position = a_position
		end

	parameters_list: COLLECTION[LIBERTY_EXPRESSION]
	contents_list: COLLECTION[LIBERTY_EXPRESSION]

feature {ANY}
	accept (v: VISITOR) is
		local
			v0: LIBERTY_ARRAY_MANIFEST_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_array_manifest(Current)
		end

invariant
	result_type /= Void
	parameters_list /= Void
	contents_list /= Void

end
