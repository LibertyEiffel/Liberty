-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKRCFLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (gtk_rc_base_low_level | 
				gtk_rc_fg_low_level | 
				gtk_rc_text_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_rc_base is
		do
			value := value.bit_or(gtk_rc_base_low_level)
		end

	unset_gtk_rc_base is
		do
			value := value.bit_xor(gtk_rc_base_low_level)
		end

	set_gtk_rc_fg is
		do
			value := value.bit_or(gtk_rc_fg_low_level)
		end

	unset_gtk_rc_fg is
		do
			value := value.bit_xor(gtk_rc_fg_low_level)
		end

	set_gtk_rc_text is
		do
			value := value.bit_or(gtk_rc_text_low_level)
		end

	unset_gtk_rc_text is
		do
			value := value.bit_xor(gtk_rc_text_low_level)
		end

feature {ANY} -- Queries
	is_gtk_rc_base: BOOLEAN is
		do
			Result := (value=gtk_rc_base_low_level)
		end

	is_gtk_rc_fg: BOOLEAN is
		do
			Result := (value=gtk_rc_fg_low_level)
		end

	is_gtk_rc_text: BOOLEAN is
		do
			Result := (value=gtk_rc_text_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_rc_base_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_RC_BASE"
 			}"
 		end

	gtk_rc_fg_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_RC_FG"
 			}"
 		end

	gtk_rc_text_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_RC_TEXT"
 			}"
 		end


end -- class GTKRCFLAGS_ENUM
