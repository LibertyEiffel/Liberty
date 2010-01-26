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

create {LIBERTY_TYPE_BUILDER_TOOLS}
	make

feature {ANY}
	writable: LIBERTY_WRITABLE
	feature_entity: LIBERTY_FEATURE_ENTITY
	feature_arguments: TRAVERSABLE[LIBERTY_EXPRESSION]

	type: LIBERTY_TYPE is
		do
			if explicit_type = Void then
				Result := writable.result_type
			else
				Result := explicit_type
			end
		end

	is_actual_type_set: BOOLEAN is True

feature {}
	make (a_writable: like writable; a_type: like type; a_feature_entity: like feature_entity; a_feature_arguments: like feature_arguments; a_position: like position) is
		require
			a_writable /= Void
			a_feature_entity /= Void
			a_feature_arguments /= Void
			a_position /= Void
		do
			writable := a_writable
			explicit_type := a_type
			feature_entity := a_feature_entity
			feature_arguments := a_feature_arguments
			position := a_position
		ensure
			writable = a_writable
			a_type /= Void implies type = a_type
			feature_entity = a_feature_entity
			feature_arguments = a_feature_arguments
			position = a_position
		end

	explicit_type: LIBERTY_TYPE

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
