indexing
	description: "Wrapper factory creates objects without knowing its type and creation clause at compile-time. Needed to implement generic C data structures."
	copyright: "(C) 2007 Paolo Redaelli "
	license: "LGPL v2 or later"

deferred class SHARED_WRAPPER_FACTORY [ITEM->SHARED_C_STRUCT]

inherit WRAPPER_FACTORY[ITEM]

feature {WRAPPER,WRAPPER_HANDLER} -- Implementation
	-- use_wrappers: BOOLEAN is True

	wrapper_for_not_null (a_pointer: POINTER): ITEM is
			-- A new wrapper for the structure at address `a_pointer'.
		require pointer_not_null: a_pointer.is_not_null
		do
			-- if use_wrappers then
			Result ::= wrappers.reference_at(a_pointer)
			if Result=Void then
				Result:=new_item
				Result.from_external_pointer(a_pointer)
			end
			-- else Result:=new_item Result.from_external_pointer(a_pointer) end
		end
	
	wrapper_for (a_pointer: POINTER): ITEM is
			-- A new wrapper for the structure at address `a_pointer'. Void if
			-- `a_pointer' is NULL.
		do
			if a_pointer.is_not_null then
				-- if use_wrappers then
				Result ::= wrappers.reference_at(a_pointer)
				if Result=Void then
					Result:=new_item
					Result.from_external_pointer(a_pointer)
				end
				-- else Result:=new_item Result.from_external_pointer(a_pointer) end
			end
		end
end
