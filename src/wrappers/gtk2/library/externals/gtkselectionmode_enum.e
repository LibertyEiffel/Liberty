-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKSELECTIONMODE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_selection_browse_low_level)  or else
				(a_value = gtk_selection_extended_low_level)  or else
				(a_value = gtk_selection_multiple_low_level)  or else
				(a_value = gtk_selection_none_low_level)  or else
				(a_value = gtk_selection_single_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_selection_browse is
		do
			value := gtk_selection_browse_low_level
		end

	set_gtk_selection_extended is
		do
			value := gtk_selection_extended_low_level
		end

	set_gtk_selection_multiple is
		do
			value := gtk_selection_multiple_low_level
		end

	set_gtk_selection_none is
		do
			value := gtk_selection_none_low_level
		end

	set_gtk_selection_single is
		do
			value := gtk_selection_single_low_level
		end

feature {ANY} -- Queries
	is_gtk_selection_browse: BOOLEAN is
		do
			Result := (value=gtk_selection_browse_low_level)
		end

	is_gtk_selection_extended: BOOLEAN is
		do
			Result := (value=gtk_selection_extended_low_level)
		end

	is_gtk_selection_multiple: BOOLEAN is
		do
			Result := (value=gtk_selection_multiple_low_level)
		end

	is_gtk_selection_none: BOOLEAN is
		do
			Result := (value=gtk_selection_none_low_level)
		end

	is_gtk_selection_single: BOOLEAN is
		do
			Result := (value=gtk_selection_single_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_selection_browse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SELECTION_BROWSE"
 			}"
 		end

	gtk_selection_extended_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SELECTION_EXTENDED"
 			}"
 		end

	gtk_selection_multiple_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SELECTION_MULTIPLE"
 			}"
 		end

	gtk_selection_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SELECTION_NONE"
 			}"
 		end

	gtk_selection_single_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SELECTION_SINGLE"
 			}"
 		end


end -- class GTKSELECTIONMODE_ENUM
