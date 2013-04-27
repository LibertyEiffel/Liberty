-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKBOX_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_box_get_homogeneous (a_box: POINTER): INTEGER is
 		-- gtk_box_get_homogeneous
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_get_homogeneous"
		}"
		end

	gtk_box_get_spacing (a_box: POINTER): INTEGER is
 		-- gtk_box_get_spacing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_get_spacing"
		}"
		end

	-- `hidden' function _gtk_box_get_spacing_set skipped.
	gtk_box_get_type: like long_unsigned is
 		-- gtk_box_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_get_type()"
		}"
		end

	-- `hidden' function _gtk_box_new skipped.
	gtk_box_pack_end (a_box: POINTER; a_child: POINTER; an_expand: INTEGER; a_fill: INTEGER; a_padding: NATURAL) is
 		-- gtk_box_pack_end
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_pack_end"
		}"
		end

	gtk_box_pack_start (a_box: POINTER; a_child: POINTER; an_expand: INTEGER; a_fill: INTEGER; a_padding: NATURAL) is
 		-- gtk_box_pack_start
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_pack_start"
		}"
		end

	gtk_box_query_child_packing (a_box: POINTER; a_child: POINTER; an_expand: POINTER; a_fill: POINTER; a_padding: POINTER; a_pack_type: POINTER) is
 		-- gtk_box_query_child_packing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_query_child_packing"
		}"
		end

	gtk_box_reorder_child (a_box: POINTER; a_child: POINTER; a_position: INTEGER) is
 		-- gtk_box_reorder_child
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_reorder_child"
		}"
		end

	gtk_box_set_child_packing (a_box: POINTER; a_child: POINTER; an_expand: INTEGER; a_fill: INTEGER; a_padding: NATURAL; a_pack_type: INTEGER) is
 		-- gtk_box_set_child_packing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_set_child_packing"
		}"
		end

	gtk_box_set_homogeneous (a_box: POINTER; a_homogeneous: INTEGER) is
 		-- gtk_box_set_homogeneous
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_set_homogeneous"
		}"
		end

	-- `hidden' function _gtk_box_set_old_defaults skipped.
	gtk_box_set_spacing (a_box: POINTER; a_spacing: INTEGER) is
 		-- gtk_box_set_spacing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_set_spacing"
		}"
		end

	-- `hidden' function _gtk_box_set_spacing_set skipped.

end -- class GTKBOX_EXTERNALS
