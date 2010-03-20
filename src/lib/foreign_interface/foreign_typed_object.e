-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class FOREIGN_TYPED_OBJECT[E_]

inherit
	FOREIGN_OBJECT

creation {FOREIGN_TYPES}
	make

feature {ANY}
	item: E_

	set_item (a_item: like item) is
		do
			item := a_item
		ensure
			item = a_item
		end

feature {FOREIGN_PARAMETERS, FOREIGN_AGENT}
	as_pointer: POINTER is
		do
			Result := $item
		end

feature {}
	make (a_type: like type; a_item: like item) is
		do
			type := a_type
			set_item(a_item)
		end

end -- class FOREIGN_TYPED_OBJECT
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
