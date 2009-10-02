-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class G_STATIC_RWLOCK_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters

	gstaticrwlock_struct_set_read_cond (a_structure: POINTER; a_value: POINTER) is
			-- Setter for read_cond field of GStaticRWLock structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gstaticrwlock_struct_set_read_cond"
		}"
		end

	gstaticrwlock_struct_set_write_cond (a_structure: POINTER; a_value: POINTER) is
			-- Setter for write_cond field of GStaticRWLock structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gstaticrwlock_struct_set_write_cond"
		}"
		end

	gstaticrwlock_struct_set_read_counter (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for read_counter field of GStaticRWLock structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gstaticrwlock_struct_set_read_counter"
		}"
		end

	gstaticrwlock_struct_set_have_writer (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for have_writer field of GStaticRWLock structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gstaticrwlock_struct_set_have_writer"
		}"
		end

	gstaticrwlock_struct_set_want_to_read (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for want_to_read field of GStaticRWLock structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gstaticrwlock_struct_set_want_to_read"
		}"
		end

	gstaticrwlock_struct_set_want_to_write (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for want_to_write field of GStaticRWLock structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gstaticrwlock_struct_set_want_to_write"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field mutex: C structure passed by value and not by reference (using a pointer) should be wrapped with an expanded external type. Eiffel-gcc-xml currently don't support it.
	gstaticrwlock_struct_get_read_cond (a_structure: POINTER): POINTER is
			-- Query for read_cond field of GStaticRWLock structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gstaticrwlock_struct_get_read_cond"
		}"
		end

	gstaticrwlock_struct_get_write_cond (a_structure: POINTER): POINTER is
			-- Query for write_cond field of GStaticRWLock structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gstaticrwlock_struct_get_write_cond"
		}"
		end

	gstaticrwlock_struct_get_read_counter (a_structure: POINTER): NATURAL_32 is
			-- Query for read_counter field of GStaticRWLock structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gstaticrwlock_struct_get_read_counter"
		}"
		end

	gstaticrwlock_struct_get_have_writer (a_structure: POINTER): INTEGER_32 is
			-- Query for have_writer field of GStaticRWLock structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gstaticrwlock_struct_get_have_writer"
		}"
		end

	gstaticrwlock_struct_get_want_to_read (a_structure: POINTER): NATURAL_32 is
			-- Query for want_to_read field of GStaticRWLock structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gstaticrwlock_struct_get_want_to_read"
		}"
		end

	gstaticrwlock_struct_get_want_to_write (a_structure: POINTER): NATURAL_32 is
			-- Query for want_to_write field of GStaticRWLock structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gstaticrwlock_struct_get_want_to_write"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "sizeof_GStaticRWLock"
		}"
		end

end
