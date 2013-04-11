class FOREIGN_INTERFACE_EXAMPLE
	-- Sample usage of the foreign function interface library using Liberty's
	-- foreign interface which makes handling applying the types of a call as
	-- comfortable as possible from the strongly-typed Liberty world.

	-- Invokes "puts" C to print "Hello Liberty" and "Hello again" strings.

insert 
	FFI_TYPES
	ANY -- To reobtain copy, default_create and is_equal.
creation make

feature {ANY} -- Creating
	make is
		local res: FOREIGN_OBJECT; args: FOREIGN_PARAMETERS
	do
		create call.make(my_function,<<types.c_string>>, types.sint32)

		print("Invoking 'puts'%N")
		args.set(<<types.create_string("Hello Liberty!")>>)
		res := call.item(args)

		-- print("Result of last call is "+call_result.out+"%N")
	end

feature {ANY} 
	types: FOREIGN_TYPES

	call_result: INTEGER_64;

	call: FOREIGN_EXTERNAL_FUNCTION

	my_function: POINTER is
		external "C inline"
		alias "puts"
		end
end
