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
deferred class LIBERTY_CALL

insert
	LIBERTY_REACHABLE
	LIBERTY_POSITIONABLE

feature {ANY}
	target: LIBERTY_EXPRESSION is
		deferred
		end

	entity: LIBERTY_FEATURE_ENTITY is
		deferred
		end

	actuals: TRAVERSABLE[LIBERTY_EXPRESSION] is
		do
			Result := actuals_list
		end

	is_implicit_current: BOOLEAN is
		do
			Result := target = Void
		end

	specialized_in (a_type: LIBERTY_ACTUAL_TYPE): like Current is
		local
			t: like target
			e: like entity
			p: TUPLE[like target, like entity]
			a: like actuals_list
			x: LIBERTY_EXPRESSION
			i: INTEGER
		do
			if target /= Void then
				t := target.specialized_in(a_type)
			end
			e := entity.specialized_in(a_type)
			from
				a := actuals_list
				i := a.lower
			until
				i > a.upper
			loop
				x := a.item(i).specialized_in(a_type)
				if x /= a.item(i) then
					if a = actuals_list then
						a := a.twin
					end
					a.put(x, i)
				end
				i := i + 1
			end
			p := promoted(t, e, a)
			if p /= Void then
				Result := make_new(p.first, p.second, a, position)
			elseif t = target and then e = entity and then a = actuals_list then
				Result := Current
			else
				Result := make_new(t, e, a, position)
			end
		end

feature {}
	promoted (a_target: like target; a_entity: like entity; a_actuals: like actuals): TUPLE[like target, like entity] is
		require
			a_entity /= Void
			a_actuals /= Void
		local
			actual_target_type, actual_arg_type: LIBERTY_ACTUAL_TYPE
		do
			if a_target /= Void
				and then a_target.result_type.is_known
				and then a_actuals.count = 1
				and then a_actuals.first.result_type.is_known
			then
				actual_target_type ::= a_target.result_type.known_type
				if actual_target_type.may_promote_current
					and then actual_arg_type ?:= a_actuals.first.result_type.known_type
				then
					actual_arg_type ::= a_actuals.first.result_type.known_type
					if not actual_arg_type.is_conform_to(actual_target_type)
						and then not actual_arg_type.converts_to(actual_target_type)
						and then actual_target_type.converts_to(actual_arg_type)
					then
						Result := [create {LIBERTY_CAST_EXPRESSION}.make(a_target, actual_arg_type),
									  create {LIBERTY_FEATURE_ENTITY}.make(a_entity.feature_name, actual_arg_type)]
					end
				end
			end
		end

	make_new (a_target: like target; a_entity: like entity; a_actuals: like actuals_list; a_position: like position): like Current is
		require
			a_entity /= Void
			a_actuals /= Void
		deferred
		ensure
			Result.target = a_target
			Result.entity = a_entity
			Result.actuals = a_actuals
		end

	actuals_list: COLLECTION[LIBERTY_EXPRESSION] is
		deferred
		end

invariant
	entity /= Void
	actuals_list /= Void

end
