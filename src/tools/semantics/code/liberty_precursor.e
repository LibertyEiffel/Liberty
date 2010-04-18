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
deferred class LIBERTY_PRECURSOR

insert
	LIBERTY_POSITIONABLE
	LIBERTY_REACHABLE

feature {ANY}
	the_feature: LIBERTY_FEATURE
	actuals: TRAVERSABLE[LIBERTY_EXPRESSION] is
		do
			Result := actuals_list
		end

	specialized_in (a_type: LIBERTY_ACTUAL_TYPE): like Current is
		local
			f: like the_feature
			a: like actuals_list
			e: LIBERTY_EXPRESSION
			i: INTEGER
		do
			f := the_feature.specialized_in(a_type)
			from
				a := actuals_list
				i := a.lower
			until
				i > a.upper
			loop
				e := a.item(i).specialized_in(a_type)
				if e /= a.item(i) then
					if a = actuals_list then
						a := a.twin
					end
					a.put(e, i)
				end
				i := i + 1
			end
			if f = the_feature and then a = actuals_list then
				Result := Current
			else
				Result := make_new(f, a, position)
			end
		end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
	mark_reachable_code (mark: INTEGER) is
		do
			the_feature.mark_reachable_code(mark)
			expressions_marker.mark_reachable_code(mark, actuals)
		end

feature {}
	make_new (a_feature: like the_feature; a_actuals: like actuals_list; a_position: like position): like Current is
		deferred
		ensure
			Result.the_feature = a_feature
			Result.actuals = a_actuals
			Result.position = a_position
		end

	make (a_feature: like the_feature; a_actuals: like actuals_list; a_position: like position) is
		require
			a_feature /= Void
			a_actuals /= Void
			a_position /= Void
		do
			the_feature := a_feature
			actuals_list := a_actuals
			position := a_position
		ensure
			the_feature = a_feature
			actuals_list = a_actuals
			position = a_position
		end

	actuals_list: COLLECTION[LIBERTY_EXPRESSION]

invariant
	the_feature /= Void
	actuals /= Void

end
