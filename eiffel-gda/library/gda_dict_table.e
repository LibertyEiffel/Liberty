indexing
	description: "GdaDictTable Represents a table or a view in the database."
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
			
class GDA_DICT_TABLE
	-- A table or a view in the database.  Use this object to query the
	-- real structure of the table it represents.

inherit
	GDA_OBJECT
	GDA_XML_STORAGE
	GDA_ENTITY

insert 
	GDA_DICT_TABLE_EXTERNALS
	SHARED_G_ERROR

creation dummy, from_dict, from_external_pointer

feature {} -- Creation
	from_dict (a_dict: GDA_DICT) is
			--    Creates a new GdaDictTable object
		do
			from_external_pointer(gda_dict_table_new(handle))
		end
feature 
	database: GDA_DICT_DATABASE is
			-- the database to which the table belongs
		local a_pointer: POINTER; factory: G_OBJECT_EXPANDED_FACTORY[GDA_DICT_DATABASE]
		do
			a_pointer := gda_dict_table_get_database (handle)
			Result := factory.existant_wrapper(a_pointer)
			if Result=Void then
				create Result.from_external_pointer(a_pointer)
			end
		end
	

	is_view: BOOLEAN is
			-- Does the object represent a view rather than a table?
		do
			Result:=(gda_dict_table_is_view(handle)).to_boolean
		end
	
	-- TODO: parents since it seems to be useful only for Postgresql
	
	--  const GSList* gda_dict_table_get_parents (GdaDictTable *table);

	--    Get the parent tables of the table given as argument. This is
	--    significant only for DBMS which support tables -- inheritance
	--    (like PostgreSQL for example).


	constraints: G_SLIST [GDA_DICT_CONSTRAINT] is
			-- the constraints which apply to the given table (each
			-- constraint can represent a NOT NULL, a primary key or
			-- foreign key or a check constraint.
		local a_pointer: POINTER
		do
			a_pointer:=gda_dict_table_get_constraints(handle)
			create Result.from_external(a_pointer, gda_dict_constraint_factory)
		end

	public_key_constraint: GDA_DICT_CONSTRAINT is
			--the primary key constraint of table, if there is any. If
			--several GdaDictConstraint represent a primary key
			--constraint for table, then the first one in the list of
			--constraints is returned. Can be Void
		local a_pointer: POINTER; factory: G_OBJECT_FACTORY[GDA_DICT_CONSTRAINT]
		do
			a_pointer:=gda_dict_table_get_pk_constraint(handle)
			if a_pointer.is_not_null then
				Result:=factory.existant_wrapper(a_pointer)
				if Result=Void then 
					create Result.from_external_pointer(a_pointer)
				end
			end
		end

	update_dbms_data is
			-- Synchronises the Table representation with the table
			-- structure which is stored in the DBMS. For this operation
			-- to succeed, the connection to the DBMS server MUST be
			-- opened (using the corresponding GdaConnection object).

			-- `is_successful' and `error' will be updated as necessary
		require 
			database_connected: database.dict.connection.is_opened
		do
			is_successful:=(gda_dict_table_update_dbms_data
								 (handle, address_of(error.handle)).to_boolean)
		end

feature
	dummy_gobject: POINTER is do unimplemented end

end -- class GDA_DICT_TABLE
