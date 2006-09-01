class XMLRPC_VALUE_INT

inherit
	XMLRPC_VALUE_ANY
		rename make as p_make
		end

creation make, from_value

feature {} -- Creation

	make (an_int: INTEGER) is
		local
			res_ptr: POINTER
		do
			create env.make
			res_ptr := xmlrpc_int_new (env.handle, an_int)
			if is_valid then
				check res_ptr.is_not_null end
				from_external_pointer (res_ptr)
			end
		end

feature -- Operations

	read: INTEGER is
		do
			xmlrpc_read_int (env.handle, handle, $Result)
		end

end -- class XMLRPC_VALUE_INT
