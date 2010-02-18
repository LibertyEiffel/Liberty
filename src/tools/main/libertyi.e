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
class LIBERTYI
	--
	-- The interpreter.
	--

insert
	ARGUMENTS

create {}
	make

feature {}
	make is
		local
			universe: LIBERTY_UNIVERSE
			root: LIBERTY_ACTUAL_TYPE
			root_feature_name: LIBERTY_FEATURE_NAME
			errors: LIBERTY_ERRORS
			interpreter: LIBERTY_INTERPRETER
		do
			if argument_count /= 3 then
				std_error.put_line("Usage: " + command_name + " <loadpath> <root type> <root feature name>")
				std_error.put_line("  <loadpath>           the path to the root loadpath.se")
				std_error.put_line("  <root type>          the name of the root type")
				std_error.put_line("  <root feature name>  the name of the creation feature in the root type")

				die_with_code(1)
			end

			create universe.make(argument(1))
			root := universe.get_type(Void, errors.unknown_position, argument(2), create {FAST_ARRAY[LIBERTY_ACTUAL_TYPE]}.with_capacity(0))

			create root_feature_name.make(argument(2).intern)
			universe.build_types(root, root_feature_name)

			create interpreter.make(universe, root, root_feature_name)
			interpreter.run
		end

end -- class LIBERTYI
