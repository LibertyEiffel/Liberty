expanded class BOOLEAN
	--
	-- Note: An Eiffel BOOLEAN is mapped as a C char or as a Java byte.
	--

insert
	ANY
		redefine out_in_tagged_out_memory, fill_tagged_out_memory
		end

feature {ANY}
	infix "and" (other: BOOLEAN): BOOLEAN is
			-- `and' of Current with `other'.
			--
			-- Note: when evaluation of `other' has no side effects, it
			-- may be better to use "and then" to avoid execution-time
			-- overhead.
		do
			Result := Current and then other
		end

	infix "and then" (other: BOOLEAN): BOOLEAN is
			-- Semi-strict `and' of Current with `other'.
		external "built_in"
		end

	infix "implies" (other: BOOLEAN): BOOLEAN is
			-- Does Current imply `other'.
		external "built_in"
		end

	infix "or" (other: BOOLEAN): BOOLEAN is
			-- `or' of Current with `other'
			--
			-- Note: when evaluation of `other' has no side effects, it
			-- may be better to use "or else" to avoid execution-time
			-- overhead.
		do
			Result := Current or else other
		end

	infix "or else" (other: BOOLEAN): BOOLEAN is
			-- Semi-strict `or' of Current with `other'
		external "built_in"
		end

	infix "xor" (other: BOOLEAN): BOOLEAN is
			-- `xor' of Current with `other'
		do
			Result := Current /= other
		end

	prefix "not": BOOLEAN is
			-- `not' of Current.
		do
			Result := Current = False
		end

	to_string: STRING is
		do
			if Current then
				Result := once "True"
			else
				Result := once "False"
			end
		ensure
			(once "True").is_equal(Result) implies Current
			;(once "False").is_equal(Result) implies not Current
		end

	to_integer: INTEGER is
		do
			if Current then
				Result := 1
			else
				Result := 0
			end
		ensure
			Result = 1 implies Current
			Result = 0 implies not Current
		end

	to_character: CHARACTER is
		do
			if Current then
				Result := '1'
			else
				Result := '0'
			end
		ensure
			Result = '1' implies Current
			Result = '0' implies not Current
		end

	append_in (str: STRING) is
		do
			str.append(to_string)
		end

feature {ANY} -- Object Printing:
	out_in_tagged_out_memory, fill_tagged_out_memory is
		do
			tagged_out_memory.append(to_string)
		end

end -- class BOOLEAN
