indexing
	description: "Wrapper factory creates objects without knowing its type and creation clause at compile-time. Needed to implement generic C data structures."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class WRAPPER_FACTORY [ITEM_->WRAPPER]
	-- wrapper factory would be inserted into the class that 
	-- needs to use it; if multiple usage are needed it is 
	-- perhaps better to use its expanded variant, 
	-- WRAPPER_RETRIEVER. The pattern usage is more or less like 
	-- this:
	
	--  foo: FOO_WRAPPER is 
	-- 		local p: POINTER
	-- 		do
	-- 			p:=my_wrapper_get_foo (handle)
	-- 			if wrappers.has(p) then
	-- 				Result ::= wrappers.at(p)
	-- 			else
	-- 				create Result.from_external_pointer(a_pointer)
	-- 			end
	-- 		end
	
	-- I know it is tedious, but it is the only feasible solution
	-- I was able to find.

inherit
	WRAPPER_HANDLER -- undefine fill_tagged_out_memory end
		undefine null_or end

insert
	INTERNALS_HANDLER
		-- needed to materialize an object of type ITEM, without knowing
		-- which type ITEM will really be.
		undefine is_equal, copy, fill_tagged_out_memory
		end
	SHARED_WRAPPERS_DICTIONARY
	
feature {WRAPPER,WRAPPER_HANDLER} -- Implementation
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

			-- This solution has the delightful side effect of being 
			-- portable across compiler backends (C,Java and any 
			-- forthcoming). Paolo 2006-10-20
		ensure not_void: Result /= Void
		end

	item_from (a_pointer: POINTER): ITEM_ is
			-- Retrieve the wrapper of `a_pointer' if it exists, 
			-- otherwise create a new one.
		require
			pointer_not_null: a_pointer.is_not_null
			dont_create_duplicate_wrappers: not wrappers.has(a_pointer)
		do
			-- if wrappers.has(a_pointer) then
			-- Result:=wrappers.at(a_pointer) else
			Result:=new_item
			Result.from_external_pointer(a_pointer)
		ensure not_void: Result/=Void
		end
	
feature {}
	print_wrapper_factory_notice is
		once
			print ("Warning! WRAPPER_FACTORY.retrieve feature could %
					 %produce objects which type is effectively deferred, %
					 %instead of giving it the correct type.%NFor example, %
					 %a button in a G_LIST[GTK_WIDGET] would have type `GTK_WIDGET'%
					 % instead of `GTK_BUTTON'. I strongly suspect that this will inevitably lead %
					 %to horrible crashes at run-time. Obviously this couldn'%
					 %t be accepted and should be a temporary solution.%N%TPaolo 2006-10-20%N")
		end
end
