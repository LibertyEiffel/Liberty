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
expanded class LIBERTY_ENVIRONMENT

insert
	SYSTEM
		export
			{ANY} copy, is_equal, standard_is_equal, generating_type;
			{} all
		end

feature {ANY}
	item (a_name: ABSTRACT_STRING): STRING is
		require
			a_name /= Void
		local
			name: FIXED_STRING
			value: STRING
			n, v: POINTER
		do
			name := a_name.intern
			value := environment.fast_reference_at(name)
			if value /= Void then
				Result := once ""
				Result.copy(value)
			else
				n := name.to_external
				v := basic_getenv(n)
				if v.is_not_null then
					Result := once ""
					Result.from_external_copy(v)
				end
			end
		end

	set (a_name, a_value: ABSTRACT_STRING) is
		require
			a_name /= Void
			a_value /= Void
		local
			name: FIXED_STRING
			value: STRING
		do
			name := a_name.intern
			value := environment.fast_reference_at(name)
			if value /= Void then
				value.clear_count
				value.append(a_value)
			else
				environment.add(a_value.out, name)
			end

			logging.trace.put_string(a_name)
			logging.trace.put_string(once " = ")
			logging.trace.put_line(a_value)
		ensure
			item(a_name).is_equal(a_value.out)
		end

feature {ANY}
	substitute (line: STRING) is
			-- The only one accepted notation is:  ${...}. The substitution is performed in `line'.
			--| Taken from SmartEiffel: SYSTEM_TOOLS.environment_variable_substitution - but de-recursivated
		require
			line /= Void
		local
			i, state, offset_start, offset_end: INTEGER; c: CHARACTER; value, variable: STRING; done: BOOLEAN
		do
			from
				variable := once ""
			until
				done
			loop
				from
					state := 0
					i := line.lower
				until
					i > line.upper
				loop
					c := line.item(i)
					inspect
						state
					when 0 then
						-- Initial state.
						if c = '$' then
							state := 1
							offset_start := i
						end
					when 1 then
						-- "$" read.
						if c = '{' then
							state := 2
							variable.clear_count
						else
							state := 0
						end
					when 2 then
						-- "${" read.
						if c = '}' then
							state := 3
							offset_end := i
							i := line.upper
						else
							variable.extend(c)
						end
					else -- First correct variable found.
					end
					i := i + 1
				end
				if state = 3 then
					-- One variable found:
					value := item(variable)
					if value = Void then
						done := True
					else
						variable.copy(line)
						line.keep_head(offset_start - 1)
						line.append(value)
						variable.remove_head(offset_end)
						line.append(variable)
					end
				else
					done := True
				end
			end
		end

feature {}
	environment: DICTIONARY[STRING, FIXED_STRING] is
		once
			create {HASHED_DICTIONARY[STRING, FIXED_STRING]} Result.make
		end

	logging: LOGGING

end
