indexing
	description: "GDA provider informations."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli
					
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

class GDA_PROVIDER_INFO

inherit SHARED_C_STRUCT

insert
	GDA_PROVIDER_INFO_STRUCT
		rename 
			set_id  as set_id_internal,
			set_location as set_location_internal,
			set_description as set_description_internal,
			set_gda_params as set_gda_params_internal,
			set_dsn_spec as set_dsn_spec_internal
		end

creation make, from_external_pointer

feature -- Properties
	id: STRING is 
		do
			create Result.from_external (get_id(handle))
		ensure not_void: Result /= Void
		end
	
	location: STRING is
		do
			create Result.from_external (get_location(handle))
		ensure not_void: Result /= Void
		end
		
	description: STRING is
		do
			create Result.from_external (get_description(handle))
		ensure not_void: Result /= Void
		end

	parameters: GDA_PARAMETER_LIST is
			-- Contains a list of GdaParameter to create a DSN.
		do
			create Result.from_external_pointer (get_gda_params(handle))
		ensure not_void: Result /= Void
		end

	dsn_spec: STRING is 
			-- XML string with all the parameters required to create a
			-- DSN
		do
			create Result.from_external (get_description(handle))
		ensure not_void: Result /= Void
		end
feature -- TODO: Setters:

-- TODO: add a modifyiable boolean flag
end -- class GDA_PROVIDER_INFO
