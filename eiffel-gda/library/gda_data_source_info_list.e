indexing
	description: "."
	copyright: "[
					Copyright (C) 2006, 2007 Paolo Redaelli, GDA team
					
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

inherit G_LIST[GDA_DATA_SOURCE_INFO] redefine free, from_external_pointer end
	
insert GDA_CONFIG_EXTERNALS 

creation dummy, from_external_pointer

feature
	from_external_pointer (a_pointer: POINTER) is
		do
			create {DUMMY_CACHING_FACTORY[GDA_DATA_SOURCE_INFO]} factory
			handle := a_pointer
			set_shared
			petrify
		end

	free (ptr: POINTER) is
			-- Frees a list of GdaDataSourceInfo structures.
		do
			gda_config_free_data_source_list(handle)
		end

end -- class GDA_DATA_SOURCE_INFO_LIST

