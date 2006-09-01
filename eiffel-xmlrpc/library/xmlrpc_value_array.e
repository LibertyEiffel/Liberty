class XMLRPC_VALUE_ARRAY

inherit
	XMLRPC_VALUE_ANY

creation make, from_value

feature {} -- Creation

	make is
		do
			create env.make
			if is_valid then
				from_external_pointer (xmlrpc_array_new (env.handle))
			end
		end

feature -- Operations

	add_last (val: XMLRPC_VALUE_ANY) is
		do
			xmlrpc_array_append_item (env.handle, handle, val.handle)
		end

end -- class XMLRPC_VALUE_ARRAY
