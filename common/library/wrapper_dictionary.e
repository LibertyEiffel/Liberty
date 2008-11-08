indexing
	description: "A wrapper that is a dictionary of other wrappers."
	copyright: "(C) 2007 Paolo Redaelli"
	license: "LGPL v2 or later"

deferred class WRAPPER_DICTIONARY [VALUE->WRAPPER, KEY->COMPARABLE_WRAPPER]
	-- A wrapper that is a collection of other wrappers. 

	-- Contains the shared logic used in Glib G_SLIST, G_HASH_TABLE 
	-- and so on.

inherit
	DICTIONARY [VALUE,KEY]

	WRAPPER
      undefine
         fill_tagged_out_memory
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Implementation
	are_items_shared: BOOLEAN
			-- Are the items contained in Currect DICTIONARY shared? If
			-- an item is not shared the underlying C structure will be
			-- freed once the Eiffel object is disposed.

	set_shared_items (a_setting: BOOLEAN) is
		do
			are_items_shared:=a_setting
		ensure set: are_items_shared = a_setting
		end

	factory: WRAPPER_FACTORY[VALUE]
			-- The wrapper factory takes a pointer and returns a correct 
			-- VALUE wrapper.

invariant
	factory_not_void: factory /= Void

end -- class WRAPPER_DICTIONARY
