-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTEXTTAGTABLE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtktexttagtable_struct_set_hash (a_structure: POINTER; a_value: POINTER) is
			-- Setter for hash field of GTKTEXTTAGTABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktexttagtable_struct_set_hash"
		}"
		end

	gtktexttagtable_struct_set_anonymous (a_structure: POINTER; a_value: POINTER) is
			-- Setter for anonymous field of GTKTEXTTAGTABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktexttagtable_struct_set_anonymous"
		}"
		end

	gtktexttagtable_struct_set_anon_count (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for anon_count field of GTKTEXTTAGTABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktexttagtable_struct_set_anon_count"
		}"
		end

	gtktexttagtable_struct_set_buffers (a_structure: POINTER; a_value: POINTER) is
			-- Setter for buffers field of GTKTEXTTAGTABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktexttagtable_struct_set_buffers"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gtktexttagtable_struct_get_hash (a_structure: POINTER): POINTER is
			-- Query for hash field of GTKTEXTTAGTABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktexttagtable_struct_get_hash"
		}"
		end

	gtktexttagtable_struct_get_anonymous (a_structure: POINTER): POINTER is
			-- Query for anonymous field of GTKTEXTTAGTABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktexttagtable_struct_get_anonymous"
		}"
		end

	gtktexttagtable_struct_get_anon_count (a_structure: POINTER): INTEGER_32 is
			-- Query for anon_count field of GTKTEXTTAGTABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktexttagtable_struct_get_anon_count"
		}"
		end

	gtktexttagtable_struct_get_buffers (a_structure: POINTER): POINTER is
			-- Query for buffers field of GTKTEXTTAGTABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktexttagtable_struct_get_buffers"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkTextTagTable"
		}"
		end

end -- class GTKTEXTTAGTABLE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

