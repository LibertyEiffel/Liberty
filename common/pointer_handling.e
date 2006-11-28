indexing
	description: "Utility class to reference and dereference C pointers."
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

deferred class POINTER_HANDLING

insert ANY undefine copy,is_equal,fill_tagged_out_memory end

feature {WRAPPER} -- Pointer referencing and de-referencing
	address_of (a_pointer: POINTER): POINTER is
		external "C inline" 
		alias "(& ($a_pointer))"
		end

	content_of (a_pointer: POINTER): POINTER is
			-- The pointer referenced by `a_pointer' which has to be a
			-- pointer to a pointer (i.e.: void **). Note: the type
			-- cannot be checked by Eiffel AFAIK. Paolo 2006-05-08q.
		external "C inline" 
		alias "(* ($a_pointer))"
		end
end -- class POINTER_HANDLING
