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

insert
	LIBERTY_ARRAY_MANIFEST_CONSTANTS

create {LIBERTY_BUILDER_TOOLS}
	make, make_array

create {LIBERTY_ARRAY_MANIFEST}
	specialized

feature {ANY}
	parameters: TRAVERSABLE[LIBERTY_EXPRESSION] is
		do
			Result := parameters_list
		ensure
			Result = parameters_list
		end

	contents: TRAVERSABLE[LIBERTY_EXPRESSION] is
		do
			Result := contents_list
		ensure
			Result = contents_list
		end

	separators: TRAVERSABLE[LIBERTY_ARRAY_MANIFEST_SEPARATOR] is
		do
			Result := separators_list
		ensure
			Result = separators_list
		end

	result_type: LIBERTY_TYPE

	specialized_in (a_type: LIBERTY_ACTUAL_TYPE): like Current is
		local
			r: like result_type
			p: like parameters_list
			c: like contents_list
		do
			r := result_type.specialized_in(a_type)
			p := specialized_expressions(parameters_list, a_type)
			c := specialized_expressions(contents_list, a_type)
			if r = result_type and then p = parameters and then c = contents then
				Result := Current
			else
				create Result.specialized(r, p, c, separators_list, position)
			end
		end

feature {}
	specialized_expressions (a_expressions: COLLECTION[LIBERTY_EXPRESSION]; a_type: LIBERTY_ACTUAL_TYPE): COLLECTION[LIBERTY_EXPRESSION] is
		local
			e: LIBERTY_EXPRESSION
			i: INTEGER
		do
			from
				Result := a_expressions
				i := Result.lower
			until
				i > Result.upper
			loop
				e := Result.item(i).specialized_in(a_type)
				if e /= Result.item(i) then
					if Result = a_expressions then
						Result := Result.twin
					end
					Result.put(e, i)
				end
				i := i + 1
			end
		end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
	mark_reachable_code (mark: INTEGER) is
		do
			expressions_marker.mark_reachable_code(mark, parameters_list)
			expressions_marker.mark_reachable_code(mark, contents_list)
		end

feature {LIBERTY_BUILDER_TOOLS}
	add_parameter (a_parameter: LIBERTY_EXPRESSION) is
		do
			parameters_list.add_last(a_parameter)
		end

	add_content (a_content: LIBERTY_EXPRESSION; a_separator: LIBERTY_ARRAY_MANIFEST_SEPARATOR) is
		do
			contents_list.add_last(a_content)
			separators_list.add_last(a_separator)
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
			create {FAST_ARRAY[LIBERTY_ARRAY_MANIFEST_SEPARATOR]} separators_list.make(0)
			position := a_position
		ensure
			result_type = a_type
			position = a_position
		end

	make_array (a_type: like result_type; a_contents: like contents_list; a_separators: like separators_list; a_position: like position) is
		require
			a_type /= Void
			a_contents /= Void
			-- all a_contents items conform to a_type
			a_separators /= Void
			a_position /= Void
		do
			result_type := a_type
			create {FAST_ARRAY[LIBERTY_EXPRESSION]} parameters_list.make(0)
			contents_list := a_contents
			separators_list := a_separators
			position := a_position
		ensure
			result_type = a_type
			contents = a_contents
			separators = a_separators
			position = a_position
		end

	specialized (a_type: like result_type; a_parameters: like parameters_list; a_contents: like contents_list; a_separators: like separators_list; a_position: like position) is
		require
			a_type /= Void
			a_position /= Void
			a_contents /= Void
			-- all a_contents items conform to a_type
			a_separators /= Void
			a_position /= Void
		do
			result_type := a_type
			parameters_list := a_parameters
			contents_list := a_contents
			separators_list := a_separators
			position := a_position
		ensure
			result_type = a_type
			parameters_list = a_parameters
			contents = a_contents
			separators = a_separators
			position = a_position
		end

	parameters_list: COLLECTION[LIBERTY_EXPRESSION]
	contents_list: COLLECTION[LIBERTY_EXPRESSION]
	separators_list: COLLECTION[LIBERTY_ARRAY_MANIFEST_SEPARATOR]

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
	separators_list /= Void
	contents_list.count = separators_list.count
	contents_list.lower = separators_list.lower

end
