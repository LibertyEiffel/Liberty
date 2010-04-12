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
class LIBERTY_CREATION_INSTRUCTION

inherit
	LIBERTY_INSTRUCTION

create {LIBERTY_TYPE_BUILDER_TOOLS, LIBERTY_CREATION_INSTRUCTION}
	make

feature {ANY}
	writable: LIBERTY_WRITABLE
	feature_entity: LIBERTY_FEATURE_ENTITY

	feature_arguments: TRAVERSABLE[LIBERTY_EXPRESSION] is
		do
			Result := feature_arguments_list
		end

	type: LIBERTY_TYPE is
		do
			if explicit_type = Void then
				Result := writable.result_type
			else
				Result := explicit_type
			end
		end

	is_actual_type_set: BOOLEAN is True

	specialized_in (a_type: LIBERTY_ACTUAL_TYPE_IMPL): like Current is
		local
			w: like writable
			fe: like feature_entity
			fa: like feature_arguments_list
			et: like explicit_type
			e: LIBERTY_EXPRESSION
			i: INTEGER
		do
			w := writable.specialized_in(a_type)
			fe := feature_entity.specialized_in(a_type)
			from
				fa := feature_arguments_list
				i := fa.lower
			until
				i > fa.upper
			loop
				e := fa.item(i).specialized_in(a_type)
				if e /= fa.item(i) then
					if fa = feature_arguments_list then
						fa := fa.twin
					end
					fa.put(e, i)
				end
				i := i + 1
			end
			if explicit_type /= Void then
				et := explicit_type.specialized_in(a_type)
			end
			if w = writable and then fe = feature_entity and then fa = feature_arguments_list and then et = explicit_type then
				Result := Current
			else
				create Result.make(w, et, fe, fa, position)
			end
		end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
	mark_reachable_code (mark: INTEGER) is
		do
			type.mark_reachable_code(mark)
			writable.mark_reachable_code(mark)
			feature_entity.mark_reachable_code(mark)
			expressions_marker.mark_reachable_code(mark, feature_arguments)
		end

feature {}
	make (a_writable: like writable; a_type: like type; a_feature_entity: like feature_entity; a_feature_arguments: like feature_arguments_list; a_position: like position) is
		require
			a_writable /= Void
			a_feature_entity /= Void
			a_feature_arguments /= Void
			a_position /= Void
		do
			writable := a_writable
			explicit_type := a_type
			feature_entity := a_feature_entity
			feature_arguments_list := a_feature_arguments
			position := a_position
		ensure
			writable = a_writable
			a_type /= Void implies type = a_type
			feature_entity = a_feature_entity
			feature_arguments_list = a_feature_arguments
			position = a_position
		end

	explicit_type: LIBERTY_TYPE
	feature_arguments_list: COLLECTION[LIBERTY_EXPRESSION]

feature {ANY}
	accept (v: VISITOR) is
		local
			v0: LIBERTY_CREATION_INSTRUCTION_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_creation_instruction(Current)
		end

invariant
	writable /= Void
	feature_entity /= Void
	feature_arguments /= Void

end
