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
deferred class LIBERTY_MAIN
	--
	-- Provides a common structure for Liberty tools.
	--

insert
	ARGUMENTS
	LOGGING

feature {}
	make is
		local
			root: LIBERTY_ACTUAL_TYPE
			root_feature_name: LIBERTY_FEATURE_NAME
			etc: LIBERTY_ETC
			log_location: like default_log_location
		do
			log_location := default_log_location
			if not arguments.parse_command_line then
				arguments.usage(std_error)
				die_with_code(1)
			end

			etc.configure_for(arg_loadpath.item, create {LIBERTY_ETC_VISITOR_IMPL}.make("libertyi"))

			set_log(log_location)
			etc.log_clusters

			create universe.make
			create root_feature_name.make(arg_root_feature_name.item)

			root := universe.get_type(Void, errors.unknown_position, arg_root_type.item, create {FAST_ARRAY[LIBERTY_ACTUAL_TYPE]}.with_capacity(0))

			run(root, root_feature_name)
		end

	arg_loadpath, arg_root_type, arg_root_feature_name: COMMAND_LINE_TYPED_ARGUMENT[FIXED_STRING]
	opt_variables: COMMAND_LINE_TYPED_ARGUMENT[TRAVERSABLE[FIXED_STRING]]
	opt_log_level: COMMAND_LINE_TYPED_ARGUMENT[LIBERTY_MAIN_LOG_LEVEL]
	opt_check_level: COMMAND_LINE_TYPED_ARGUMENT[LIBERTY_MAIN_CHECK_LEVEL]
	opt_debug: COMMAND_LINE_TYPED_ARGUMENT[BOOLEAN]

	arguments: COMMAND_LINE_ARGUMENTS is
		local
			factory: COMMAND_LINE_ARGUMENT_FACTORY
			log_level_factory: COMMAND_LINE_ARGUMENT_CUSTOM_FACTORY[LIBERTY_MAIN_LOG_LEVEL]
			check_level_factory: COMMAND_LINE_ARGUMENT_CUSTOM_FACTORY[LIBERTY_MAIN_CHECK_LEVEL]
			log_level: LIBERTY_MAIN_LOG_LEVEL
			check_level: LIBERTY_MAIN_CHECK_LEVEL
		once
			arg_loadpath := factory.positional_string("loadpath", "The path to the root loadpath.se")
			arg_root_type := factory.positional_string("root type", "The name of the root type")
			arg_root_feature_name := factory.positional_string("root feature name", "The name of the creation feature in the root type")
			opt_variables := factory.option_strings("v", "variable", "variable", "[
																										 var=value -- Set the variable 'var' to 'value'.
																										 Useful for plugin paths. For example:
																										     -v sys=`se -environment | grep '^SE_SYS=' | cut -c8-`
																										 ]")
			opt_log_level := log_level_factory.option_custom("l", "log", "log level", "The log level: trace, info, warning, error",
																			 agent log_level.valid_arg,
																			 agent log_level.set)
			opt_check_level := check_level_factory.option_custom("c", "check", "check level", "The contract checking level: all, invariant, ensure, require, none",
																				  agent check_level.valid_arg,
																				  agent check_level.set)
			opt_debug := factory.option_boolean("d", "debug", "Enable debug sections")

			create Result.make(arg_loadpath and arg_root_type and arg_root_feature_name
									 and opt_variables and opt_log_level and opt_check_level and opt_debug
									 and factory.remaining_parameters)
		end

	usage is
		do
			arguments.usage(std_error)
			die_with_code(1)
		end

	run (root: LIBERTY_ACTUAL_TYPE; root_feature_name: LIBERTY_FEATURE_NAME) is
		require
			root /= Void
			root_feature_name /= Void
		deferred
		end

	set_log (logpath: STRING) is
		local
			log_conf: LOG_CONFIGURATION
			tfr: TEXT_FILE_READ
		do
			env.substitute(logpath)
			create tfr.connect_to(logpath)
			if not tfr.is_connected then
				std_error.put_line("Unknown log configuration file: " + logpath)
				die_with_code(1)
			end
			log_conf.load(tfr, agent on_error, agent resolve_path)
			tfr.disconnect
		end

	on_error (message: STRING) is
		do
			std_error.put_line(message)
			die_with_code(1)
		end

	levels: LOG_LEVELS
	env: LIBERTY_ENVIRONMENT

	default_log_location: STRING is
		deferred
		ensure
			Result /= Void
		end

	errors: LIBERTY_ERRORS
	universe: LIBERTY_UNIVERSE

	resolve_path (a_path: STRING): STRING is
		do
			Result := once ""
			Result.copy(a_path)
			env.substitute(Result)
		end

end -- class LIBERTY_MAIN
