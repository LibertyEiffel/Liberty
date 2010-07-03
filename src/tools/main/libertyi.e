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
	LOGGING

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
			i, eq: INTEGER
			env: LIBERTY_ENVIRONMENT
			arg: STRING
			options: LIBERTY_INTERPRETER_OPTIONS
			etc: LIBERTY_ETC
		do
			if argument_count < 3 then
				usage
			end

			from
				arg := once ""
				i := 4
			until
				i > argument_count
			loop
				arg.copy(argument(i))
				if arg.has_prefix(once "-v") then
					eq := arg.first_index_of('=')
					if arg.valid_index(eq) then
						env.set(arg.substring(3, eq-1), arg.substring(eq+1, arg.count))
					else
						usage
					end
				elseif arg.has_prefix(once "-log=") then
					arg.remove_prefix(once "-log=")
					arg.to_lower
					inspect
						arg
					when "t", "trace", "debug" then
						log.set_level(levels.trace)
					when "i", "info" then
						log.set_level(levels.info)
					when "w", "warn", "warning" then
						log.set_level(levels.warning)
					when "e", "error" then
						log.set_level(levels.error)
					else
						usage
					end
				elseif arg.has_prefix(once "-check=") then
					arg.remove_prefix(once "-check=")
					arg.to_lower
					inspect
						arg
					when "all", "yes" then
						options.check_all
					when "invariant" then
						options.check_invariant
					when "ensure" then
						options.check_ensure
					when "require" then
						options.check_require
					when "none", "no" then
						options.check_none
					else
						usage
					end
				elseif arg.has_prefix(once "-debug") then
					options.enable_debug
				else
					usage
				end
				i := i + 1
			end

			etc.configure_for(argument(1), create {LIBERTY_ETC_VISITOR_IMPL}.make("libertyi"))
			etc.log_clusters

			create universe.make
			create root_feature_name.make(argument(3).intern)

			root := universe.get_type(Void, errors.unknown_position, argument(2).intern, create {FAST_ARRAY[LIBERTY_ACTUAL_TYPE]}.with_capacity(0))

			create interpreter.make(universe, root, root_feature_name)
			interpreter.run
		end

	usage is
		do
			std_error.put_line("Usage: " + command_name + " <loadpath> <root type> <root feature name> <-vvar=value>...")
			std_error.put_line("  <loadpath>           The path to the root loadpath.se")
			std_error.put_line("  <root type>          The name of the root type")
			std_error.put_line("  <root feature name>  The name of the creation feature in the root type")
			std_error.put_line("  <-vvar=value>        The variable 'var' is set to 'value'.")
			std_error.put_line("                         Useful for plugin paths. For example:")
			std_error.put_line("                         -vsys=`se -environment | grep '^SE_SYS=' | cut -c8-`")
			std_error.put_line("  <-log=level>         The log level: trace, info, warning, error")
			std_error.put_line("  <-check=level>       The contract checking level: all, invariant, ensure,")
			std_error.put_line("                                                    require, none")
			std_error.put_line("  <-debug>             Enables debug sections")

			die_with_code(1)
		end

	levels: LOG_LEVELS

end -- class LIBERTYI
