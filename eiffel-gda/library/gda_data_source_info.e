indexing
	description: "."
	copyright: "[
					Copyright (C) 2007 $EWLC_developer, $original_copyright_holder
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class GDA_DATA_SOURCE_INFO

inherit SHARED_C_STRUCT redefine copy, is_equal, fill_tagged_out_memory, free end

insert SHARED_G_ERROR

creation copy, dummy, from_external_pointer

feature
	copy (another: like Current) is
			--   Creates a new GdaDataSourceInfo structure from an existing one.
		do
			from_external_pointer(gda_data_source_info_copy(another.handle))
		end

	is_equal (another: like Current): BOOLEAN is
			-- Are Current and `another' equal?
		do		
			Result:=gda_data_source_info_equal(handle,another.handle).to_boolean
		end

	
	save is
			-- Saves Current a data source in the libgda configuration
			-- given a GdaDataSourceInfo structure containing all the
			-- information about the data source.

			-- `is_successful' is True if no error occurred
		do
			is_successful:=gda_config_save_data_source_info(handle).to_boolean
		end

feature -- Queries
	name: CONST_STRING is
			local ptr: POINTER
			do
				ptr := get_name(handle)
				if ptr.is_not_null then create Result.from_external(ptr) end
			end

	provider: CONST_STRING is
			local ptr: POINTER
			do
				ptr := get_provider(handle)
				if ptr.is_not_null then create Result.from_external(ptr) end
			end

	cnc_string: CONST_STRING is
			local ptr: POINTER
			do
				ptr := get_cnc_string(handle)
				if ptr.is_not_null then create Result.from_external(ptr) end
			end

	description: CONST_STRING is
			local ptr: POINTER
			do
				ptr := get_description(handle)
				if ptr.is_not_null then create Result.from_external(ptr) end
			end

	username: CONST_STRING is
			local ptr: POINTER
			do
				ptr := get_username(handle)
				if ptr.is_not_null then create Result.from_external(ptr) end
			end

	password: CONST_STRING is
			local ptr: POINTER
			do
				ptr := get_password(handle)
				if ptr.is_not_null then create Result.from_external(ptr) end
			end
			
	is_global: BOOLEAN is
		do
			Result:=get_is_global(handle).to_boolean
		end

	fill_tagged_out_memory is
		local a_name, a_provider, a_cnc_string, a_description, a_username, a_password: STRING
		do
			a_name := name
			if a_name /= Void then
				tagged_out_memory.append(once "name: `")
				tagged_out_memory.append(a_name)
				tagged_out_memory.append(once "',%N")
			end
			a_provider := provider
			if a_provider /= Void then
				tagged_out_memory.append(once "provider: `")
				tagged_out_memory.append(a_provider)
				tagged_out_memory.append(once "',%N")
			end
			a_cnc_string := cnc_string
			if a_cnc_string /= Void then
				tagged_out_memory.append(once "cnc_string: `")
				tagged_out_memory.append(a_cnc_string)
				tagged_out_memory.append(once "',%N")
			end
			a_description := description
			if a_description /= Void then
				tagged_out_memory.append(once "description: `")
				tagged_out_memory.append(a_description)
				tagged_out_memory.append(once "',%N")
			end
			a_username := username
			if a_username /= Void then
				tagged_out_memory.append(once "username: `")
				tagged_out_memory.append(a_username)
				tagged_out_memory.append(once "',%N")
			end
			a_password := password
			if a_password /= Void then
				tagged_out_memory.append(once "password: `")
				tagged_out_memory.append(a_password)
				tagged_out_memory.append(once "',%N")
			end
			tagged_out_memory.append(once "is_global: "); is_global.append_in(tagged_out_memory)
		end

feature {} -- External calls
	gda_data_source_info_copy (a_source:POINTER): POINTER is
			-- GdaDataSourceInfo* gda_data_source_info_copy
			-- (GdaDataSourceInfo *src);
		external "C use <libgda/libgda.h>"
		end

	gda_data_source_info_equal (an_info1, an_info2: POINTER): INTEGER is
			-- gboolean gda_data_source_info_equal (GdaDataSourceInfo
			-- *info1, GdaDataSourceInfo *info2);
		external "C use <libgda/libgda.h>"
		end

	free (a_info: POINTER) is
			-- void gda_data_source_info_free (GdaDataSourceInfo *info);
		external "C use <libgda/libgda.h>"
		alias "gda_data_source_info_free"
		end

	gda_config_save_data_source_info (an_info: POINTER): INTEGER is
			-- gboolean gda_config_save_data_source_info
			-- (GdaDataSourceInfo *dsn_info);
		external "C use <libgda/libgda.h>"
		end

feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaDataSourceInfo)"
		end

feature {} -- Structure access
	-- typedef struct {
	--         gchar    *name;
	--         gchar    *provider;
	--         gchar    *cnc_string;
	--         gchar    *description;
	--         gchar    *username;
	--         gchar    *password;
	--         gboolean  is_global;
	-- } GdaDataSourceInfo;
	get_name (a_struct: POINTER): POINTER is
		external "C struct GdaDataSourceInfo get name use <libgda/libgda.h>"
		end
	get_provider (a_struct: POINTER): POINTER is
		external "C struct GdaDataSourceInfo get provider use <libgda/libgda.h>"
		end
	get_cnc_string (a_struct: POINTER): POINTER is
		external "C struct GdaDataSourceInfo get cnc_string use <libgda/libgda.h>"
		end
	get_description (a_struct: POINTER): POINTER is
		external "C struct GdaDataSourceInfo get description use <libgda/libgda.h>"
		end
	get_username (a_struct: POINTER): POINTER is
		external "C struct GdaDataSourceInfo get username use <libgda/libgda.h>"
		end
	get_password (a_struct: POINTER): POINTER is
		external "C struct GdaDataSourceInfo get password use <libgda/libgda.h>"
		end
	get_is_global (a_struct: POINTER): INTEGER is
		external "C struct GdaDataSourceInfo get is_global use <libgda/libgda.h>"
		end
end -- class GDA_DATA_SOURCE_INFO
