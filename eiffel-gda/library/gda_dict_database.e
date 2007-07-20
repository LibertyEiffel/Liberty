indexing
	description: "GdaDictDatabase: Represents a database structure in the DBMS server."
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

			-- Description: This object manages an internal dictionary
			-- mirroring the real database structure with objects such as
			-- GdaDictTable (composed of GdaDictfield objects) and
			-- GdaDictConstraint. 

class GDA_DICT_DATABASE

inherit GDA_OBJECT
	-- TODO: GDA_XML_STORAGE -- GdaDictDatabase implements 
	-- GdaXmlStorage.

insert 
	GDA_DICT_DATABASE_EXTERNALS
	SHARED_G_ERROR

creation from_dict, from_external_pointer

feature {} -- Creation
	from_dict (a_dictionary: GDA_DICT) is
			-- Creates a new GdaDictDatabase object
		require dictionary_not_void: a_dictionary /= Void
		do
			from_external_pointer(gda_dict_database_new(a_dictionary.handle))
		end

feature 
	add_constraint (a_constraint: GDA_DICT_CONSTRAINT) is
			-- Add `a_constraint' to the database. `a_constraint' is a
			-- user-defined constraint (which is not part of the database
			-- structure itself).
		require constraint_not_void: a_constraint /= Void
		do
			gda_dict_database_add_constraint(handle,a_constraint.handle)
		end

	dict: GDA_DICT is
			-- Fetch the GdaDict object to which the GdaDictDatabase belongs.
		local r: G_RETRIEVER[GDA_DICT]; p: POINTER
		do
			p:=gda_dict_database_get_dict(handle)
			Result:=r.eiffel_wrapper_from_gobject_pointer(p)
			if Result = Void then 
				debug 
					print ("Creating a GDA_DICT from a gda_dict_database_get_dict call. This event is correctly handled, even if it is a little unexpected since a GDA_DICT_DATABASE is usually created by an already existing GDA_DICT.%N")
				end
				create Result.from_external_pointer(p) 
			end
		end

	update_dbms_data (a_limiting_type: INTEGER; a_limiting_object_name: STRING) is
			-- Synchronises the database representation with the database
			-- structure which is stored in the DBMS. For this operation
			-- to succeed, the connection to the DBMS server MUST be
			-- opened (using the corresponding GdaConnection object).
		
			-- `a_limiting_type': limit the DBMS update to this type, or 0 for no limit
			-- `a_limiting_object_name' : lmit the DBMS update to objects of this name, or Void for no limit
			-- `is_successful' and `error' will be updated as necessary.
		require 
			database_connected: dict.connection.is_opened
		local lon: POINTER
		do
			if a_limiting_object_name /= Void then lon:=a_limiting_object_name.to_external end
			is_successful:=(gda_dict_database_update_dbms_data
								 (handle, a_limiting_type, lon, 
								  address_of(error.handle))).to_boolean
		end

	stop_update_dbms_data is
			-- When the database updates its internal lists of DBMS
			-- objects, a call to this feature will stop that update
			-- process. It has no effect when the database is not
			-- updating its DBMS data.
		do
			gda_dict_database_stop_update_dbms_data (handle)
		end

	tables: G_SLIST[GDA_DICT_TABLE] is
			-- a list of all the tables within a database
		local p: POINTER
		do
			p:=gda_dict_database_get_tables(handle)
			if wrappers.has(p)
			 then Result::=wrappers.has(p).to_any
			else  create Result.from_external(p)
			end
		end
	
	table_by_name (a_table_name: STRING): GDA_DICT_TABLE is
			-- a GdaDictTable with `a_table_name'. Void if the requested
			-- table does not exist.
		require table_name_not_void: a_table_name /= Void
		local tp: POINTER
		do
			tp:= gda_dict_database_get_table_by_name (handle, a_table_name.to_external)
			if tp.is_not_null then
				if wrappers.has(tp)
				 then Result::=wrappers.at(tp)
				else create Result.from_external_pointer(tp)
				end
			end
		end

	--TODO: gda_dict_database_get_table_by_xml_id ()
	
	-- GdaDictTable* gda_dict_database_get_table_by_xml_id
	-- (GdaDictDatabase *db, const gchar *xml_id);
	
	-- Get a reference to a GdaDictTable using its XML id.
	
	-- db : 	a GdaDictDatabase object
	-- xml_id : 	the XML id of the requested table
	-- Returns : 	The GdaDictTable pointer or NULL if the requested table does not exist.

	field_by_name (a_field_name: STRING): GDA_DICT_FIELD is
			-- the field with `a_field_name'. Void if the requested field does
			-- not exist.
		require name_not_void: a_field_name /= Void
		local fp: POINTER
		do
			fp:=gda_dict_database_get_field_by_name(handle, a_field_name.to_external)
			if fp.is_not_null then
				if wrappers.has(fp)
				 then Result:=wrappers.at(fp)
				else create Result.from_external_pointer(fp)
				end
			end
		end

	-- TODO: gda_dict_database_get_field_by_xml_id ()
	
	-- GdaDictField* gda_dict_database_get_field_by_xml_id
	-- (GdaDictDatabase *db, const gchar *xml_id);

	-- Get a reference to a GdaDictField specifying its XML id
	
	-- db : 	a GdaDictDatabase object
	-- xml_id : 	the XML id of the requested table field
	-- Returns : 	The GdaDictField pointer or NULL if the requested field does not 
	-- exist.

	constraints: G_SLIST[GDA_DICT_CONSTRAINT] is
			-- a list of all the constraints applied to the database.
		local cp: POINTER
		do
			cp:=gda_dict_database_get_all_constraints (handle)
			if wrappers.has(cp)
			 then Result := wrappers.at(cp)
			else create Result.from_external_pointer (cp)
			end
		end

	table_constraints (a_table: STRING): G_SLIST[GDA_DICT_CONSTRAINT] is
			-- the constraints applicable to `a_table'
		require table_not_void: a_table /= Void
		local tcp: POINTER
		do
			tcp:=gda_dict_database_get_table_constraints(handle, a_table.to_external)
			if wrappers.has(tcp)
			 then Result::=wrappers.at(tcp)
			else create Result.from_external_pointer(tcp)
			end			
		end

	foreign_constraints: G_SLIST[GDA_DICT_CONSTRAINT] is
			-- the constraints applied to the database which represent a
			-- foreign constrains.
		local fcp: POINTER
		do
			fcp:=gda_dict_database_get_all_fk_constraints(handle)
			if wrappers.has(fcp)
			 then Result::=wrappers.at(fcp)
			else create Result.from_external_pointer(fcp)
			end
		end
	
	tables_foreign_constraints (a_table, another_table: GDA_DICT_TABLE; 
										 a_table_has_foreign_constraints: BOOLEAN): G_SLIST[GDA_DICT_CONSTRAINT] is
			-- the constraints applied to the database which represent a
			-- foreign key constrains, between `a_table' and
			-- `another_table'. If `a_table' or `another_table' are Void,
			-- then the returned foreign key constraints are the ones
			-- between any table and table1 or table2.

			-- If `a_table_has_foreign_constraints' is True then the
			-- constraints are the one for which `a_table' contains the
			-- foreign key 
		local tfcp, t1p, t2p: POINTER
		do
			if a_table.is_not_null then t1p:=a_table.handle end
			if another_table.is_not_null then t2p:=another_table.handle end
			
			tfcp:=(gda_dict_database_get_tables_fk_constraints
					 (handle, t1p, t2p,
					  a_table_has_foreign_constraints.to_integer))
			if wrappers.has(tfcp)
			 then Result::=wrappers.at(tfcp)
			else create Result.from_external_pointer(tfcp)
			end
		end

feature {} -- TODO: Properties

	--   "prop"                 gpointer              : Read / Write


	-- Property Details
	-- The "prop" property

	--   "prop"                 gpointer              : Read / Write

feature {} -- TODO: -- Signals

	-- "constraint-added"
	--             void        user_function      (GdaDictDatabase *gdadictdatabase,
	--                                             gpointer         arg1,
	--                                             gpointer         user_data)            : Run first
	-- "constraint-removed"
	--             void        user_function      (GdaDictDatabase *gdadictdatabase,
	--                                             gpointer         arg1,
	--                                             gpointer         user_data)            : Run first
	-- "constraint-updated"
	--             void        user_function      (GdaDictDatabase *gdadictdatabase,
	--                                             gpointer         arg1,
	--                                             gpointer         user_data)            : Run first
	-- "data-update-finished"
	--             void        user_function      (GdaDictDatabase *gdadictdatabase,
	--                                             gpointer         user_data)            : Run first
	-- "data-update-started"
	--             void        user_function      (GdaDictDatabase *gdadictdatabase,
	--                                             gpointer         user_data)            : Run first
	-- "field-added"
	--             void        user_function      (GdaDictDatabase *gdadictdatabase,
	--                                             gpointer         arg1,
	--                                             gpointer         user_data)            : Run first
	-- "field-removed"
	--             void        user_function      (GdaDictDatabase *gdadictdatabase,
	--                                             gpointer         arg1,
	--                                             gpointer         user_data)            : Run first
	-- "field-updated"
	--             void        user_function      (GdaDictDatabase *gdadictdatabase,
	--                                             gpointer         arg1,
	--                                             gpointer         user_data)            : Run first
	-- "table-added"
	--             void        user_function      (GdaDictDatabase *gdadictdatabase,
	--                                             gpointer         arg1,
	--                                             gpointer         user_data)            : Run first
	-- "table-removed"
	--             void        user_function      (GdaDictDatabase *gdadictdatabase,
	--                                             gpointer         arg1,
	--                                             gpointer         user_data)            : Run first
	-- "table-updated"
	--             void        user_function      (GdaDictDatabase *gdadictdatabase,
	--                                             gpointer         arg1,
	--                                             gpointer         user_data)            : Run first
	-- "update-progress"
	--             void        user_function      (GdaDictDatabase *gdadictdatabase,
	--                                             gpointer         arg1,
	--                                             guint            arg2,
	--                                             guint            arg3,
	--                                             gpointer         user_data)            : Run first

	-- Signal Details
	-- The "constraint-added" signal

	-- void        user_function                  (GdaDictDatabase *gdadictdatabase,
	--                                             gpointer         arg1,
	--                                             gpointer         user_data)            : Run first

	-- dbdatabase : 	the object which received the signal.
	-- arg1 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- The "constraint-removed" signal

	-- void        user_function                  (GdaDictDatabase *gdadictdatabase,
	--                                             gpointer         arg1,
	--                                             gpointer         user_data)            : Run first

	-- dbdatabase : 	the object which received the signal.
	-- arg1 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- The "constraint-updated" signal

	-- void        user_function                  (GdaDictDatabase *gdadictdatabase,
	--                                             gpointer         arg1,
	--                                             gpointer         user_data)            : Run first

	-- dbdatabase : 	the object which received the signal.
	-- arg1 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- The "data-update-finished" signal

	-- void        user_function                  (GdaDictDatabase *gdadictdatabase,
	--                                             gpointer         user_data)            : Run first

	-- dbdatabase : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- The "data-update-started" signal

	-- void        user_function                  (GdaDictDatabase *gdadictdatabase,
	--                                             gpointer         user_data)            : Run first

	-- dbdatabase : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- The "field-added" signal

	-- void        user_function                  (GdaDictDatabase *gdadictdatabase,
	--                                             gpointer         arg1,
	--                                             gpointer         user_data)            : Run first

	-- dbdatabase : 	the object which received the signal.
	-- arg1 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- The "field-removed" signal

	-- void        user_function                  (GdaDictDatabase *gdadictdatabase,
	--                                             gpointer         arg1,
	--                                             gpointer         user_data)            : Run first

	-- dbdatabase : 	the object which received the signal.
	-- arg1 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- The "field-updated" signal

	-- void        user_function                  (GdaDictDatabase *gdadictdatabase,
	--                                             gpointer         arg1,
	--                                             gpointer         user_data)            : Run first

	-- dbdatabase : 	the object which received the signal.
	-- arg1 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- The "table-added" signal

	-- void        user_function                  (GdaDictDatabase *gdadictdatabase,
	--                                             gpointer         arg1,
	--                                             gpointer         user_data)            : Run first

	-- dbdatabase : 	the object which received the signal.
	-- arg1 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- The "table-removed" signal

	-- void        user_function                  (GdaDictDatabase *gdadictdatabase,
	--                                             gpointer         arg1,
	--                                             gpointer         user_data)            : Run first

	-- dbdatabase : 	the object which received the signal.
	-- arg1 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- The "table-updated" signal

	-- void        user_function                  (GdaDictDatabase *gdadictdatabase,
	--                                             gpointer         arg1,
	--                                             gpointer         user_data)            : Run first

	-- dbdatabase : 	the object which received the signal.
	-- arg1 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- The "update-progress" signal

	-- void        user_function                  (GdaDictDatabase *gdadictdatabase,
	--                                             gpointer         arg1,
	--                                             guint            arg2,
	--                                             guint            arg3,
	--                                             gpointer         user_data)            : Run first

	-- dbdatabase : 	the object which received the signal.
	-- arg1 : 	
	-- arg2 : 	
	-- arg3 : 	
	-- user_data : 	user data set when the signal handler was connected.
end -- class GDA_DICT_DATABASE
