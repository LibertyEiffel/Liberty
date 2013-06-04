class GI_PROPERTY_INFO
	-- A GObject Introspection metadata structure representing a property. A
	-- property belongs to either a GIObjectInfo or a GIInterfaceInfo.

inherit GI_BASE_INFO
insert GIPROPERTYINFO_EXTERNALS
creation {GI_INFO_FACTORY, WRAPPER} from_external_pointer
feature {ANY}
	flags: GPARAM_FLAGS_ENUM is
		-- The flags for this property info. See GParamFags for more information about possible flag values.
	do
		Result.set(g_property_info_get_flags(handle))
	end

	property_type: GI_TYPE_INFO is
		-- the type information for the property info.
	do
		create Result.from_external_pointer(g_property_info_get_type(handle))
	ensure Result/=Void
	end

	ownership_transfer: GITRANSFER_ENUM is
		-- The ownership transfer for this property. 
	do
		Result.set(g_property_info_get_ownership_transfer(handle))
	end
end -- GI_PROPERTY_INFO
