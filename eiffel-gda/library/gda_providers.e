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

			-- This specific implementation is needed because providers
			-- list returned by gda with gda_config_get_provider_list
			-- needs to be specially handled when you free them.

class GDA_PROVIDERS
	-- WARNING: this G_LIST should not be modified 
	
	-- TODO: the "read-only" behaviour is still to be
	-- implemented. AFAIK it is not as easy as adding a "modifiable:
	-- BOOLEAN" feature and some "require modifiable" in the in-place
	-- changing features, because this would mean strenghtening the
	-- preconditions of those features when we will make G_LIST an heir
	-- of COLLECTION. Strenghtening preconditions is always wrong,
	-- AFAIK.

inherit G_LIST [GDA_PROVIDER_INFO] redefine free end 
insert GDA_CONFIG_EXTERNALS
creation dummy, from_external_pointer
feature {} -- Freeing
	free (ptr: POINTER) is
		do
			gda_config_free_provider_list(ptr)
		end
end -- class GDA_PROVIDERS
