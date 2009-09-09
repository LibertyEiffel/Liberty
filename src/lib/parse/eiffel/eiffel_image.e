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
class EIFFEL_IMAGE

inherit
	PARSER_IMAGE
		redefine
			out_in_tagged_out_memory
		end

creation {EIFFEL_GRAMMAR}
	make

feature {ANY}
	image: STRING
			-- the real image of the token

	blanks: STRING
			-- the leading blanks and comments (before the `image' itself)

	line: INTEGER is
		do
			Result := position.line
		end

	column: INTEGER is
		do
			Result := position.column
		end

	out_in_tagged_out_memory is
		do
			tagged_out_memory.append(image)
		end

feature {}
	make (a_image: like image; a_blanks: like blanks; a_position: like position) is
		require
			a_image /= Void
		do
			image := a_image
			blanks := a_blanks
			position := a_position
		ensure
			image = a_image
			blanks = a_blanks
			position = a_position
		end

	position: EIFFEL_POSITION
			-- the position of the `image' (discarding the leading `blanks')

invariant
	image /= Void

end -- class EIFFEL_IMAGE
