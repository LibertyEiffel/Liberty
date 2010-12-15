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
	--
	-- The compiler.
	--

insert
	LIBERTY_MAIN

create {}
	make

feature {}
	run (root: LIBERTY_ACTUAL_TYPE; root_feature_name: LIBERTY_FEATURE_NAME) is
		require
			root /= Void
			root_feature_name /= Void
		local
			compiler: LIBERTY_COMPILER
		do
			log.info.put_new_line
			log.info.put_line("Root type: ")
			root.debug_display(log.info, True)
			log.info.put_line("Done.")

			create compiler.make(universe, root, root_feature_name, opt_check_level.item, opt_debug.item)
			compiler.compile_classes
			compiler.finalize
		end

	default_log_location: STRING is "${path_liberty}/resources/log/libertyc-log.rc"

end
