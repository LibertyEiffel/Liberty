-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKNOTEBOOKTAB_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_notebook_tab_first_low_level)  or else
				(a_value = gtk_notebook_tab_last_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_notebook_tab_first is
		do
			value := gtk_notebook_tab_first_low_level
		end

	set_gtk_notebook_tab_last is
		do
			value := gtk_notebook_tab_last_low_level
		end

feature {ANY} -- Queries
	is_gtk_notebook_tab_first: BOOLEAN is
		do
			Result := (value=gtk_notebook_tab_first_low_level)
		end

	is_gtk_notebook_tab_last: BOOLEAN is
		do
			Result := (value=gtk_notebook_tab_last_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_notebook_tab_first_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_NOTEBOOK_TAB_FIRST"
 			}"
 		end

	gtk_notebook_tab_last_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_NOTEBOOK_TAB_LAST"
 			}"
 		end


end -- class GTKNOTEBOOKTAB_ENUM
