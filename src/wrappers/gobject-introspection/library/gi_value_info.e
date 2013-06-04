class GI_VALUE_INFO

inherit
	WRAPPER 
	REFERENCE_COUNTED
	ANY -- to get standard copy and is_equal features

insert 
	GIBASEINFO_EXTERNALS
	GIENUMINFO_EXTERNALS

creation {GI_INFO_FACTORY, WRAPPER} from_external_pointer

feature {ANY} 
	value: INTEGER_64 is
   		-- the enumeration value. This will always be representable as a 32-bit signed or unsigned value. 64 bits are used to allow both.
		do
			Result := g_value_info_get_value(handle)
		end

	ref is
		local p: POINTER
		do
			p:=g_base_info_ref(handle)
		end

	unref is
		do
			g_base_info_unref(handle)
		end
		
-- feature {ANY}
-- 	copy (another: like Current) is
-- 		do
-- 			handle:=another.handle
-- 		end
-- 
-- 	is_equal (another: like Current): BOOLEAN is
-- 		do
-- 			Result := handle = another.handle
-- 		end
-- 
end
