class FFI_EXAMPLE
	-- Sample usage of the foreign function interface library.

	-- Invoking "puts" C function a couple of time with two different Eiffel strings.

insert 
	FFI_TYPES
	ANY -- To reobtain copy, default_create and is_equal.
create {ANY} make

feature {ANY} -- Creating
	make is
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
	my_function: POINTER is
		external "C inline"
		alias "puts"
		end
end
