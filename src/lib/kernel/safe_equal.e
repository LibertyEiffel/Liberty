-- See the Copyright notice at the end of this file.
--
expanded class SAFE_EQUAL[E_]
	--
	-- The goal of this class is to share the definition of the feature `safe_equal'.
	-- The feature `safe_equal' compares two arguments of type E_, by calling `is_equal' only if
	-- both arguments have the `same_dynamic_type'.
	--

insert
	ANY

feature {ANY}
	test, safe_equal (e1, e2: E_): BOOLEAN is
			-- In order to avoid run-time type errors, feature `safe_equal' calls `is_equal' only when 
			-- `e1' and `e2' have exactly the same dynamic type.
		local
			e_type: E_
		do
			-- Note: the following implementation may appear complicated, but this is 
			-- automatically optimized by the compiler.
			if e1 = e2 then
				Result := True
			elseif e1 = Void then
			elseif e2 = Void then
			elseif e_type = Void then
				if e1.same_dynamic_type(e2) then
					Result := e1.is_equal(e2)
				end
			end
		end

end -- class SAFE_EQUAL
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
