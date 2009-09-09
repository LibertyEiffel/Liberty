-- -----------------------------------------------------------------------------------------------------------
-- This file is part of the ESE library.
-- Copyright(C) 2006-2009: Cyril ADRIAN <cyril.adrian@gmail.com> and others (see AUTHORS)
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
-- associated documentation files (the "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
-- following conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
-- IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
-- USE OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://ese.sourceforge.net
-- -----------------------------------------------------------------------------------------------------------
class PARSE_ACTION

creation {PARSE_TERMINAL, PARSE_NT_NODE}
	make

feature {ANY}
	name: STRING
			-- useful for debug

	call is
		do
			action.call([])
		end

feature {PARSE_TERMINAL, PARSE_NT_NODE}
	set_name (a_name: like name) is
		do
			name := a_name
		ensure
			name = a_name
		end

feature {}
	make (a_action: like action) is
		require
			a_action /= Void
		do
			action := a_action
		ensure
			action = a_action
		end

	action: PROCEDURE[TUPLE]

invariant
	action /= Void

end -- PARSE_ACTION
