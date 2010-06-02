-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSTATIC_REC_MUTEX_STRUCT

inherit ANY undefine is_equal, copy end

insert GLIB_TYPES
feature {} -- Low-level setters

	gstatic_rec_mutex_struct_set_depth (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for depth field of GSTATIC_REC_MUTEX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gstatic_rec_mutex_struct_set_depth"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field mutex.
	gstatic_rec_mutex_struct_get_depth (a_structure: POINTER): NATURAL_32 is
			-- Query for depth field of GSTATIC_REC_MUTEX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gstatic_rec_mutex_struct_get_depth"
		}"
		end

	-- Unwrappable field owner.
feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GStaticRecMutex"
		}"
		end

end -- class GSTATIC_REC_MUTEX_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

