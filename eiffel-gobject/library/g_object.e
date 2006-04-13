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
	SHARED_C_STRUCT redefine dispose end
	ANY
insert
	GLIB_MEMORY_ALLOCATION export {NONE} all end
	G_OBJECT_EXTERNALS
	G_VALUE_EXTERNALS
	
feature 
	store_eiffel_wrapper is
			-- Store a pointer to Current into the underlying
			-- gobject. This pointer will be used to retrieve the Eiffel
			-- wrapper object when a C feature returns a generic object
			-- (i.e. the preview widget set in GTK_FILE_CHOOSER). 
		do
			set_data (eiffel_key_label, Current)
		end
	
feature {NONE} -- Implementation
	eiffel_key_label: STRING is
			-- The key used to store a pointer to Current into the underlying
			-- gobject.
		"eiffel-wrapper"
	
feature -- Disposing
	dispose is
			-- Dispise the g_object, calling unref and setting its handle to default_pointer.
		
			-- TODO: once the iusse explained in the debug tense in the implementation is 
			-- solved put a "require is_a_gobject: g_is_object (handle)" precondition
		do
			-- Note: when Eiffel dispose a G_OBJECT it just unref it and
			-- cleans its handle. The actual reclaiming of the memory
			-- allocated on the C side is left to gobject runtime.
			debug
				if g_is_object (handle) /= 0 then
					print (once "Eiffel is disposing g_object ") print (generator)
					print (once " (at ") print (handle.out) print (once ")%N")
				else
					print (once "Eiffel is disposing a ") print (generator)
					print (once " (at ") print (handle.out) print (once "). It's handle is NOT a g_object!%N")
				end

			end
			unref
			handle := default_pointer
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

	get_data (key: STRING): ANY is
			-- Gets a named field from the objects table of associations (see
			-- set_data).  `key': name of the key for that association; Void if no
			-- `key' field is present
		local ptr: POINTER
		do
			-- Note: wrappers that needs to store C pointers and do other low-level
			-- stuff are invited to use g_object_get_data directly
			-- Note: Perhaps it is better to use GQuarks and g_object_get_qdata
			ptr := g_object_get_data (handle, key.to_external)
			if ptr.is_not_null then Result:=ptr.to_any end
		end
	
	set_data (key: STRING; data: ANY) is
			-- Store a reference to `data' under the name `key'. Each object
			-- carries around a table of associations from strings to pointers. If
			-- the object already had an association with that name, the old
			-- association will be destroyed.

			-- key : 	name of the key
			-- data : 	data to associate with that key
		require
			data_not_expanded: not data.is_expanded_type
		do
			-- Note: key is not duplicated since g_object_set_data requires a const
			-- gchar *;
			g_object_set_data (handle,key.to_external, data.to_pointer)
		end

	steal_data (key: STRING): ANY is
			-- Remove a specified datum from the object's data associations, --
			-- without invoking the association's destroy handler. Void if there's
			-- no data with `key'
		local ptr: POINTER
		do
			ptr := g_object_steal_data (handle, key.to_external)
			if ptr.is_not_null then Result:=ptr.to_any end
		end

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
end

