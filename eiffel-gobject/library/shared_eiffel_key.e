deferred class SHARED_EIFFEL_KEY
	-- A wrapper of a G_OBJECT (or one of its heirs) and the actual
	-- GObject instance at C level holds a reference to each other, in 
	-- order to allow smooth memory handling.

	-- The G_OBJECT holds a reference to the GObject in its `handle' 
	-- feature.

	-- When creating the wrapper we tell the GObject to store a 
	-- reference to the its wrapper using "g_object_set_qdata" with 
	-- `eiffel_key' G_QUARK and the address of the wrapper (using 
	-- `to_pointer').

	-- If during the execution of the program we receive a pointer to a
	-- GObject and we discover that there is no wrapper for it
	-- ("g_object_get_qdata (a_pointer, eiffel_key.quark).is_null) we
	-- need a way to know which kind of Eiffel object to create. A
	-- pratical way is to store in the GType of the Gobject a reference
	-- to an archetype of the wrapper. Given a wrapper-less pointer to
	-- a GObject we obtain its GType; from its type we retrieve its
	-- archetype that must be stored with `g_type_set_qdata' using the
	-- `eiffel_archetype_key' GQuark.
	

inherit ANY undefine is_equal, copy end

feature {} -- Implementation
	eiffel_key: G_QUARK is
			-- The quark used to store a pointer to Current into the
			-- underlying gobject.
		once
			create Result.from_string (eiffel_key_label)
		end
	
	eiffel_key_label: STRING is
			-- The key used to store a pointer to Current into the
			-- underlying gobject.
		"eiffel-wrapper"

	eiffel_archetype_key: G_QUARK is
			-- The quark used to store and retrieve the archetype Eiffel 
			-- wrapper associated to each GType
		once
			create Result.from_string (eiffel_key_label)
		end

	eiffel_archetype_key_label: STRING is
			-- The key used to store and retrieve the archetype Eiffel 
			-- wrapper associated to each GType
		"eiffel-wrapper-archetype"
end
