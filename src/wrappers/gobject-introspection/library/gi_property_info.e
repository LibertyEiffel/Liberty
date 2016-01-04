class GI_PROPERTY_INFO
	-- A GObject Introspection metadata structure representing a property. A
	-- property belongs to either a GIObjectInfo or a GIInterfaceInfo.

inherit GI_BASE_INFO
insert GIPROPERTYINFO_EXTERNALS
create {GI_INFO_FACTORY, WRAPPER} from_external_pointer
feature {ANY}
	flags: GPARAM_FLAGS_ENUM
		-- The flags for this property info. See GParamFags for more information about possible flag values.
	do
		Result.set(g_property_info_get_flags(handle))
	end

	property_type: GI_TYPE_INFO
		-- the type information for the property info.
	do
		create Result.from_external_pointer(g_property_info_get_type(handle))
	ensure Result/=Void
	end

	ownership_transfer: GITRANSFER_ENUM
		-- The ownership transfer for this property. 
	do
		Result.set(g_property_info_get_ownership_transfer(handle))
	end
end -- GI_PROPERTY_INFO

-- Copyright (C) 2013-2016: Paolo Redaelli <paolo.redaelli@gmail.com>
-- 
-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public License
-- as published by the Free Software Foundation; either version 2.1 of
-- the License, or (at your option) any later version.
-- 
-- This library is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
-- 
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-- 02110-1301 USA
	
