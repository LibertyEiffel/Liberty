indexing
	description: "Wrapper factory creates objects without knowing its type and creation clause at compile-time. Needed to implement generic C data structures."
	copyright: "(C) 2006, 2007 Paolo Redaelli"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class MAGICAL_FACTORY [ITEM->SHARED_C_STRUCT]
	-- A factory that magically creates wrapper from nowhere using
	-- internals of SmartEiffel-

	-- This factory creates an object without knowing its type and
	-- creation clause at compile-time. This is useful to implement
	-- generic C data structures.
	
inherit
	WRAPPER_FACTORY[ITEM]
	ANY
	
insert INTERNALS_HANDLER
	-- needed to materialize an object of type ITEM, without knowing
	-- which type ITEM will really be.
		undefine is_equal, copy, fill_tagged_out_memory
		end
	
creation default_create
	
feature {WRAPPER,WRAPPER_HANDLER} -- Implementation
	new_item: ITEM is
			-- Materialize an Eiffel object. This feature contains
			-- something that can be considered "black magic" by purists:
			-- creating an object at run-time of type `ITEM' without
			-- knowing the effective type at compile-time, without having
			-- a valid ITEM to copy from and without using a create
			-- instruction; the only thing we know is that we trust
			-- SmartEiffel that it is creable. This is achieved using
			-- TYPED_INTERNALS. In fact SmartEiffel explictly forbid to
			-- create an object of a generic type, without knowing its
			-- effective type.
		local internal: TYPED_INTERNALS[ITEM]
		do
			create internal.make_blank -- magically create a new ITEM
			internal.set_object_can_be_retrieved -- prepare it to be released from the magic couldron
			Result := internal.object -- Pick it

			-- Note: this feature could also be writted this way:
			
			-- external "C inline"
			-- alias "malloc (sizeof($first))"
			
			-- That could/should be faster. This solution feels "cleaner". Paolo
			-- 2006-07-12

			-- This solution has the delightful side effect of being 
			-- portable across compiler backends (C,Java and any 
			-- forthcoming). Paolo 2006-10-20
		ensure not_void: Result /= Void
		end

	wrapper (a_pointer: POINTER): ITEM is
			-- A wrapper for the structure at address `a_pointer'. The 
			-- default implementation in WRAPPER_FACTORY "creates" a new 
			-- wrapper every time, while their heirs are allowed to 
			-- provide implementations that fits better to peculiar 
			-- memory handling schemes.
		do
			print_wrapper_factory_notice
			Result:=new_item
			Result.from_external_pointer(a_pointer)
		end
	
feature {} -- Notice
	print_wrapper_factory_notice is
		once
			print ("[
					  Warning! WRAPPER_FACTORY.retrieve feature could 
					  produce objects which type is effectively deferred, 
					  instead of giving it the correct type.%NFor example, 
					  a button in a G_LIST[GTK_WIDGET] would have type `GTK_WIDGET'
					  instead of `GTK_BUTTON'. I strongly suspect that this will 
					  inevitably lead  to horrible crashes at run-time. 
					  Obviously this couldn't be accepted and should be a 
					  temporary solution.
					  
					  Paolo 2006-10-20
					  ]")
		end

end
