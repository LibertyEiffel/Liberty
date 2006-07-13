indexing
	description: "Retrieve a G_OBJECT wrapper from the pointer stored in the C low-level Gobject's ."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class G_OBJECT_RETRIEVER [ITEM_ -> G_OBJECT]

inherit WRAPPER_HANDLER

insert
	G_OBJECT_EXTERNALS
	SHARED_EIFFEL_KEY

feature {WRAPPER}

	retrieve_eiffel_wrapper_from_gobject_pointer (a_pointer: POINTER): ITEM_ is
			-- Retrieve the eiffel wrapper object from gobject's `a_pointer'
		require
			pointer_not_null: a_pointer.is_not_null
			pointer_has_stored_wrapper: has_eiffel_wrapper_stored (a_pointer)
		do
			Result := g_object_get_eiffel_wrapper (a_pointer, eiffel_key.quark)
		ensure not_void: Result/=Void
		end

	eiffel_wrapper_from_gobject_pointer (a_pointer: POINTER): ITEM_ is
			-- Retrieve the eiffel wrapper object from gobject's 
			-- `a_pointer'. Can be Void if the GObject referred by `a_pointer' 
			-- hasn't an Eiffel wrapper
		require pointer_not_null: a_pointer.is_not_null
		do
			Result := g_object_get_eiffel_wrapper (a_pointer, eiffel_key.quark)
		end

	has_eiffel_wrapper_stored (a_pointer: POINTER): BOOLEAN is
		do
			Result := (g_object_get_qdata (a_pointer, eiffel_key.quark).is_not_null)
		end

feature {} -- External call

	g_object_get_eiffel_wrapper (a_object: POINTER; a_quark: INTEGER_32): ITEM_ is
			-- This function gets back the Eiffel wrapper stored using `g_object_set_qdata'
		external "C use <glib-object.h>"
		alias "g_object_get_qdata"
		end

end
