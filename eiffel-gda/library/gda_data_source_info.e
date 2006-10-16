indexing
	description: "."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class GDA_DATA_SOURCE_INFO

inherit SHARED_C_STRUCT redefine	dispose end
	
insert
	GDA_DATA_SOURCE_INFO_STRUCT
	GDA_CONFIG_EXTERNALS
	
creation make, copy, from_external_pointer

feature 
	copy (another: like Current) is
			-- Creates a new GdaDataSourceInfo structure from an existing one.
		do
			from_external_pointer(gda_data_source_info_copy(another.handle))
		end

	is_equal (another: like Current): BOOLEAN is
			-- Are Current and `another' equal?
		do
			Result:=(gda_data_source_info_equal
						(handle, another.handle)).to_boolean
		end

	dispose is
			-- Deallocates all memory associated to the given GdaDataSourceInfo.
		do
			if not is_shared and is_not_null then
				gda_data_source_info_free (handle)
			end
			handle := default_pointer
		end

feature  -- Getters
	name: STRING is
		local cstr:POINTER
		do
			cstr := get_name(handle)
			if cstr.is_not_null then
				create {CONST_STRING} Result.from_external(cstr)
			end
		end
	
	provider: STRING is
		local cstr:POINTER
		do
			cstr := get_provider(handle)
			if cstr.is_not_null then
				create {CONST_STRING} Result.from_external(cstr)
			end
		end
	
	connection_string: STRING is
		local cstr:POINTER
		do
			cstr := get_cnc_string(handle)
			if cstr.is_not_null then
				create {CONST_STRING} Result.from_external(cstr)
			end
		end
	
	description: STRING is
		local cstr:POINTER
		do
			cstr := get_description(handle)
			if cstr.is_not_null then
				create {CONST_STRING} Result.from_external(cstr)
			end
		end
	
	username: STRING is
		local cstr:POINTER
		do
			cstr := get_username(handle)
			if cstr.is_not_null then
				create {CONST_STRING} Result.from_external(cstr)
			end
		end
	
	password: STRING is
		local cstr:POINTER
		do
			cstr := get_password(handle)
			if cstr.is_not_null then
				create {CONST_STRING} Result.from_external(cstr)
			end
		end
	
	is_global: BOOLEAN is
		do
			Result:=get_is_global(handle).to_boolean
		end
	
feature -- Setters
	set_name (a_name: STRING) is
		require name_not_void: a_name /= Void
		do
			set_name_external (handle, a_name.to_external)
		end

	set_provider (a_provider: STRING) is
		require provider_not_void: a_provider /= Void
		do
			set_provider_external (handle, a_provider.to_external)
		end
	
	set_connection_string (a_cnc_string: STRING) is
		require cnc_string_not_void: a_cnc_string /= Void
		do
			set_cnc_string_external (handle, a_cnc_string.to_external)
		end
	
	set_description (a_description: STRING) is
		require description_not_void: a_description /= Void
		do
			set_description_external (handle, a_description.to_external)
		end
	
	set_username (a_username: STRING) is
		require username_not_void: a_username /= Void
		do
			set_username_external (handle, a_username.to_external)
		end

	set_password (a_password: STRING) is
		require password_not_void: a_password /= Void
		do
			set_password_external (handle, a_password.to_external)
		end
	
	set_global is
		do
			set_is_global_external (handle,1)
		end

	unset_global is
		do
			set_is_global_external (handle,0)
		end

end -- class GDA_DATA_SOURCE_INFO
