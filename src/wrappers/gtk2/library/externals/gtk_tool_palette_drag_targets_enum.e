-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_TOOL_PALETTE_DRAG_TARGETS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (gtk_tool_palette_drag_groups_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_gtk_tool_palette_drag_groups is
		do
			value := value.bit_or(gtk_tool_palette_drag_groups_low_level)
		end

	unset_gtk_tool_palette_drag_groups is
		do
			value := value.bit_xor(gtk_tool_palette_drag_groups_low_level)
		end

feature -- Queries
	is_gtk_tool_palette_drag_groups: BOOLEAN is
		do
			Result := (value=gtk_tool_palette_drag_groups_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_tool_palette_drag_groups_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_TOOL_PALETTE_DRAG_GROUPS"
 			}"
 		end


end -- class GTK_TOOL_PALETTE_DRAG_TARGETS_ENUM
