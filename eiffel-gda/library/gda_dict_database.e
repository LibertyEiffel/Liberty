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

	wrapped_version: "3.0.1"

class GDA_DICT_DATABASE
	-- GDA_DICT_DATABASE represents a database structure in the DBMS
	-- server
	
	-- GDA_DICT_DATABASE manages an internal dictionary mirroring the
	-- real database structure with objects such as GDA_DICT_TABLE
	-- (composed of GdaDictfield objects) and GDA_DICT_CONSTRAINT.

inherit GDA_OBJECT
	-- TODO: GDA_XML_STORAGE -- GdaDictDatabase implements 
	-- GdaXmlStorage.

insert 
	GDA_DICT_DATABASE_EXTERNALS
	SHARED_G_ERROR

creation dummy, from_dict, from_external_pointer

feature 
	dummy_gobject: POINTER is
		do 
			unimplemented
		end

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
		local r: G_OBJECT_EXPANDED_FACTORY[GDA_DICT]; p: POINTER
		do
			p:=gda_dict_database_get_dict(handle)
			Result:=r.wrapper(p)
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
			-- `a_limiting_object_name' : limit the DBMS update to objects of this name, or Void for no limit
			-- `is_successful' and `error' will be updated as necessary.
		require 
			database_connected: dict.connection.is_opened
		do
			is_successful:=(gda_dict_database_update_dbms_data
								 (handle, a_limiting_type, 
								  null_or_string(a_limiting_object_name), 
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
		local p: POINTER; 
		do
			p:=gda_dict_database_get_tables(handle)
			create Result.from_external(p,gda_dict_table_factory) 
		end
	
	table_by_name (a_table_name: STRING): GDA_DICT_TABLE is
			-- a GdaDictTable with `a_table_name'. Void if the requested
			-- table does not exist.
		require table_name_not_void: a_table_name /= Void
		local tp: POINTER; f: G_OBJECT_EXPANDED_FACTORY[GDA_DICT_TABLE]
		do
			tp:= gda_dict_database_get_table_by_name (handle, a_table_name.to_external)
			if tp.is_not_null then
				Result:=f.existant_wrapper(tp)
				if Result=Void then 
					create Result.from_external_pointer(tp)
				end
			end
		end

	table_by_xml_id (an_xml_id: STRING): GDA_DICT_TABLE is
			-- The GdaDictTable using its XML id.
		require id_not_void: an_xml_id/=Void
		local tp: POINTER; f: G_OBJECT_EXPANDED_FACTORY[GDA_DICT_TABLE]
		do
			tp := gda_dict_database_get_table_by_xml_id(handle,an_xml_id.to_external)
			if tp.is_not_null then 
				Result := f.existant_wrapper(tp)
				if Result=Void then
					create Result.from_external_pointer(tp)
				end
			end
		end

	field_by_name (a_field_name: STRING): GDA_DICT_FIELD is
			-- the field with `a_field_name'. Void if the requested field does
			-- not exist.
		require name_not_void: a_field_name /= Void
		local fp: POINTER; f: G_OBJECT_EXPANDED_FACTORY[GDA_DICT_FIELD]
		do
			fp:=gda_dict_database_get_field_by_name(handle, a_field_name.to_external)
			if fp.is_not_null then
				Result:=f.existant_wrapper(fp)
				if Result=Void then
					create Result.from_external_pointer(fp)
				end
			end
		end

	field_by_xml_id (an_xml_id: STRING): GDA_DICT_FIELD is
			--The GDA_DICT_FIELD specifie by `an_xml_id'. Void if the
			--requested field does not exist.
		local fp: POINTER; f: G_OBJECT_EXPANDED_FACTORY[GDA_DICT_FIELD]
		do
			fp:=gda_dict_database_get_field_by_xml_id(handle, an_xml_id.to_external)
			if fp.is_not_null then
				Result:=f.existant_wrapper(fp)
				if Result=Void then
					create Result.from_external_pointer(fp)
				end
			end
		end


	constraints: G_SLIST[GDA_DICT_CONSTRAINT] is
			-- a list of all the constraints applied to the database.
		local cp: POINTER
		do
			cp:=gda_dict_database_get_all_constraints (handle)
			create Result.from_external(cp,gda_dict_constraint_factory)
		end

	table_constraints (a_table: STRING): G_SLIST[GDA_DICT_CONSTRAINT] is
			-- the constraints applicable to `a_table'
		require table_not_void: a_table /= Void
			-- TODO: a_table belongs to database of Current
		local tcp: POINTER
		do
			tcp:=gda_dict_database_get_table_constraints(handle, a_table.to_external)
			create Result.from_external(tcp,gda_dict_constraint_factory)
		end

	foreign_constraints: G_SLIST[GDA_DICT_CONSTRAINT] is
			-- the constraints applied to the database which represent a
			-- foreign constrains.
		local fcp: POINTER
		do
			fcp:=gda_dict_database_get_all_fk_constraints(handle)
			create Result.from_external(fcp,gda_dict_constraint_factory)			
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
		local tfcp: POINTER
		do
			tfcp:=(gda_dict_database_get_tables_fk_constraints
					 (handle, null_or(a_table), null_or(another_table),
					  a_table_has_foreign_constraints.to_integer))
			create Result.from_external(tfcp,gda_dict_constraint_factory)
		end

feature {} -- TODO: Properties

	--   "prop"                 gpointer              : Read / Write


	-- Property Details
	-- The "prop" property

	--   "prop"                 gpointer              : Read / Write

feature {} -- TODO: -- Signals
	--Signals
	--
	--
	--   "constraint-added"                               : Run First
	--   "constraint-removed"                             : Run First
	--   "constraint-updated"                             : Run First
	--   "data-update-finished"                           : Run First
	--   "data-update-started"                            : Run First
	--   "field-added"                                    : Run First
	--   "field-removed"                                  : Run First
	--   "field-updated"                                  : Run First
	--   "table-added"                                    : Run First
	--   "table-removed"                                  : Run First
	--   "table-updated"                                  : Run First
	--   "update-progress"                                : Run First

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

feature {} -- V3 API
	
	--  The "constraint-added" signal
	--
	-- void                user_function                      (GdaDictDatabase   *gdadictdatabase,
	--                                                         GdaDictConstraint *arg1,
	--                                                         gpointer           user_data)            : Run First
	--
	--   dbdatabase : the object which received the signal.
	--   arg1 :
	--   user_data :  user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "constraint-removed" signal
	--
	-- void                user_function                      (GdaDictDatabase   *gdadictdatabase,
	--                                                         GdaDictConstraint *arg1,
	--                                                         gpointer           user_data)            : Run First
	--
	--   dbdatabase : the object which received the signal.
	--   arg1 :
	--   user_data :  user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "constraint-updated" signal
	--
	-- void                user_function                      (GdaDictDatabase   *gdadictdatabase,
	--                                                         GdaDictConstraint *arg1,
	--                                                         gpointer           user_data)            : Run First
	--
	--   dbdatabase : the object which received the signal.
	--   arg1 :
	--   user_data :  user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "data-update-finished" signal
	--
	-- void                user_function                      (GdaDictDatabase *gdadictdatabase,
	--                                                         gpointer         user_data)            : Run First
	--
	--   dbdatabase : the object which received the signal.
	--   user_data :  user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "data-update-started" signal
	--
	-- void                user_function                      (GdaDictDatabase *gdadictdatabase,
	--                                                         gpointer         user_data)            : Run First
	--
	--   dbdatabase : the object which received the signal.
	--   user_data :  user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "field-added" signal
	--
	-- void                user_function                      (GdaDictDatabase *gdadictdatabase,
	--                                                         GdaDictField    *arg1,
	--                                                         gpointer         user_data)            : Run First
	--
	--   dbdatabase : the object which received the signal.
	--   arg1 :
	--   user_data :  user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "field-removed" signal
	--
	-- void                user_function                      (GdaDictDatabase *gdadictdatabase,
	--                                                         GdaDictField    *arg1,
	--                                                         gpointer         user_data)            : Run First
	--
	--   dbdatabase : the object which received the signal.
	--   arg1 :
	--   user_data :  user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "field-updated" signal
	--
	-- void                user_function                      (GdaDictDatabase *gdadictdatabase,
	--                                                         GdaDictField    *arg1,
	--                                                         gpointer         user_data)            : Run First
	--
	--   dbdatabase : the object which received the signal.
	--   arg1 :
	--   user_data :  user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "table-added" signal
	--
	-- void                user_function                      (GdaDictDatabase *gdadictdatabase,
	--                                                         GdaDictTable    *arg1,
	--                                                         gpointer         user_data)            : Run First
	--
	--   dbdatabase : the object which received the signal.
	--   arg1 :
	--   user_data :  user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "table-removed" signal
	--
	-- void                user_function                      (GdaDictDatabase *gdadictdatabase,
	--                                                         GdaDictTable    *arg1,
	--                                                         gpointer         user_data)            : Run First
	--
	--   dbdatabase : the object which received the signal.
	--   arg1 :
	--   user_data :  user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "table-updated" signal
	--
	-- void                user_function                      (GdaDictDatabase *gdadictdatabase,
	--                                                         GdaDictTable    *arg1,
	--                                                         gpointer         user_data)            : Run First
	--
	--   dbdatabase : the object which received the signal.
	--   arg1 :
	--   user_data :  user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "update-progress" signal
	--
	-- void                user_function                      (GdaDictDatabase *gdadictdatabase,
	--                                                         gchar           *arg1,
	--                                                         guint            arg2,
	--                                                         guint            arg3,
	--                                                         gpointer         user_data)            : Run First
	--
	--   dbdatabase : the object which received the signal.
	--   arg1 :
	--   arg2 :
	--   arg3 :
	--   user_data :  user data set when the signal handler was connected.

end -- class GDA_DICT_DATABASE
