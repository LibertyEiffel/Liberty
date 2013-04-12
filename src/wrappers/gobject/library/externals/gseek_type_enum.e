-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSEEK_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_seek_cur_low_level)  or else
				(a_value = g_seek_end_low_level)  or else
				(a_value = g_seek_set_low_level) )
		end

feature -- Setters
	default_create,
	set_g_seek_cur is
		do
			value := g_seek_cur_low_level
		end

	set_g_seek_end is
		do
			value := g_seek_end_low_level
		end

	set_g_seek_set is
		do
			value := g_seek_set_low_level
		end

feature -- Queries
	is_g_seek_cur: BOOLEAN is
		do
			Result := (value=g_seek_cur_low_level)
		end

	is_g_seek_end: BOOLEAN is
		do
			Result := (value=g_seek_end_low_level)
		end

	is_g_seek_set: BOOLEAN is
		do
			Result := (value=g_seek_set_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_seek_cur_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SEEK_CUR"
 			}"
 		end

	g_seek_end_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SEEK_END"
 			}"
 		end

	g_seek_set_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SEEK_SET"
 			}"
 		end


end -- class GSEEK_TYPE_ENUM
