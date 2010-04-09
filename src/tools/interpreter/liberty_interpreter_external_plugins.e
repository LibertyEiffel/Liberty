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
	call (plugin_call: LIBERTY_INTERPRETER_FEATURE_CALL; plugin_spec: FIXED_STRING) is
		local
			tags: LIBERTY_TAGS
			parsed_spec: DICTIONARY[STRING, FIXED_STRING]
		do
			debug ("interpreter.plugin")
				std_output.put_line(once "Plugin call:")
				plugin_call.show_stack(std_output)
				std_output.put_new_line
				std_output.put_line(once "Plugin spec:")
				std_output.put_line(plugin_spec)
				sedb_breakpoint
			end

			if tags.plugin_spec.is_set(plugin_call.tagged) then
				parsed_spec := tags.plugin_spec.value(plugin_call.tagged)
			else
				parsed_spec := parse_plugin_spec(plugin_spec)
				tags.plugin_spec.add(parsed_spec, plugin_call.tagged)
			end

			debug ("interpreter.plugin")
				sedb_breakpoint
			end
		end

feature {}
	make (a_interpreter: like interpreter) is
		require
			a_interpreter /= Void
		do
			interpreter := a_interpreter
		ensure
			interpreter = a_interpreter
		end

	interpreter: LIBERTY_INTERPRETER

	parse_plugin_spec (plugin_spec: FIXED_STRING):  DICTIONARY[STRING, FIXED_STRING] is
		local
			i, key_start, key_end, value_start, value_end, state: INTEGER
			key: FIXED_STRING; value: STRING
			env: LIBERTY_ENVIRONMENT
		do
			create {HASHED_DICTIONARY[STRING, FIXED_STRING]} Result.with_capacity(3)
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
						Result.add(value, key)
						state := 0
					else
					end
				when 4 then -- after a percent
					state := 3
				end
				i := i + 1
			end
		end

end -- class LIBERTY_INTERPRETER_EXTERNAL_PLUGINS
