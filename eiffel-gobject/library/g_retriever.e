indexing
	description: "Retrieve a G_OBJECT wrapper from the pointer stored in the C low-level Gobject's ."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

expanded class G_RETRIEVER [ITEM_ -> G_OBJECT]

obsolete "Use G_OBJECT_EXPANDED_FACTORY instead."

insert
	G_OBJECT_RETRIEVER [ITEM_]
		export {ANY}
			retrieve_eiffel_wrapper_from_gobject_pointer,
			eiffel_wrapper_from_gobject_pointer,
			has_eiffel_wrapper_stored
		end
	ANY -- to get is_equal and copy

end -- class G_RETRIEVER
