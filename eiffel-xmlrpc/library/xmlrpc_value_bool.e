class XMLRPC_VALUE_BOOL

inherit
	XMLRPC_VALUE_ANY
		rename make as p_make
		end

creation make, from_value

feature {} -- Creation

	make (a_bool: BOOLEAN) is
		local
			res_ptr: POINTER
		do
			create env.make
			res_ptr := xmlrpc_int_new (env.handle, a_bool.to_integer)
			if is_valid then
				check res_ptr.is_not_null end
				from_external_pointer (res_ptr)
			end
		end

feature -- Operations

	read: BOOLEAN is
		do
			xmlrpc_read_bool (env.handle, handle, $Result)
		end

end -- class XMLRPC_VALUE_BOOL
