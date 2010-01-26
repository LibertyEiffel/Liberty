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
class LIBERTYC

insert
	ARGUMENTS

create {}
	make

feature {}
	make is
		local
			universe: LIBERTY_UNIVERSE
			root: LIBERTY_ACTUAL_TYPE
			errors: LIBERTY_ERRORS
		do
			if argument_count /= 2 then
				std_error.put_line("This is a bootstrap version of the compiler; it only accepts two arguments - the path to loadpath.se and the name of the root class which must have a %"make%" creation procedure.")
				die_with_code(1)
			end

			create universe.make(argument(1))
			root := universe.get_type(Void, errors.unknown_position, argument(2), create {FAST_ARRAY[LIBERTY_ACTUAL_TYPE]}.with_capacity(0))
			universe.build_types

			std_output.put_line("Done: root=" + root.hash_code.out)
		end

end
