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
class LIBERTY_CALL_INSTRUCTION

inherit
	LIBERTY_INSTRUCTION
	LIBERTY_CALL

create {LIBERTY_TYPE_BUILDER_TOOLS}
	make, implicit_current

feature {ANY}
	target: LIBERTY_EXPRESSION
	entity: LIBERTY_FEATURE_ENTITY
	actuals: TRAVERSABLE[LIBERTY_EXPRESSION]

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
	mark_reachable_code (mark: INTEGER) is
		do
			if target /= Void then
				target.mark_reachable_code(mark)
			end
			entity.mark_reachable_code(mark)
			expressions_marker.mark_reachable_code(mark, actuals)
		end

feature {}
	make (a_target: like target; a_entity: like entity; a_actuals: like actuals; a_position: like position) is
		require
			a_target /= Void
			a_entity /= Void
			a_actuals /= Void
			a_position /= Void
		do
			target := a_target
			entity := a_entity
			actuals := a_actuals
			position := a_position
		ensure
			target = a_target
			entity = a_entity
			actuals = a_actuals
			position = a_position
		end

	implicit_current (a_entity: like entity; a_actuals: like actuals; a_position: like position) is
		require
			a_entity /= Void
			a_actuals /= Void
			a_position /= Void
		do
			entity := a_entity
			actuals := a_actuals
			position := a_position
		ensure
			is_implicit_current
			entity = a_entity
			actuals = a_actuals
			position = a_position
		end

feature {ANY}
	accept (v: VISITOR) is
		local
			v0: LIBERTY_CALL_INSTRUCTION_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_call_instruction(Current)
		end

end
