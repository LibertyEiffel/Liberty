class FFI_EXAMPLE
	-- Sample usage of the foreign function interface library.

	-- Invoking "puts" C function a couple of time with two different Eiffel strings.

insert 
	FFI_TYPES
    FFI_MORE_EXTERNALS
	ANY -- To reobtain copy, default_create and is_equal.
create {ANY} make

feature {ANY} -- Creating
	make
		local msg: STRING; ptr: POINTER
	do
			create call.prepare(my_function, ffi_type_sint32, <<ffi_type_pointer>>)
			print("Invoking 'puts'%N")
			msg := "Hello Liberty!"
			ptr := msg.to_external
			call.invoke($call_result, <<$ptr>>)
			print("Result of last call is "+call_result.out+"%N")

			--call.invoke(resp,<<"Hello again!".to_external>>)
			-- print("Result of last call is "+res.out+"%N")
		end

feature {ANY} 
	call_result: INTEGER_64;
	call: FFI_CALL
	my_function: POINTER
		external "C inline"
		alias "puts"
		end
end

-- Copyright (C) 2010-2016: Paolo Redaelli, 2013 Cyril Adrian

-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public License
-- as published by the Free Software Foundation; either version 2.1 of
-- the License, or (at your option) any later version.
--
-- This library is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-- 02110-1301 USA
 
