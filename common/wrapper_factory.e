indexing
	description: "."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"


deferred class WRAPPER_FACTORY [ITEM_->WRAPPER]

inherit
	WRAPPER undefine copy,fill_tagged_out_memory end

	INTERNALS_HANDLER
		-- needed to materialize an object of type ITEM, without knowing
		-- which type ITEM will really be.
		undefine copy,fill_tagged_out_memory
		end

feature {NONE} -- Implementation
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
		ensure not_void: Result /= Void
		end
end
