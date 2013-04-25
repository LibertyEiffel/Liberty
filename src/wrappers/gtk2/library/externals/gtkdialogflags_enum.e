-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKDIALOGFLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (gtk_dialog_destroy_with_parent_low_level | 
				gtk_dialog_no_separator_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_dialog_destroy_with_parent is
		do
			value := value.bit_or(gtk_dialog_destroy_with_parent_low_level)
		end

	unset_gtk_dialog_destroy_with_parent is
		do
			value := value.bit_xor(gtk_dialog_destroy_with_parent_low_level)
		end

	set_gtk_dialog_no_separator is
		do
			value := value.bit_or(gtk_dialog_no_separator_low_level)
		end

	unset_gtk_dialog_no_separator is
		do
			value := value.bit_xor(gtk_dialog_no_separator_low_level)
		end

feature {ANY} -- Queries
	is_gtk_dialog_destroy_with_parent: BOOLEAN is
		do
			Result := (value=gtk_dialog_destroy_with_parent_low_level)
		end

	is_gtk_dialog_no_separator: BOOLEAN is
		do
			Result := (value=gtk_dialog_no_separator_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_dialog_destroy_with_parent_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DIALOG_DESTROY_WITH_PARENT"
 			}"
 		end

	gtk_dialog_no_separator_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DIALOG_NO_SEPARATOR"
 			}"
 		end


end -- class GTKDIALOGFLAGS_ENUM
