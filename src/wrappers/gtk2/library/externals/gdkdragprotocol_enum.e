-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDKDRAGPROTOCOL_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_drag_proto_local_low_level)  or else
				(a_value = gdk_drag_proto_motif_low_level)  or else
				(a_value = gdk_drag_proto_none_low_level)  or else
				(a_value = gdk_drag_proto_ole2_low_level)  or else
				(a_value = gdk_drag_proto_rootwin_low_level)  or else
				(a_value = gdk_drag_proto_win32_dropfiles_low_level)  or else
				(a_value = gdk_drag_proto_xdnd_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gdk_drag_proto_local is
		do
			value := gdk_drag_proto_local_low_level
		end

	set_gdk_drag_proto_motif is
		do
			value := gdk_drag_proto_motif_low_level
		end

	set_gdk_drag_proto_none is
		do
			value := gdk_drag_proto_none_low_level
		end

	set_gdk_drag_proto_ole2 is
		do
			value := gdk_drag_proto_ole2_low_level
		end

	set_gdk_drag_proto_rootwin is
		do
			value := gdk_drag_proto_rootwin_low_level
		end

	set_gdk_drag_proto_win32_dropfiles is
		do
			value := gdk_drag_proto_win32_dropfiles_low_level
		end

	set_gdk_drag_proto_xdnd is
		do
			value := gdk_drag_proto_xdnd_low_level
		end

feature {ANY} -- Queries
	is_gdk_drag_proto_local: BOOLEAN is
		do
			Result := (value=gdk_drag_proto_local_low_level)
		end

	is_gdk_drag_proto_motif: BOOLEAN is
		do
			Result := (value=gdk_drag_proto_motif_low_level)
		end

	is_gdk_drag_proto_none: BOOLEAN is
		do
			Result := (value=gdk_drag_proto_none_low_level)
		end

	is_gdk_drag_proto_ole2: BOOLEAN is
		do
			Result := (value=gdk_drag_proto_ole2_low_level)
		end

	is_gdk_drag_proto_rootwin: BOOLEAN is
		do
			Result := (value=gdk_drag_proto_rootwin_low_level)
		end

	is_gdk_drag_proto_win32_dropfiles: BOOLEAN is
		do
			Result := (value=gdk_drag_proto_win32_dropfiles_low_level)
		end

	is_gdk_drag_proto_xdnd: BOOLEAN is
		do
			Result := (value=gdk_drag_proto_xdnd_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_drag_proto_local_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DRAG_PROTO_LOCAL"
 			}"
 		end

	gdk_drag_proto_motif_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DRAG_PROTO_MOTIF"
 			}"
 		end

	gdk_drag_proto_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DRAG_PROTO_NONE"
 			}"
 		end

	gdk_drag_proto_ole2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DRAG_PROTO_OLE2"
 			}"
 		end

	gdk_drag_proto_rootwin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DRAG_PROTO_ROOTWIN"
 			}"
 		end

	gdk_drag_proto_win32_dropfiles_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DRAG_PROTO_WIN32_DROPFILES"
 			}"
 		end

	gdk_drag_proto_xdnd_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DRAG_PROTO_XDND"
 			}"
 		end


end -- class GDKDRAGPROTOCOL_ENUM
