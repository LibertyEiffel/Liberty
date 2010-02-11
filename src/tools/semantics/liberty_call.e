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
	LIBERTY_REACHABLE_MARKER

feature {ANY}
	target: LIBERTY_EXPRESSION is
		deferred
		end

	entity: LIBERTY_FEATURE_ENTITY is
		deferred
		end

	actuals: TRAVERSABLE[LIBERTY_EXPRESSION] is
		deferred
		end

	is_implicit_current: BOOLEAN is
		do
			Result := target = Void
		end

invariant
	entity /= Void
	actuals /= Void

end
