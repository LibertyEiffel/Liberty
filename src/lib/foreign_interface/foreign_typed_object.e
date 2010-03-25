-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class FOREIGN_TYPED_OBJECT[E_]

inherit
	FOREIGN_OBJECT

creation {FOREIGN_TYPES}
	make, with

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
	make (a_type: like type; an_item: like item) is
		-- Create a FOREIGN_TYPED_OBJECT of `a_type' from `an_item'; `a_type' and `an_item' shall match.
		require
			a_type_matches_an_item: a_type=type_of(an_item)
		do
			type := a_type
			set_item(an_item)
		end

	with (an_item: like item) is
		-- Creates a FOREIGN_TYPED_OBJECT from `an_item'. The actual type of
		-- `an_item' is discovered (computed) at runtime. This requires CPU
		-- run-time; this cost may be avoided providing the correct type to
		-- `make' creation feature which requires - as a precondition - it to
		-- be the correct type.
	do
		type := type_of(an_item)
		set_item(an_item)
	end
feature {ANY} -- Type querieng

	type_of (an_item: like item): like type is
		-- The type of `an_item'.

		-- TODO: CHARACTER and it's related type char may be signed or unsigned depending on the platform. Provide a portable way to implement this.
		local types: FOREIGN_TYPES
		do
			inspect an_item.generating_type
			when "INTEGER_8" then Result:=types.sint8
			when "INTEGER_16" then Result:=types.sint16
			when "INTEGER_32" then Result:=types.sint32
			when "INTEGER_64" then Result:=types.sint64
			when "NATURAL_8" then Result:=types.uint8
			when "NATURAL_16" then Result:=types.uint16
			when "NATURAL_32" then Result:=types.uint32
			when "NATURAL_64" then Result:=types.uint64
			when "REAL" then Result:=types.float
			when "REAL_80" then Result:=types.double
			when "CHARACTER" then not_yet_implemented
			when "POINTER" then Result:=types.pointer
			when "ABSTRACT_STRING" then Result:=types.c_string
			else not_yet_implemented
			end
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
