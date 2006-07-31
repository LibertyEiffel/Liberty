indexing
	description: "Wrapper factory creates objects without knowing its type and creation clause at compile-time. Needed to implement generic C data structures."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"


deferred class WRAPPER_FACTORY [ITEM_->WRAPPER]

inherit
	WRAPPER_HANDLER -- undefine fill_tagged_out_memory end

	INTERNALS_HANDLER
		-- needed to materialize an object of type ITEM, without knowing
		-- which type ITEM will really be.
		undefine copy,fill_tagged_out_memory
		end

feature {WRAPPER}
	wrapper_from_pointer (a_pointer: POINTER): ITEM_ is
			-- Dangerous forced conversion. Assumes that `a_pointer' is 
			-- actually the address of an Eiffel object of type ITEM_. 
			-- This feature is needed to implement a dictionary that 
			-- stores 
		external "C inline"
		alias "$a_pointer"
		end

feature {} -- Implementation
	new_item: ITEM_ is
			-- Materialize an Eiffel object. This feature contains
			-- something that can be considered "black magic" by purists:
			-- creating an object at run-time of type `ITEM' without
			-- knowing the effective type at compile-time, without having
			-- a valid ITEM to copy from and without using a create
			-- instruction; the only thing we know is that we trust
			-- SmartEiffel that it is creable. This is achieved using
			-- TYPED_INTERNALS. Why do this because SmartEiffel explictly
			-- forbid to create an object of a generic type, without
			-- knowing its effective type.
		local internal: TYPED_INTERNALS[ITEM_]
		do
			create internal.make_blank -- magically create a new ITEM
			internal.set_object_can_be_retrieved -- prepare it to be released from the magic couldron
			Result := internal.object -- Pick it

			-- This feature could also be writted this way:
			
			-- external "C inline"
			-- alias "malloc (sizeof($first))"
			
			-- That could/should be faster. This solution feels "cleaner". Paolo
			-- 2006-07-12
		ensure not_void: Result /= Void
		end
end
