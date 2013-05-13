class GI_VALUE_INFO

inherit
	WRAPPER 
	REFERENCE_COUNTED

insert 
	GIBASEINFO_EXTERNALS

creation from_external_pointer

feature 
	value: INTEGER_64 is
   		-- the enumeration value. This will always be representable as a 32-bit signed or unsigned value. 64 bits are used to allow both.
		do
			Result := g_value_info_get_value(handle)
		end

	ref is
		do
			g_base_info_ref(handle)
		end

	unref is
		do
			g_base_info_unref(handle)
		end
end
