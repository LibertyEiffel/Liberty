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

inherit SHARED_C_STRUCT

insert SHARED_G_ERROR

creation copy, from_external_pointer

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

	gda_config_save_data_source_info (an_info: POINTER) is
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
	--  GdaDataSourceInfo
	--
	-- typedef struct {
	--         gchar    *name;
	--         gchar    *provider;
	--         gchar    *cnc_string;
	--         gchar    *description;
	--         gchar    *username;
	--         gchar    *password;
	--         gboolean  is_global;
	-- } GdaDataSourceInfo;

end -- class GDA_DATA_SOURCE_INFO
