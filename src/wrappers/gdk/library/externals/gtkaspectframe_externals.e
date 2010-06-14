-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKASPECTFRAME_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_aspect_frame_new (a_label: POINTER; a_xalign: REAL_32; a_yalign: REAL_32; a_ratio: REAL_32; an_obey_child: INTEGER_32): POINTER is
 		-- gtk_aspect_frame_new (node at line 6136)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_aspect_frame_new"
		}"
		end

	gtk_aspect_frame_get_type: NATURAL_32 is
 		-- gtk_aspect_frame_get_type (node at line 9389)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_aspect_frame_get_type()"
		}"
		end

	gtk_aspect_frame_set (an_aspect_frame: POINTER; a_xalign: REAL_32; a_yalign: REAL_32; a_ratio: REAL_32; an_obey_child: INTEGER_32) is
 		-- gtk_aspect_frame_set (node at line 30932)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_aspect_frame_set"
		}"
		end


end -- class GTKASPECTFRAME_EXTERNALS
