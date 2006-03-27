class G_TYPE
inherit
	G_TYPE_EXTERNALS
feature
	-- Note: in libglib 2.9.1 "typedef gulong GType;" (Paolo
	-- 2006-01-07)

	is_g_type (a_type_number: INTEGER): BOOLEAN is
			-- Is `a_type_number' a valid value for a g_type? (i.e. a
			-- type number that can be used for g_value_init()?
		do
			Result := (g_type_is_value_type (a_type_number)).to_boolean
		end
	



		do
			
end
	
