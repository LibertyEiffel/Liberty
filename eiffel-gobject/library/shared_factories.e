indexing
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli
					
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

deferred class SHARED_FACTORIES
	-- Various shared factories used in the eiffel-gobject cluster

feature {} -- Factories and archetypes
	g_param_spec_factory: ARCHETYPE_CACHING_FACTORY [G_PARAM_SPEC] is
		once
			create Result.with_archetype(g_param_spec_archetype)
		end
	
	g_param_spec_archetype: G_PARAM_SPEC is
		once 
			create Result.dummy
		end
	
end -- class  SHARED_FACTORIES
