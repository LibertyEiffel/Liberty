-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKPANGOATTREMBOSSED_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkpangoattrembossed_struct_set_embossed (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for embossed field of GDKPANGOATTREMBOSSED_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpangoattrembossed_struct_set_embossed"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field attr.
	gdkpangoattrembossed_struct_get_embossed (a_structure: POINTER): INTEGER_32 is
			-- Query for embossed field of GDKPANGOATTREMBOSSED_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpangoattrembossed_struct_get_embossed"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkPangoAttrEmbossed"
		}"
		end

end -- class GDKPANGOATTREMBOSSED_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

