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

class GDA_DATA_SOURCE_INFO_LIST

inherit
	G_LIST [GDA_DATA_SOURCE_INFO]
		redefine
			dispose
		end
	
insert
	GDA_CONFIG_EXTERNALS 

creation from_external_pointer

feature
	dispose is
			-- Frees a list of GdaDataSourceInfo structures.
		do
			if not is_shared then
				gda_config_free_data_source_list(handle)
			end
			handle:= default_pointer
		end
end -- class GDA_DATA_SOURCE_INFO_LIST
	
