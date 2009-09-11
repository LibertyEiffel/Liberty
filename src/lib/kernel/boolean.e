-- See the Copyright notice at the end of this file.
--
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
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
