indexing
	description: "Retrieve a G_OBJECT wrapper from the pointer stored in the C low-level Gobject's ."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class G_OBJECT_FACTORY [ITEM -> G_OBJECT]
	-- A factory for G_OBJECTS. It retrieves them from the reference
	-- stored in the actual GObject data strutcture, using
	-- "g_object_get_qdata".

	-- If the GObject does not have an associated wrapper an archetype
	-- is retrieved from the GObject's GType using `g_type_get_qdata';
	-- such an archetype should have been stored in the GObject's GType
	-- during the initialization of the Eiffel wrapper library.

	-- At initialization time each library wrapper that implements
	-- non-deferred G_OBJECT heirs is required to create an "archetype"
	-- object of each effective type and "connect" it to the underlying
	-- GType.

	-- i.e. having a w: GTK_WINDOW

	-- (TODO) g_object_archetypes.put(w,w.type)
	-- g_type_set_archetype (w.type, eiffel_archetype_key.quark, w) 

	-- Actually the Eiffel type system is stretched a little: we
	-- re-wrap `g_type_get_qdata' as `g_type_get_archetype', changing
	-- the signature of the result from POINTER to ITEM, to avoid an
	-- ugly type-convertion (aka cast) on the Eiffel side.
	
inherit WRAPPER_FACTORY[ITEM]

insert
	G_OBJECT_EXTERNALS
	G_TYPE_EXTERNALS
	SHARED_ARCHETYPES_DICTIONARY[ITEM]
	SHARED_EIFFEL_KEY

creation default_create

feature {WRAPPER,WRAPPER_HANDLER}
	wrapper (a_pointer: POINTER): ITEM is
			-- Retrieve the eiffel wrapper object from gobject's
			-- `a_pointer'. It the GObject does not have a wrapper,
			-- Result is copied from an archetype and set using
			-- `a_pointer'. Such an archetype is retrieved from the a
			-- property of the GObject's GType and it is stored there at
			-- initialization time.

		require else pointer_is_gobject: g_is_object(a_pointer)=1
		local an_archetype: ITEM; gobject_type: like g_type
		do
			Result := g_object_get_eiffel_wrapper (a_pointer, eiffel_key.quark)
			if Result=Void then
				debug
					print ("G_OBJECT_FACTORY.wrapper: no wrapper for GObject at " + a_pointer.out)
					print (" (type %"")
					print (create {STRING}.from_external_copy(g_object_type_name(a_pointer)))
					print ("%"). Looking for an archetype... ")
					-- wrapper twinned from an archetype obtained from the GObject's type.%N")
				end
				gobject_type := g_object_type (a_pointer)
				an_archetype := g_type_get_archetype (gobject_type, eiffel_archetype_key.quark)
				if an_archetype = Void then
					debug print(" not found. ") end
					an_archetype := archetype_for(gobject_type)
				else
					debug print(an_archetype.out+" found.") end
				end
				Result := an_archetype.standard_twin
				Result.set_handle(a_pointer)
			end
		end
	
	has_eiffel_wrapper_stored (a_pointer: POINTER): BOOLEAN is
			-- Have `a_pointer' already been wrapped?

			-- Note: if True, the cost of this query is the same of a
			-- call to `wrapper'. So a code pattern like:

			-- if has_eiffel_wrapper_stored(c_pointer) then
			--   Result:=wrapper(c_pointer)
			-- else
			--   create	Result.from_external_pointer (c_pointer) 
			-- end

			-- is on average slower than the equivalent:
			-- "Result:=wrapper(c_pointer)".

			-- Yet, if the effective type of the Gobject referred by
			-- `a_pointer' is actually known for sure, the most efficient
			-- code pattern is:

			-- if not has_eiffel_wrapper_stored(c_pointer)
			-- then create Result.from_external_pointer (c_pointer)
			-- else Result:=wrapper(c_pointer)
			-- end

			-- Because 

		do
			Result := (g_object_get_qdata (a_pointer, eiffel_key.quark).is_not_null)
		end

feature {} -- Implementation
	has_archetype_for (a_type: like g_type): BOOLEAN is
			-- Does GType `a_type' have an Eiffel archetype?
		do
			Result := (g_type_get_archetype(a_type,eiffel_archetype_key.quark) /= Void)
		end
	
	archetype_for (a_starting_type: like g_type): ITEM is
			-- The archetype of the GObject referred by `a_pointer'. 
		require
			not has_archetype_for(a_starting_type)
		local
			a_type: like g_type
			fundamental_type_found: BOOLEAN
		do
			from a_type:=a_starting_type
			until Result/=Void or else fundamental_type_found
			loop
				a_type:=g_type_parent(a_type)
				fundamental_type_found:=g_type_is_fundamental(a_type).to_boolean
				Result:=g_type_get_archetype(a_type,eiffel_archetype_key.quark)

				debug
					if fundamental_type_found then print("Fundamental GType '")
					else print("GType '")
					end
					print(create {STRING}.from_external_copy(g_type_name(a_type)))
					print("' ("+a_type.out+"): ")
					if Result=Void then print(" no archetype. ")
					else print(Result.out) 
					end
				end
			end
			if Result=Void or else fundamental_type_found then
				raise(no_proper_wrapper_available)
			end
		ensure not_void: Result/=Void
		end
end
