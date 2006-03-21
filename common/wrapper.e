indexing
	description: "Deferred empty class handling low-level C interfaces. Its heirs will fully expose each other their internals"
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

deferred class WRAPPER

feature {WRAPPER} -- syntactic sugar
	Null: POINTER is
			-- NULL. Just a shorthand for `default_pointer' more
			-- understandable by C programmers.
		external "C macro"
		alias "NULL"
			-- Another possible implementation is
			-- once Result := default_pointer end
		end
feature {WRAPPER} -- Implementation
	from_pointer (a_ptr: POINTER) is do	handle:=a_ptr	end
	
	handle: POINTER
			-- Pointer to the underlying C "thing" (i.e. a struct)
end
	
