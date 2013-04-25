-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_WINDOW_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = root_low_level)  or else
				(a_value = toplevel_low_level)  or else
				(a_value = child_low_level)  or else
				(a_value = dialog_low_level)  or else
				(a_value = temp_low_level)  or else
				(a_value = foreign_low_level)  or else
				(a_value = offscreen_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_root is
		do
			value := root_low_level
		end

	set_toplevel is
		do
			value := toplevel_low_level
		end

	set_child is
		do
			value := child_low_level
		end

	set_dialog is
		do
			value := dialog_low_level
		end

	set_temp is
		do
			value := temp_low_level
		end

	set_foreign is
		do
			value := foreign_low_level
		end

	set_offscreen is
		do
			value := offscreen_low_level
		end

feature {ANY} -- Queries
	root: BOOLEAN is
		do
			Result := (value=root_low_level)
		end

	toplevel: BOOLEAN is
		do
			Result := (value=toplevel_low_level)
		end

	child: BOOLEAN is
		do
			Result := (value=child_low_level)
		end

	dialog: BOOLEAN is
		do
			Result := (value=dialog_low_level)
		end

	temp: BOOLEAN is
		do
			Result := (value=temp_low_level)
		end

	foreign: BOOLEAN is
		do
			Result := (value=foreign_low_level)
		end

	offscreen: BOOLEAN is
		do
			Result := (value=offscreen_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	root_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_ROOT"
 			}"
 		end

	toplevel_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TOPLEVEL"
 			}"
 		end

	child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_CHILD"
 			}"
 		end

	dialog_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_DIALOG"
 			}"
 		end

	temp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TEMP"
 			}"
 		end

	foreign_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_FOREIGN"
 			}"
 		end

	offscreen_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_OFFSCREEN"
 			}"
 		end


end -- class GDK_WINDOW_TYPE_ENUM
