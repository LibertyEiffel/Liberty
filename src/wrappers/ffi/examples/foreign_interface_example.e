class FOREIGN_INTERFACE_EXAMPLE
	-- Sample usage of the foreign function interface library using Liberty's
	-- foreign interface which makes handling applying the types of a call as
	-- comfortable as possible from the strongly-typed Liberty world.

	-- Invokes "puts" C to print "Hello Liberty" and "Hello again" strings.
	
insert 
    ANY -- To get copy, default_create and is_equal
	FFI_TYPES
    FFI_MORE_EXTERNALS

create {ANY} make

feature {ANY} -- Creating
	make
		local res: FOREIGN_OBJECT; args: FOREIGN_PARAMETERS
	do
		create call.make(my_function,<<types.c_string>>, types.sint32)

		print("Invoking 'puts'%N")
		args.set(<<types.create_string("Hello Liberty!")>>)
		res := call.item(args)

		print("Result of last call is "+res.out+"%N")
	end

feature {ANY} 
	types: FOREIGN_TYPES

	call_result: INTEGER_64;

	call: FOREIGN_EXTERNAL_FUNCTION

	my_function: POINTER
		external "C inline"
		alias "puts"
		end
end

-- Copyright (C) 2010-2022: Paolo Redaelli, 2013 Cyril Adrian

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
 
