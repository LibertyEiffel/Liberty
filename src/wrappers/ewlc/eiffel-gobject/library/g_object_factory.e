note
	description: "Retrieve a G_OBJECT wrapper from the pointer stored in the C low-level Gobject's ."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class G_OBJECT_FACTORY [ITEM -> G_OBJECT]
	-- A factory for G_OBJECTS. Given a pointer to a valid GObject C 
	-- data structure it return the fittest wrapper.

	-- If the underlying C object ("C") has already been wrapped by an
	-- Eiffel object ("E"), `wrapper' will be "E". When "E" - the first,
	-- wrapper for "C" was created a back-reference to "E" was stored
	-- into "C"; see G_OBJECT's `store_eiffel_wrapper' for the details.

	-- If "C" does not have an associated wrapper the inheritance tree of
	-- GObject system type is climbed until a creation agent is found in the
	-- dictionary `creation_agents'; both GType and actual type name are looked
	-- upon.  this dictionary is filled with proper agents during the
	-- initialization of the Eiffel wrapper library.

	-- At initialization time each library wrapper that implements
	-- non-deferred G_OBJECT heirs is required to create an "archetype"
	-- object of each effective type and "connect" it to the underlying
	-- GType. This is done creating the archetype with the `dummy'
	-- creation procedure; it takes care of storing a reference to
	-- itself in the proper GType.

	-- Actually the Eiffel type system is stretched a little: we
	-- re-wrap `g_object_get_qdata' as `g_object_get_eiffel_wrapper ', changing
	-- the signature of the result from POINTER to ITEM, to avoid an
	-- ugly type-convertion (aka cast) on the Eiffel side.

inherit 
	WRAPPER_FACTORY[ITEM]

insert
	G_OBJECT_EXTERNALS
	G_TYPE_EXTERNALS
	SHARED_CREATION_DICTIONARY
	SHARED_EIFFEL_KEY
	EXCEPTIONS undefine copy,is_equal end 

feature {WRAPPER,WRAPPER_HANDLER}
	existant_wrapper (a_pointer: POINTER): ITEM is
			-- Retrieve the eiffel wrapper object from gobject's
			-- `a_pointer' or Void when it does not have a wrapper conforming
			-- to ITEM (i.e. if you ask for GTK_RADIO_BUTTON when it is
			-- actually a GTK_BUTTON Result is still Void).

			-- Useful when you precisely know the type of a wrapper but
			-- you still want to avoid wrapper duplication; i.e.:

			-- pointer := get_foo(handle)
			-- Result := factory.existant_wrapper(pointer)
			-- if Result=Void then create Result.from_external_pointer(pointer) end
		require pointer_is_gobject: g_is_object(a_pointer)=1
		do
			Result ?= g_object_get_eiffel_wrapper (a_pointer, eiffel_key.quark)
		end

	existant_wrapper_or_void (a_pointer: POINTER): ITEM is
		do
			if a_pointer.is_not_null then
				Result := existant_wrapper(a_pointer)
			end
		end

	wrapper (a_pointer: POINTER): ITEM is
			-- The eiffel wrapper object for gobject's `a_pointer'. It the
			-- GObject does not have a wrapper, Result is created using an
			-- agent function from creation_agents dictionary using
			-- `a_pointer'. These creation agents are registered by the
			-- library at startup.

			-- TODO: If REsult is created the underlying GObject is reffed
		require else pointer_is_gobject: g_is_object(a_pointer)=1
		do
			Result := unreffed_wrapper(a_pointer)
			Result.ref
		end
	
	unreffed_wrapper (a_pointer: POINTER): ITEM is
			-- A non-referred wrapper. See `wrapper' for further
			-- informations
		require pointer_is_gobject: g_is_object(a_pointer)/=0
		local
			generic_function: FUNCTION[TUPLE[POINTER],G_OBJECT] 
			function: FUNCTION[TUPLE[POINTER],ITEM]
			typename: STRING; type: like g_type --; fundamental_type_found: BOOLEAN
		do
			create typename.from_external_copy(g_object_type_name(a_pointer))
			debug	
				std_error.put_string(once "G_OBJECT_FACTORY.wrapper(") std_error.put_pointer(a_pointer)
				std_error.put_string(once "): is a ") std_error.put_string(typename)
			end
			Result := existant_wrapper (a_pointer)
			if Result/=Void then
				debug 
					std_error.put_string(once " wrapped by a ")
					std_error.put_line(Result.generator)
				end
			else
				-- Climb the hierarchy until we find and a creation
				-- function. Starting examining the parent class of the
				-- object; we already know that current class does not
				-- have a function.
				from 
					type :=g_object_type(a_pointer) 
					generic_function := creation_agents.reference_at(typename)
					function ?= generic_function
				until Result/=Void or else g_type_is_fundamental(type)
				loop
					if function=Void then 
						debug
							std_error.put_string(" "+typename+" ("+type.out+") does not have a creation function agent; ")
						end
						type:=g_type_parent(type)
						typename.from_external_copy(g_object_type_name(a_pointer))
						if g_type_is_fundamental(type) then 
							raise("G_OBJECT_FACTORY.(unreffed_)wrapper: %
							%I climbed GObject hierarchy to find a class known by Eiffel %
							%but I come to the fundamental type: no known wrapper.") 
						end
						generic_function := creation_agents.reference_at(typename)
						function ?= generic_function
					else 
						debug
							std_error.put_line("Invoking "+function.out+" for "+typename+" ("+type.out+").")
						end
						Result:=function.item([a_pointer])
					end
				end
			end
		end

	unreffed_wrapper_or_void (a_pointer: POINTER): ITEM is
			-- A (unreffed) wrapper for `a_pointer' or Void if `a_pointer' is
			-- default_pointer (NULL in C). See `wrapper_or_void' for 
			-- further informations
		do
			if a_pointer.is_not_null then
				Result := unreffed_wrapper(a_pointer)
			end
		ensure void_case: a_pointer.is_null implies Result = Void
		end

	has_eiffel_wrapper_stored (a_pointer: POINTER): BOOLEAN is
			-- Have `a_pointer' already been wrapped?

			-- Note: if True, the cost of this query is the same of a
			-- call to `wrapper'. So a code pattern like:

			-- if has(c_pointer) 
			-- then Result:=wrapper(c_pointer)
			-- else create Result.from_external_pointer(c_pointer) 
			-- end

			-- is on average twice slower than the equivalent:
			-- "Result:=wrapper(c_pointer)".

			-- This feature is actually useful only in pre and 
			-- postconditions.
		do
			Result := (g_object_get_qdata (a_pointer, eiffel_key.quark).is_not_null)
		end

	type_name_from_gobject_pointer (a_pointer: POINTER): STRING is
			-- Retrieve the type name from gobject's `a_pointer'.
		require
			pointer_not_null: a_pointer.is_not_null
		do
			-- TODO: use a CONST_STRING... currently the following violates some precondtions in STRING
			create {CONST_STRING} Result.from_external(g_object_type_name(a_pointer))
			-- we fallback to a less efficient
			-- create Result.from_external_copy(g_object_type_name(a_pointer))
		end

feature {} -- External call
	g_object_get_eiffel_wrapper (a_object: POINTER; a_quark: INTEGER_32): G_OBJECT is
			-- This function gets back the Eiffel wrapper stored using `g_object_set_qdata'
		external "C use <glib-object.h>"
		alias "g_object_get_qdata"
		end
end
