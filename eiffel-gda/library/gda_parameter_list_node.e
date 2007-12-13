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
			-- 	GdaParameter   *param;         /* Can't be NULL */
		ensure not_void: Result/=Void
		end

	model: GDA_DATA_MODEL is
		do
			--GdaDataModel *source_model; /* may be NULL if @param is
			--free-fill */
		end
	
	column: INTEGER is
		do
			-- gint source_column; /* unused is @source_model is NULL */
		end
end 
