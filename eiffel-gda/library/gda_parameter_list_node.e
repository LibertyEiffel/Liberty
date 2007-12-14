indexing
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GDA developers
					
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

class GDA_PARAMETER_LIST_NODE

inherit SHARED_C_STRUCT

insert GDA_PARAMETER_LIST_NODE_STRUCT

creation from_external_pointer

feature -- Getter features 
	parameter: GDA_PARAMETER is
		do
			-- GdaParameter *param; /* Can't be NULL */
			if cached_parameter=Void 
			then create cached_parameter.from_external_pointer(get_param(handle))
			else check cached_parameter.handle=get_param(handle) end 
			end
			Result:=cached_parameter
		ensure not_void: Result/=Void
		end

	model: GDA_DATA_MODEL is
		local p: POINTER; factory: G_OBJECT_EXPANDED_FACTORY[GDA_DATA_MODEL]
		do
			--GdaDataModel *source_model; may be NULL if @param is
			--free-fill
			p:=get_source_model(handle)
			if p.is_not_null then 
				if cached_model=Void then
					cached_model := factory.wrapper(p)
				else 
					check 
						stable_model: p = cached_model.handle
					end
				end
			else
				check cached_model=Void end
			end
		end
	
	column: INTEGER is
		do
			Result:=get_source_column(handle)
		end

feature {} -- Cached wrappers
	cached_parameter: GDA_PARAMETER

	cached_model: GDA_DATA_MODEL
end 
