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
class LIBERTY_PREFIX_OPERATOR

inherit
	LIBERTY_PREFIX_CALL
		rename
			make as prefix_make
		end

create {LIBERTY_TYPE_BUILDER}
	make

feature {}
	make (a_target: like target; a_entity: like entity) is
		require
			a_target /= Void
			a_entity.feature_name.is_prefix
		do
			target := a_target
			entity := a_entity
		end

	prefix_name: LIBERTY_FEATURE_NAME is
		do
			check False end
		end

invariant
	actuals.is_empty
	not is_implicit_current

end
