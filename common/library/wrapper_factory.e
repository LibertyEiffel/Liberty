indexing
	description: "Wrapper factory creates objects without knowing its type and creation clause at compile-time. Needed to implement generic C data structures."
	copyright: "(C) 2006, 2007 Paolo Redaelli"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class WRAPPER_FACTORY [ITEM->WRAPPER]
	-- A wrapper that is also a generic container needs a way to 
	-- create new specialized Eiffel wrappers. 

	-- WRAPPER_FACTORY given the address of an underlying wrapped C 
	-- structure returns a valid WRAPPER object. Depending on the 
	-- actual factory used this object can be:

	-- * copied from an archetype,

	-- * magically created from nowhere using internals of SmartEiffel,

	-- * retrieved from a dictionary cache

	-- * retrieved from the underlying object itself, if it has space 
	-- to store a reference to its wrapper; i.e. all GObjects allow 
	-- storing arbitrary properties in them.

	-- If multiple usage are needed it is perhaps better to use an
	-- expanded class that inserts WRAPPER_FACTORY.

inherit WRAPPER_HANDLER

insert ANY -- to re-insert is_equal and other undefined features

feature {WRAPPER,WRAPPER_HANDLER} -- Implementation
	wrapper (a_pointer: POINTER): ITEM is
			-- A wrapper for the structure at address `a_pointer'. The 
			-- default implementation in WRAPPER_FACTORY "creates" a new 
			-- wrapper every time, while their heirs are allowed to 
			-- provide implementations that fits better to peculiar 
			-- memory handling schemes.
		require
			pointer_not_null: a_pointer.is_not_null
			-- dont_create_duplicate_wrappers: not wrappers.has(a_pointer)
		deferred
		ensure
			not_void: Result/=Void
			correct_result: Result.handle = a_pointer
		end

end
