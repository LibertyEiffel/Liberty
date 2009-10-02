-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class G_STATIC_REC_MUTEX_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters

	gstaticrecmutex_struct_set_depth (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for depth field of GStaticRecMutex structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gstaticrecmutex_struct_set_depth"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field mutex: C structure passed by value and not by reference (using a pointer) should be wrapped with an expanded external type. Eiffel-gcc-xml currently don't support it.
	gstaticrecmutex_struct_get_depth (a_structure: POINTER): NATURAL_32 is
			-- Query for depth field of GStaticRecMutex structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gstaticrecmutex_struct_get_depth"
		}"
		end

	-- Unwrappable field owner: Unhnalded union type
feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "sizeof_GStaticRecMutex"
		}"
		end

end
