-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSTATIC_RWLOCK_STRUCT

inherit ANY undefine is_equal, copy end

insert GLIB_TYPES
feature {} -- Low-level setters

	gstatic_rwlock_struct_set_read_cond (a_structure: POINTER; a_value: POINTER) is
			-- Setter for read_cond field of GSTATIC_RWLOCK_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gstatic_rwlock_struct_set_read_cond"
		}"
		end

	gstatic_rwlock_struct_set_write_cond (a_structure: POINTER; a_value: POINTER) is
			-- Setter for write_cond field of GSTATIC_RWLOCK_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gstatic_rwlock_struct_set_write_cond"
		}"
		end

	gstatic_rwlock_struct_set_read_counter (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for read_counter field of GSTATIC_RWLOCK_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gstatic_rwlock_struct_set_read_counter"
		}"
		end

	gstatic_rwlock_struct_set_have_writer (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for have_writer field of GSTATIC_RWLOCK_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gstatic_rwlock_struct_set_have_writer"
		}"
		end

	gstatic_rwlock_struct_set_want_to_read (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for want_to_read field of GSTATIC_RWLOCK_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gstatic_rwlock_struct_set_want_to_read"
		}"
		end

	gstatic_rwlock_struct_set_want_to_write (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for want_to_write field of GSTATIC_RWLOCK_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gstatic_rwlock_struct_set_want_to_write"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field mutex.
	gstatic_rwlock_struct_get_read_cond (a_structure: POINTER): POINTER is
			-- Query for read_cond field of GSTATIC_RWLOCK_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gstatic_rwlock_struct_get_read_cond"
		}"
		end

	gstatic_rwlock_struct_get_write_cond (a_structure: POINTER): POINTER is
			-- Query for write_cond field of GSTATIC_RWLOCK_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gstatic_rwlock_struct_get_write_cond"
		}"
		end

	gstatic_rwlock_struct_get_read_counter (a_structure: POINTER): NATURAL_32 is
			-- Query for read_counter field of GSTATIC_RWLOCK_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gstatic_rwlock_struct_get_read_counter"
		}"
		end

	gstatic_rwlock_struct_get_have_writer (a_structure: POINTER): INTEGER_32 is
			-- Query for have_writer field of GSTATIC_RWLOCK_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gstatic_rwlock_struct_get_have_writer"
		}"
		end

	gstatic_rwlock_struct_get_want_to_read (a_structure: POINTER): NATURAL_32 is
			-- Query for want_to_read field of GSTATIC_RWLOCK_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gstatic_rwlock_struct_get_want_to_read"
		}"
		end

	gstatic_rwlock_struct_get_want_to_write (a_structure: POINTER): NATURAL_32 is
			-- Query for want_to_write field of GSTATIC_RWLOCK_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gstatic_rwlock_struct_get_want_to_write"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GStaticRWLock"
		}"
		end

end -- class GSTATIC_RWLOCK_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

