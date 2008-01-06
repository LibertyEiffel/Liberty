indexing
	description: "A list of GDA_PROVIDER_INFO."
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

class GDA_PROVIDERS

inherit 
	G_LIST [GDA_PROVIDER_INFO] redefine from_external_pointer, free end 

insert 
	GDA
	GDA_CONFIG_EXTERNALS 

creation from_external_pointer

feature 	
	-- Note: This specific implementation is needed because providers
	-- list returned by gda with gda_config_get_provider_list needs to
	-- be specially handled when you free them.
	
	from_external_pointer (a_pointer: POINTER) is
		do
			factory := gda.gda_provider_info_factory
			handle := a_pointer
			set_shared
			petrify
		end

	free (ptr: POINTER) is
		do
			gda_config_free_provider_list(ptr)
		end

invariant is_petrified
end -- class GDA_PROVIDERS
