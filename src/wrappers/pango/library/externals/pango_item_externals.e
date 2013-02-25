-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_ITEM_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	pango_item_copy (an_item: POINTER): POINTER is
 		-- pango_item_copy (node at line 1204)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_item_copy"
		}"
		end

	pango_item_get_type: NATURAL_64 is
 		-- pango_item_get_type (node at line 2543)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_item_get_type()"
		}"
		end

	pango_item_new: POINTER is
 		-- pango_item_new (node at line 2652)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_item_new()"
		}"
		end

	pango_item_split (an_orig: POINTER; a_split_index: INTEGER_32; a_split_offset: INTEGER_32): POINTER is
 		-- pango_item_split (node at line 4261)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_item_split"
		}"
		end

	pango_item_free (an_item: POINTER) is
 		-- pango_item_free (node at line 6417)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_item_free"
		}"
		end


end -- class PANGO_ITEM_EXTERNALS
