indexing
	description: "Retrieve a G_OBJECT wrapper from the pointer stored in the C low-level Gobject's ."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class G_OBJECT_RETRIEVER [ITEM_ -> G_OBJECT]
	
obsolete "G_OBJECT_RETRIEVER has been reimplemented to use the new G_OBJECT_FACTORY. Please use such a class directly. Paolo 2007-09-23"
		
inherit G_OBJECT_FACTORY[ITEM_]
	
feature {WRAPPER}

	retrieve_eiffel_wrapper_from_gobject_pointer (a_pointer: POINTER): ITEM_ is
			-- Retrieve the eiffel wrapper object from gobject's `a_pointer'
		require
			pointer_not_null: a_pointer.is_not_null
			pointer_has_stored_wrapper: has_eiffel_wrapper_stored (a_pointer)
		do
			Result:=wrapper(a_pointer)
		ensure
			not_void: Result/=Void
			Result.handle = a_pointer
		end
	
	eiffel_wrapper_from_gobject_pointer (a_pointer: POINTER): ITEM_ is
			-- Retrieve the eiffel wrapper object from gobject's 
			-- `a_pointer'. Can be Void if the GObject referred by `a_pointer' 
			-- hasn't an Eiffel wrapper
		require pointer_not_null: a_pointer.is_not_null
		do
			Result:=wrapper(a_pointer)
		end
end
