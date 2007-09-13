indexing
	description: "A wrapper that is a collection of other wrappers."
	copyright: "(C) 2007 Paolo Redaelli"
	license: "LGPL v2 or later"
deferred class WRAPPER_COLLECTION [ITEM->SHARED_C_STRUCT]
	-- A wrapper that is a collection of other wrappers. 

	-- Contains the shared logic used in Glib G_SLIST, G_HASH_TABLE 
	-- and so on.

inherit
	COLLECTION[ITEM]

	SHARED_C_STRUCT undefine copy, is_equal, fill_tagged_out_memory end

feature {WRAPPER, WRAPPER_HANDLER} -- Implementation
	are_items_shared: BOOLEAN
			-- Are items shared? If an item is not shared the underlying
			-- C structure will be freed once the Eiffel object is
			-- disposed.

	set_shared_items (a_setting: BOOLEAN) is
		do
			are_items_shared:=a_setting
		ensure set: are_items_shared = a_setting
		end

	factory: WRAPPER_FACTORY[ITEM]
			-- The wrapper factory takes a pointer and returns a correct 
			-- wrapper for it. 

	from_collection_and_factory (model: COLLECTION[ITEM]; a_factory: WRAPPER_FACTORY[ITEM]) is
		local i: ITERATOR[ITEM]
		do
			-- FIXME: signature should be model: TRAVERSABLE, once SE2.3 is out
			
			factory := a_factory
			from i:=model.get_new_iterator; i.start
			until i.is_off 
			loop add_last(i.item); i.next
			end
		end

invariant
	factory_not_void: factory /= Void
end -- class WRAPPER_COLLECTION
