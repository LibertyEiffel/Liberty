-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class G_MEM_VTABLE_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters

	gmemvtable_struct_set_malloc (a_structure: POINTER; a_value: POINTER) is
			-- Setter for malloc field of GMemVTable structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gmemvtable_struct_set_malloc"
		}"
		end

	gmemvtable_struct_set_realloc (a_structure: POINTER; a_value: POINTER) is
			-- Setter for realloc field of GMemVTable structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gmemvtable_struct_set_realloc"
		}"
		end

	gmemvtable_struct_set_free (a_structure: POINTER; a_value: POINTER) is
			-- Setter for free field of GMemVTable structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gmemvtable_struct_set_free"
		}"
		end

	gmemvtable_struct_set_calloc (a_structure: POINTER; a_value: POINTER) is
			-- Setter for calloc field of GMemVTable structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gmemvtable_struct_set_calloc"
		}"
		end

	gmemvtable_struct_set_try_malloc (a_structure: POINTER; a_value: POINTER) is
			-- Setter for try_malloc field of GMemVTable structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gmemvtable_struct_set_try_malloc"
		}"
		end

	gmemvtable_struct_set_try_realloc (a_structure: POINTER; a_value: POINTER) is
			-- Setter for try_realloc field of GMemVTable structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gmemvtable_struct_set_try_realloc"
		}"
		end

feature {} -- Low-level queries

	gmemvtable_struct_get_malloc (a_structure: POINTER): POINTER is
			-- Query for malloc field of GMemVTable structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gmemvtable_struct_get_malloc"
		}"
		end

	gmemvtable_struct_get_realloc (a_structure: POINTER): POINTER is
			-- Query for realloc field of GMemVTable structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gmemvtable_struct_get_realloc"
		}"
		end

	gmemvtable_struct_get_free (a_structure: POINTER): POINTER is
			-- Query for free field of GMemVTable structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gmemvtable_struct_get_free"
		}"
		end

	gmemvtable_struct_get_calloc (a_structure: POINTER): POINTER is
			-- Query for calloc field of GMemVTable structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gmemvtable_struct_get_calloc"
		}"
		end

	gmemvtable_struct_get_try_malloc (a_structure: POINTER): POINTER is
			-- Query for try_malloc field of GMemVTable structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gmemvtable_struct_get_try_malloc"
		}"
		end

	gmemvtable_struct_get_try_realloc (a_structure: POINTER): POINTER is
			-- Query for try_realloc field of GMemVTable structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gmemvtable_struct_get_try_realloc"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "sizeof_GMemVTable"
		}"
		end

end
