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
class LIBERTY_INTERPRETER_EXTERNAL_PLUGINS

create {LIBERTY_INTERPRETER}
	make

feature {LIBERTY_INTERPRETER_FEATURE_CALL}
	call (plugin_call: LIBERTY_INTERPRETER_FEATURE_CALL; plugin_spec: FIXED_STRING; position: LIBERTY_POSITION) is
		local
			tags: LIBERTY_TAGS
			plugin_agent: FOREIGN_AGENT
			the_feature: LIBERTY_FEATURE
			parameters: FOREIGN_PARAMETERS
			returned: FOREIGN_OBJECT
		do
			debug ("interpreter.plugin")
				std_output.put_line(once "Plugin call:")
				plugin_call.show_stack(std_output)
				std_output.put_new_line
				std_output.put_line(once "Plugin spec:")
				std_output.put_line(plugin_spec)
			end

			the_feature := plugin_call.bound_feature
			if tags.plugin_agent.is_set(the_feature) then
				plugin_agent := tags.plugin_agent.value(the_feature)
			else
				plugin_agent := parse_plugin_spec(the_feature, plugin_spec, position)
				tags.plugin_agent.add(plugin_agent, the_feature)
			end

			parameters.set(parameters_to_external(plugin_call.parameters))
			if the_feature.result_type = Void then
				plugin_agent.call(parameters)
			else
				returned := plugin_agent.item(parameters)
				plugin_call.set_returned_object(from_external.item(the_feature.result_type.known_type, returned, plugin_call.position))
			end
		end

feature {}
	make (a_interpreter: like interpreter) is
		require
			a_interpreter /= Void
		do
			interpreter := a_interpreter
			create foreign_types.make(a_interpreter)
			create from_external.make(a_interpreter)
			create to_external.make(a_interpreter)
		ensure
			interpreter = a_interpreter
		end

	interpreter: LIBERTY_INTERPRETER

	parse_plugin_spec (the_feature: LIBERTY_FEATURE; plugin_spec: FIXED_STRING; position: LIBERTY_POSITION): FOREIGN_AGENT is
		local
			i, key_start, key_end, value_start, value_end, state: INTEGER
			key: FIXED_STRING; value, location, module_name, feature_name: STRING
			env: LIBERTY_ENVIRONMENT
		do
			from
				i := plugin_spec.lower
			until
				i > plugin_spec.upper
			loop
				inspect
					state
				when 0 then -- beginning of line, only spaces
					inspect plugin_spec.item(i)
					when ' ', '%T', '%N' then
					else
						key_start := i
						state := 1
					end
				when 1 then -- reading key
					inspect plugin_spec.item(i)
					when ':' then
						key_end := i-1
						state := 2
					else
					end
				when 2 then -- read key, waiting for value
					inspect plugin_spec.item(i)
					when '"' then
						value_start := i+1
						state := 3
					else
					end
				when 3 then -- in value
					inspect plugin_spec.item(i)
					when '%%' then
						state := 4
					when '"' then
						value_end := i-1

						key := plugin_spec.substring(key_start, key_end)
						value := plugin_spec.substring(value_start, value_end).out
						env.substitute(value)
						debug ("interpreter.plugin")
							std_output.put_string(once " -> ")
							std_output.put_string(key)
							std_output.put_string(once ": ")
							std_output.put_line(value)
						end

						inspect
							key.out --| TODO: remove the '.out' when inspect on FIXED_STRING is implemented
						when "location" then
							if location /= Void then
								interpreter.fatal_error("Duplicate %"location%" key", position)
							end
							location := value
						when "module_name" then
							if module_name /= Void then
								interpreter.fatal_error("Duplicate %"module_name%" key", position)
							end
							module_name := value
						when "feature_name" then
							if feature_name /= Void then
								interpreter.fatal_error("Duplicate %"feature_name%" key", position)
							end
							if the_feature.parameters.is_empty and then value.has_suffix(once "()") then
								value.remove_suffix(once "()")
							end
							feature_name := "liberty_plugin__"
							feature_name.append(the_feature.definition_type.name)
							feature_name.append(once "__")
							feature_name.append(value)
						else
							interpreter.fatal_error("Unknown key: %"" + key + "%" key", position)
						end

						state := 0
					else
					end
				when 4 then -- after a percent
					state := 3
				end
				i := i + 1
			end

			if location = Void then
				interpreter.fatal_error("Missing %"location%" key", position)
			elseif module_name = Void then
				interpreter.fatal_error("Missing %"module_name%" key", position)
			elseif feature_name = Void then
				interpreter.fatal_error("Missing %"feature_name%" key", position)
			end

			Result := foreign_agent(the_feature, location, module_name, feature_name, position)
		end

	foreign_agent (the_feature: LIBERTY_FEATURE; location, module_name, feature_name: STRING; position: LIBERTY_POSITION): FOREIGN_AGENT is
		require
			location /= Void
			module_name /= Void
			feature_name /= Void
		local
			loader: FOREIGN_DLL_LOADER
			dll: FOREIGN_DLL
			plugin: STRING
		do
			plugin := once ""
			plugin.copy(location)
			plugin.extend('/')
			plugin.append(module_name)
			plugin.append(once ".so")
			dll := loader.library(plugin)
			if dll = Void then
				interpreter.fatal_error("Unknown plugin " + plugin, position)
			end
			Result := dll.function(feature_name, foreign_parameters_types(the_feature), foreign_result_type(the_feature))
			if Result = Void then
				interpreter.fatal_error("Unknown feature " + feature_name + " in plugin " + plugin, position)
			end
		end

	foreign_parameters_types (the_feature: LIBERTY_FEATURE): COLLECTION[FOREIGN_TYPE] is
		local
			i: INTEGER
		do
			create {FAST_ARRAY[FOREIGN_TYPE]} Result.with_capacity(the_feature.parameters.count)
			from
				i := the_feature.parameters.lower
			until
				i > the_feature.parameters.upper
			loop
				Result.add_last(foreign_types.type(the_feature.parameters.item(i).result_type.known_type))
				i := i + 1
			end
		end

	foreign_result_type (the_feature: LIBERTY_FEATURE): FOREIGN_TYPE is
		local
			types: FOREIGN_TYPES
		do
			if the_feature.result_type /= Void then
				Result := foreign_types.type(the_feature.result_type.known_type)
			else
				Result := types.nothing
			end
		end

	parameters_to_external (parameters: TRAVERSABLE[LIBERTY_INTERPRETER_OBJECT]): COLLECTION[FOREIGN_OBJECT] is
		local
			i: INTEGER
		do
			create {FAST_ARRAY[FOREIGN_OBJECT]} Result.with_capacity(parameters.count)
			from
				i := parameters.lower
			until
				i > parameters.upper
			loop
				Result.add_last(to_external.item(parameters.item(i)))
				i := i + 1
			end
		end

	foreign_types: LIBERTY_INTERPRETER_FOREIGN_TYPES
	from_external: LIBERTY_INTERPRETER_FROM_EXTERNAL
	to_external: LIBERTY_INTERPRETER_TO_EXTERNAL

invariant
	foreign_types /= Void

end -- class LIBERTY_INTERPRETER_EXTERNAL_PLUGINS
