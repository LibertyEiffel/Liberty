-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_ATTACH_OPTIONS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (gtk_expand_low_level | 
				gtk_shrink_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_gtk_expand is
		do
			value := value.bit_or(gtk_expand_low_level)
		end

	unset_gtk_expand is
		do
			value := value.bit_xor(gtk_expand_low_level)
		end

	set_gtk_shrink is
		do
			value := value.bit_or(gtk_shrink_low_level)
		end

	unset_gtk_shrink is
		do
			value := value.bit_xor(gtk_shrink_low_level)
		end

feature -- Queries
	is_gtk_expand: BOOLEAN is
		do
			Result := (value=gtk_expand_low_level)
		end

	is_gtk_shrink: BOOLEAN is
		do
			Result := (value=gtk_shrink_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_expand_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_EXPAND"
 			}"
 		end

	gtk_shrink_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_SHRINK"
 			}"
 		end


end -- class GTK_ATTACH_OPTIONS_ENUM
