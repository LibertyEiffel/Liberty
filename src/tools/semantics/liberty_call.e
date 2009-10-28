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

feature {ANY}
	target: LIBERTY_EXPRESSION
	entity: LIBERTY_FEATURE_ENTITY
	actuals: TRAVERSABLE[LIBERTY_EXPRESSION]

	is_implicit_current: BOOLEAN is
		do
			Result := target = Void
		end

feature {}
	make (a_target: like target; a_entity: like entity; a_actuals: like actuals) is
		require
			a_target /= Void
			a_entity /= Void
			a_actuals /= Void
		do
			target := a_target
			entity := a_entity
			actuals := a_actuals
		ensure
			target = a_target
			entity = a_entity
			actuals = a_actuals
		end

	implicit_current (a_entity: like entity; a_actuals: like actuals) is
		require
			a_entity /= Void
			a_actuals /= Void
		do
			entity := a_entity
			actuals := a_actuals
		ensure
			is_implicit_current
			entity = a_entity
			actuals = a_actuals
		end

invariant
	entity /= Void
	actuals /= Void

end
