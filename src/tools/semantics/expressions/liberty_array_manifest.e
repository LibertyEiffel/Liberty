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

create {LIBERTY_TYPE_BUILDER}
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

	is_result_type_set: BOOLEAN is True

feature {LIBERTY_TYPE_BUILDER}
	add_parameter (a_parameter: LIBERTY_EXPRESSION) is
		do
			parameters_list.add_last(a_parameter)
		end

	add_content (a_content: LIBERTY_EXPRESSION) is
		do
			contents_list.add_last(a_content)
		end

feature {}
	make (a_type: like result_type) is
		require
			a_type /= Void
		do
			result_type := a_type
			create {FAST_ARRAY[LIBERTY_EXPRESSION]} parameters_list.make(0)
			create {FAST_ARRAY[LIBERTY_EXPRESSION]} contents_list.make(0)
		ensure
			result_type = a_type
		end

	make_array (a_type: like result_type; a_contents: like contents_list) is
		require
			a_type /= Void
			a_contents /= Void
			-- all a_contents items conform to a_type
		do
			result_type := a_type
			create {FAST_ARRAY[LIBERTY_EXPRESSION]} parameters_list.make(0)
			contents_list := a_contents
		ensure
			result_type = a_type
			contents = a_contents
		end

	parameters_list: COLLECTION[LIBERTY_EXPRESSION]
	contents_list: COLLECTION[LIBERTY_EXPRESSION]

invariant
	result_type /= Void
	parameters_list /= Void

feature {ANY}
	accept (v: VISITOR) is
		local
			v0: LIBERTY_ARRAY_MANIFEST_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_array_manifest(Current)
		end

end
