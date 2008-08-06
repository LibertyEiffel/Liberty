indexing
	description: ""
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class WRAPPER_FACTORY [ITEM->WRAPPER]
	-- A wrapper factory returns the "fittest" wrapper object given a
	-- pointer to a wrapped "thing". 

	-- Wrapper factory would be inserted into the class that needs to
	-- use it; if a class needs to create wrappers of several types it is
	-- better to use (as a client) one of its expanded variant, i.e.
	-- G_OBJECT_EXPANDED_WRAPPER.

inherit WRAPPER_HANDLER 

feature {WRAPPER,WRAPPER_HANDLER} -- Implementation
	wrapper (a_pointer: POINTER): ITEM is
			-- The wrapper for `a_pointer'. It could be newly created or
			-- retrieved from a cache, a dictionary, from the underlying
			-- object, depending on the implementation.

			-- See also wrapper_or_void: when `a_pointer' is the
			-- default pointer (known as NULL in C) Result will be Void.
		require pointer_not_null: a_pointer.is_not_null
		deferred
		ensure 
			non_void: Result/=Void 
			correct: Result.handle=a_pointer
		end

	wrapper_or_void (a_pointer: POINTER): ITEM is
			-- A wrapper for `a_pointer' or Void if `a_pointer' is
			-- default_pointer (NULL in C). A commodity feature to
			-- replace the following code snippet:
			 
			-- my_gobject: A_WRAPPER
			-- local p: POINTER
			-- do
			--   p := get_foo(handle)
			--   if p.is_not_null then
			--     Result := factory.wrapper(p)
			--   end
			-- end

			-- with

			-- my_gobject: A_G_OBJECT_HEIR is
			--   do
			--     Result := factory.wrapper_or_void(get_foo(handle))
			--   end
		do
			if a_pointer.is_not_null then
				Result := wrapper(a_pointer)
			end
		ensure
			null_pointer_returns_void: a_pointer.is_null implies Result=Void 
			correct: a_pointer.is_not_null implies Result/=Void and then Result.handle=a_pointer
		end

end
