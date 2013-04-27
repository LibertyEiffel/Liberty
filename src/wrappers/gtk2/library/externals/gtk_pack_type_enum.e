-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_PACK_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_pack_end_low_level)  or else
				(a_value = gtk_pack_start_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_pack_end is
		do
			value := gtk_pack_end_low_level
		end

	set_gtk_pack_start is
		do
			value := gtk_pack_start_low_level
		end

feature -- Queries
	is_gtk_pack_end: BOOLEAN is
		do
			Result := (value=gtk_pack_end_low_level)
		end

	is_gtk_pack_start: BOOLEAN is
		do
			Result := (value=gtk_pack_start_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_pack_end_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PACK_END"
 			}"
 		end

	gtk_pack_start_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PACK_START"
 			}"
 		end


end -- class GTK_PACK_TYPE_ENUM
