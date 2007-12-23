indexing
	description: "GdaDictField represents a field in a table or a view in the database."
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

	wrapped_version: "3.0.1"

class GDA_DICT_FIELD
	-- GDA_DICT_FIELD represents a field in a table or a view in the
	-- database.

	

inherit
	GDA_OBJECT

	-- TODO: GdaDictField implements GdaXmlStorage, GdaEntityField and GdaRenderer.
	
insert GDA_DICT_FIELD_EXTERNALS

creation from_dict, from_external_pointer

feature {} -- Creation

	from_dict (a_dict: GDA_DICT; a_type: GDA_DICT_TYPE) is
			--	Creates a new GdaDictField object from `a_dict' of `a_type'.
		require
			dict_not_void: a_dict/=Void
			type_not_void: a_type/=Void
		do
			from_external_pointer(gda_dict_field_new
										 (a_dict.handle, a_type.handle))
			
		end
feature
	set_length (a_length: INTEGER) is
		do
			gda_dict_field_set_length(handle, a_length)
		end

	length: INTEGER is
			-- the length of a field, the size of the corresponding data
			-- type has a fixed size, or -1
		do
			Result := gda_dict_field_get_length(handle)
		end

	set_scale (a_length: INTEGER) is
		do
			gda_dict_field_set_scale (handle, a_length)
		end

	scale: INTEGER is
			-- the scale of a field, the size of the corresponding data type has a
			-- fixed size, or -1
		do
			Result := gda_dict_field_get_scale (handle)
		end

	constraints: G_OBJECT_SLIST[GDA_DICT_CONSTRAINT] is
			-- the constraints which impact the given field. Constraints are of
			-- several type: NOT NULL, primary key, foreign key, check constrains
		do
			create Result.from_external_pointer(gda_dict_field_get_constraints(handle))
		end

	set_dict_type (a_type: GDA_DICT_TYPE) is
			-- Sets the data type of the field
		require type_not_void: a_type /= Void
		do
			gda_dict_field_set_dict_type (handle, a_type.handle)
		end

	set_default_value (a_value: G_VALUE) is
			-- Sets (or replace) the default value for the field. WARNING: the
			-- default value's data type can be different from the field's data
			-- type (this is the case for example if the default value is a
			-- function like Postgres's default value for the SERIAL data type). 
			-- `a_value' can be Void
		local vp: POINTER
		do
			if a_value.is_not_null then
				vp := a_value.handle
			end
			gda_dict_field_set_default_value (handle, vp)
		end

	default_value: G_VALUE is
			-- the default value for the field if it exists, or Void.
		local p: POINTER
		do
			p:=gda_dict_field_get_default_value(handle)
			if p.is_not_null then
				create Result.from_external_pointer(p)
			end
		end

	is_null_allowed: BOOLEAN is
			-- Can Current field be NULL?
		do
			Result:=(gda_dict_field_is_null_allowed
						(handle)).to_boolean
		end

	is_primary_key_part: BOOLEAN is
			-- Is field part of a primary key constraint?
		do
			Result := (gda_dict_field_is_pkey_part (handle)).to_boolean
		end

	is_primary_key: BOOLEAN is
			-- Is field alone a primary key constraint?
		do
			Result:=(gda_dict_field_is_pkey_alone(handle)).to_boolean
		end

	is_foreign_key_part: BOOLEAN is
			-- Is field is part of a foreign key constraint?
		do 
			Result := (gda_dict_field_is_fkey_part(handle)).to_boolean
		end

	is_foreign_key: BOOLEAN is
			-- Is field alone a foreign key constraint?
		do
			Result:=(gda_dict_field_is_fkey_alone(handle)).to_boolean
		end

	set_attributes (some_attributes: INTEGER) is
		require
			valid_attributes: are_valid_attributes(some_attributes)
		do
			gda_dict_field_set_attributes (handle, some_attributes)
		end

	attributes: INTEGER is
			-- field's extra attributes. The attributes is an OR'ed value
			-- of all the possible values in GdaDictFieldAttribute.
			-- TODO: should be NATURAL
		do
			Result:= gda_dict_field_get_attributes (handle);
		end

feature {} -- TODO: Properties

	--    "db-table"             gpointer              : Read / Write
	--    "entry-plugin"         gchararray            : Read / Write
	
	--   The "db-table" property
	
	--    "db-table"             gpointer              : Read / Write

	--   The "entry-plugin" property
	
	--    "entry-plugin"         gchararray            : Read / Write
	
	--    Default value: NULL

feature
	dummy_gobject: POINTER is do unimplemented end
end -- class GDA_DICT_FIELD
									
