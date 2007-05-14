indexing
	description: "Retrieve a G_OBJECT wrapper from the pointer stored in the C low-level Gobject's ."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class G_OBJECT_RETRIEVER [ITEM_ -> G_OBJECT]

inherit WRAPPER_HANDLER -- undefine null_or end

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
			debug 
				if Result.handle /= a_pointer then
					print ("WARNING: in retrieve_eiffel_wrapper_from_gobject_pointer: Eiffel object had a handle that wasn't the C pointer that had it stored: C pointer = " + a_pointer.out + " wrapper.handle = " + Result.handle.out + "%N")
					print ("Previous versions used to 'fix' it with 'Result.set_handle (a_pointer)'%
                      % but this causes almost surely grave bugs.%N")
					raise (retrieved_object_mismatch)
				end
			end
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
			Result := g_object_get_eiffel_wrapper (a_pointer, eiffel_key.quark)
		end

	has_eiffel_wrapper_stored (a_pointer: POINTER): BOOLEAN is
			-- Have `a_pointer' already been wrapped?

			-- Note: the cost of this query is the same of either
			-- `eiffel_wrapper_from_gobject_pointer' and
			-- `retrieve_eiffel_wrapper_from_gobject_pointer'. So a code
			-- pattern like:

			-- if has_eiffel_wrapper_stored(c_pointer) then
			--   Result:=retrieve_eiffel_wrapper_from_gobject_pointer(c_pointer)
			-- else
			--   create	Result.from_external_pointer (c_pointer) 
			-- end

			-- is twice slower than the equivalent:

			-- Result:=eiffel_wrapper_from_gobject_pointer(c_pointer)
			-- if Result=Void then
			--   create	Result.from_external_pointer (c_pointer) 
			-- end
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
