-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class G_SEEK_TYPE

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = g_seek_cur) or else 
				(a_value = g_seek_set) or else 
				(a_value = g_seek_end))
		end

feature -- Setters
	default_create,  set_g_seek_cur is
	
		do
			value := g_seek_cur
		end

	 set_g_seek_set is
	
		do
			value := g_seek_set
		end

	 set_g_seek_end is
	
		do
			value := g_seek_end
		end

feature -- Queries
	is_g_seek_cur: BOOLEAN is
		
		do
			Result := (value=g_seek_cur)
		end

	is_g_seek_set: BOOLEAN is
		
		do
			Result := (value=g_seek_set)
		end

	is_g_seek_end: BOOLEAN is
		
		do
			Result := (value=g_seek_end)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_seek_cur: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_SEEK_CUR"
 			}"
 		end

	g_seek_set: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_SEEK_SET"
 			}"
 		end

	g_seek_end: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_SEEK_END"
 			}"
 		end

end

