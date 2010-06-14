-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKBOX_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_box_set_child_packing (a_box: POINTER; a_child: POINTER; an_expand: INTEGER_32; a_fill: INTEGER_32; a_padding: NATURAL_32; a_pack_type: INTEGER) is
 		-- gtk_box_set_child_packing (node at line 3891)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_set_child_packing"
		}"
		end

	gtk_box_pack_end (a_box: POINTER; a_child: POINTER; an_expand: INTEGER_32; a_fill: INTEGER_32; a_padding: NATURAL_32) is
 		-- gtk_box_pack_end (node at line 7624)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_pack_end"
		}"
		end

	gtk_box_pack_end_defaults (a_box: POINTER; a_widget: POINTER) is
 		-- gtk_box_pack_end_defaults (node at line 10047)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_pack_end_defaults"
		}"
		end

	-- `hidden' function _gtk_box_set_spacing_set skipped.
	gtk_box_query_child_packing (a_box: POINTER; a_child: POINTER; an_expand: POINTER; a_fill: POINTER; a_padding: POINTER; a_pack_type: POINTER) is
 		-- gtk_box_query_child_packing (node at line 12564)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_query_child_packing"
		}"
		end

	-- `hidden' function _gtk_box_get_spacing_set skipped.
	-- `hidden' function _gtk_box_new skipped.
	gtk_box_set_homogeneous (a_box: POINTER; a_homogeneous: INTEGER_32) is
 		-- gtk_box_set_homogeneous (node at line 24671)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_set_homogeneous"
		}"
		end

	-- `hidden' function _gtk_box_set_old_defaults skipped.
	gtk_box_pack_start_defaults (a_box: POINTER; a_widget: POINTER) is
 		-- gtk_box_pack_start_defaults (node at line 26447)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_pack_start_defaults"
		}"
		end

	gtk_box_get_type: NATURAL_32 is
 		-- gtk_box_get_type (node at line 27662)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_get_type()"
		}"
		end

	gtk_box_reorder_child (a_box: POINTER; a_child: POINTER; a_position: INTEGER_32) is
 		-- gtk_box_reorder_child (node at line 29772)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_reorder_child"
		}"
		end

	gtk_box_pack_start (a_box: POINTER; a_child: POINTER; an_expand: INTEGER_32; a_fill: INTEGER_32; a_padding: NATURAL_32) is
 		-- gtk_box_pack_start (node at line 30943)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_pack_start"
		}"
		end

	gtk_box_set_spacing (a_box: POINTER; a_spacing: INTEGER_32) is
 		-- gtk_box_set_spacing (node at line 33406)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_set_spacing"
		}"
		end

	gtk_box_get_spacing (a_box: POINTER): INTEGER_32 is
 		-- gtk_box_get_spacing (node at line 34296)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_get_spacing"
		}"
		end

	gtk_box_get_homogeneous (a_box: POINTER): INTEGER_32 is
 		-- gtk_box_get_homogeneous (node at line 37134)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_get_homogeneous"
		}"
		end


end -- class GTKBOX_EXTERNALS
