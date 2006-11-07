indexing
	description: "GdaDictTable Represents a table or a view in the database."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GDA team
					
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

			-- Description: Use this object to query the real structure
			-- of the table it represents.  It implements the
			-- GdaXmlStorage and GdaEntity interfaces.

class GDA_DICT_TABLE

inherit
	GDA_OBJECT
		-- TODO: GdaDictTable implements GdaXmlStorage and GdaEntity.
insert 
	GDA_DICT_TABLE_EXTERNALS
	SHARED_G_ERROR

creation from_dict, from_external_pointer

feature {} -- Creation
	from_dict (a_dict: GDA_DICT) is
			--    Creates a new GdaDictTable object
		do
			from_external_pointer(gda_dict_table_new(handle))
		end
feature 
	database: GDA_DICT_DATABASE is
			-- the database to which the table belongs
		local p: POINTER
		do
			p := gda_dict_table_get_database (handle)
			if wrappers.has(p) then
				Result ::= wrappers.at(p).to_any
			else
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
		local p: POINTER; -- r: WRAPPER_RETRIEVER[G_SLIST[GDA_DICT_CONSTRAINT]]
		do
			p:=gda_dict_table_get_constraints(handle)
			if wrappers.has(p) then
				Result ::= wrappers.at(p).to_any
			else
				create Result.from_external_pointer(a_pointer)
			end
		end

	public_key_constraint: GDA_DICT_CONSTRAINT is
			--the primary key constraint of table, if there is any. If
			--several GdaDictConstraint represent a primary key
			--constraint for table, then the first one in the list of
			--constraints is returned. Can be Void
		local p: POINTER; -- r: WRAPPER_RETRIEVER[GDA_DICT_CONSTRAINT]
		do
			p:=gda_dict_table_get_pk_constraint(handle)
			if p.is_not_null then
				if wrappers.has(p) then
					Result ::= wrappers.at(p).to_any
				else
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
								 (handle, address_of(error.handle)))
		end

feature -- TODO: Properties
--    "database"             gpointer              : Read / Write
-- Property Details

--   The "database" property

--    "database"             gpointer              : Read / Write
end -- class GDA_DICT_TABLE
