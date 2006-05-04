indexing

	description: "The base object type of gobject library"
	long: "[
			 Currently the only wrapped features are those explicitly necessary to wrap GTK+ 2.x
			 GObject is the fundamental type providing the common attributes and methods for all object types in GTK+, Pango and other libraries based on GObject. The GObject class provides methods for object construction and destruction, property access methods, and signal support. Signals are described in detail in Signals(3).
			 ]"
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

deferred class G_OBJECT
	-- GObject is the fundamental type providing the common attributes and
	-- methods for all object types in GTK+, Pango and other libraries based on
	-- GObject. The GObject class provides methods for object construction and
	-- destruction, property access methods, and signal support. Signals are
	-- described in detail in Signals(3).

inherit
	SHARED_C_STRUCT redefine from_external_pointer, dispose end
	ANY
insert
	GLIB_MEMORY_ALLOCATION export {NONE} all end
	G_OBJECT_EXTERNALS
	G_VALUE_EXTERNALS
	SHARED_EIFFEL_KEY
	
feature 
	store_eiffel_wrapper is
			-- Store a pointer to Current into the underlying
			-- gobject. This pointer will be used to retrieve the Eiffel
			-- wrapper object when a C feature returns a generic object
			-- (i.e. the preview widget set in GTK_FILE_CHOOSER). 
		do
			set_qdata (eiffel_key, Current)
		ensure stored: is_eiffel_wrapper_stored
		end

	is_eiffel_wrapper_stored: BOOLEAN is
			-- Has a pointer to the Current Eiffel wrapper been stored
			-- into the underlying GObject's qdata property with the
			-- GQuark `eiffel_key' (which is currently "eiffel-wrapper")?
		do
			Result := has_qdata (eiffel_key)
		end

feature {WRAPPER} -- GObject type system implementation.
	type: INTEGER is
		do
			Result := g_object_type (handle)
		end
feature -- Creating
	from_external_pointer (a_ptr: POINTER) is
		require pointer_not_null: a_ptr.is_not_null
		do
			Precursor (a_ptr)
			ref -- Let's add a reference to the underlying g_object
		end

feature -- Disposing
	dispose is
			-- Dispose the g_object, calling unref and setting its handle to default_pointer.
		
			-- TODO: once the iusse explained in the debug tense in the implementation is 
			-- solved put a "require is_a_gobject: g_is_object (handle)" precondition
		do
			-- Note: when Eiffel dispose a G_OBJECT it just unref it and
			-- cleans its handle. The actual reclaiming of the memory
			-- alloca ted on the C side is left to gobject runtime.
			debug
				print ("Eiffel is disposing g_object ") print (generator)
				print (" (at ") print (handle.out) print (")%N")
			end	
			if is_g_object then unref
			else
				debug print ("It's handle is not a g_object! Please see the notes in G_OBJECT.dispose%N")
					-- Note: for the above perhaps dispose has been called
					-- after GTK libraries has already shut down. This
					-- could be a "feature" instead of a bug, since it is
					-- possible that this part of dispose won't be called
					-- if the garbage collector is called during
					-- application normal usage. Paolo 2006-04-24
				end
			end
			handle := default_pointer
		end

feature {NONE} -- Disposing helper
	is_g_object: BOOLEAN is
			-- Is current handle a pointer to a g_object?
		do
			Result := (g_is_object (handle) /= 0)
		end
feature -- Reference count
	ref is
			-- Increases the reference count of object.
		local ptr: POINTER
		do
			ptr := g_object_ref (handle)
				check
					ptr_equals_handle: ptr = handle
				end
		end

	unref is
			-- Decreases the reference count if object. When its reference count
			-- drops to 0, the object is finalized (i.e. its memory is freed).
		do
			g_object_unref (handle)
		end

feature -- Properties

	notify (a_property_name: STRING) is
		-- Emits a "notify" signal for the property `a_property_name' on
		-- object.
		do
			g_object_notify (handle, a_property_name.to_external) 
		end

	freeze_notify is
			-- Stops emission of "notify" signals on object. The signals are queued
			-- until thaw_notify is called on object.  This is necessary for
			-- accessors that modify multiple properties to prevent premature
			-- notification while the object is still being modified.
		do
			g_object_freeze_notify (handle)
		end

	thaw_notify (object: POINTER) is 
			-- Causes all queued "notify" signals on object to be emitted. Reverts
			-- the effect of a previous call to freeze_notify.
		do
			g_object_thaw_notify (handle)
		end

	get_data (a_key: STRING): ANY is
			-- Gets a named field from the objects table of associations (see
			-- set_data).  `a_key': name of the key for that association; Void if no
			-- `a_key' field is present
		require valid_key: a_key /= Void
		local ptr: POINTER
		do
			-- Note: wrappers that needs to store C pointers and do other low-level
			-- stuff are invited to use g_object_get_data directly
			-- Note: Perhaps it is better to use GQuarks and g_object_get_qdata
			ptr := g_object_get_data (handle, a_key.to_external)
			if ptr.is_not_null then Result:=ptr.to_any end
		end
	
	set_data (a_key: STRING; data: ANY) is
			-- Store a reference to `data' under the name `a_key'. Each object
			-- carries around a table of associations from strings to pointers. If
			-- the object already had an association with that name, the old
			-- association will be destroyed.

			-- a_key : 	name of the key
			-- data : 	data to associate with that key
		require
			valid_key: a_key /= Void
			data_not_expanded: not data.is_expanded_type
		do
			-- Note: a_key is not duplicated since g_object_set_data requires a const
			-- gchar *;
			g_object_set_data (handle,a_key.to_external, data.to_pointer)
		end

	steal_data (a_key: STRING): ANY is
			-- Remove a specified datum from the object's data associations, --
			-- without invoking the association's destroy handler. Void if there's
			-- no data with `a_key'
		require valid_key: a_key /= Void
		local ptr: POINTER
		do
			ptr := g_object_steal_data (handle, a_key.to_external)
			if ptr.is_not_null then Result:=ptr.to_any end
		end

feature -- Quark-based data storing and retrieving
	has_qdata (a_key: G_QUARK): BOOLEAN is
			-- Is `a_key' field present in table of associations (see
			-- set_qdata)? `a_key': a GQuark, naming the user data
			-- pointer
		do
			Result := (g_object_get_qdata (handle, a_key.quark).is_not_null)
		end

	get_qdata (a_key: G_QUARK): ANY is
			-- Gets a named field from the objects table of associations
			-- (see set_data). `a_key': a GQuark, naming the user data
			-- pointer; Void if no `a_key' field is present
		local ptr: POINTER
		do
			ptr := g_object_get_qdata (handle, a_key.quark)
			if ptr.is_not_null then Result:=ptr.to_any end
		ensure 
			result_not_expanded: not Result.is_expanded_type
		end
	
	set_qdata (a_key: G_QUARK; data: ANY) is
			-- Store a reference to `data' under the GQuark `a_key'. Each
			-- object carries around a table of associations from strings
			-- to pointers. If the object already had an association with
			-- that name, the old association will be destroyed.

			-- a_key : 	name of the key
			-- data : 	data to associate with that key
		require
			data_not_expanded: not data.is_expanded_type
		do
			g_object_set_qdata (handle,a_key.quark, data.to_pointer)
		end

feature -- Property getter/setter

	set_property (property_name: STRING; a_value: G_VALUE) is
			-- Sets a `property_name' property on Current object to `a_value'
		do
			g_object_set_property (handle, property_name.to_external, a_value.handle)
		end
	
	get_property (property_name: STRING): G_VALUE is
			-- Gets the property name `property_name' of an object.
		local ptr: POINTER
		do
			ptr := malloc_g_value
			g_object_get_property (handle,property_name.to_external,ptr)
			create Result.from_external_pointer (ptr)
		end

invariant
	-- TODO: this makes all programs to fail. TODO: discover why. Paolo
	-- 2006-04-18

	-- stored_eiffel_wrapper: is_eiffel_wrapper_stored
end

