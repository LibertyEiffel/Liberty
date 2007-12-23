indexing
	description: "GdaDictType Represents a data type in the DBMS."
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

	wrapped_version: "3.0.1"

class GDA_DICT_TYPE
	-- A data type in the DBMS

	-- DBMS systems usually have quite large set of data types (which
	-- can sometimes be expanded by users). Each GdaDictType object
	-- represents one data type. The libgda library provides some data
	-- types, and so it is possible, for each GdaDictType object, to
	-- get the corresponding libgda data type.

	-- Every data type can be represented by a GdaDictType (even user
	-- defined data types). Complex data types (data types described as
	-- the aggregation of several other data types, like C structures)
	-- are handled like any other data type and it is not possible to
	-- individually access the different components of the complex data
	-- type (it is, however, possible to write a plugin for this data
	-- type).

inherit 
	GDA_OBJECT

		-- GdaDictType implements GdaXmlStorage.

insert GDA_DICT_TYPE_EXTERNALS

creation dummy, from_dict, from_external_pointer

feature dummy_gobject: POINTER is do unimplemented end

feature {} -- Creation
	from_dict (a_dict: GDA_DICT) is
			-- a new GdaDictType object which represent a data type
			-- defined in a data dictionary. `a_dict' can be Void
		do
			from_external_pointer(gda_dict_type_new(null_or(a_dict)))
		end

feature
	set_sqlname (an_sql_name: STRING) is
			-- Set the SQL name of the data type.
		require
			sql_not_void: an_sql_name /= Void
		do
			gda_dict_type_set_sqlname(handle, an_sql_name.to_external)
		end

	sql_name: CONST_STRING is
			-- the DBMS's name of Current data type.
		do
			create Result.from_external(gda_dict_type_get_sqlname(handle))
		end
	
	set_data_type (a_type: INTEGER) is
			-- Set the gtype for a data type
		do
			gda_dict_type_set_g_type(handle, a_type)
		end

	data_type: INTEGER is
			-- the gtype of a data type
		do
			Result := gda_dict_type_get_g_type(handle)
		end
	
	add_synonym (a_synonym: STRING) is
			-- Sets a new synonym to the data type.
		require
			synonym_not_void: a_synonym /= Void
		do
			gda_dict_type_add_synonym (handle, a_synonym.to_external)
		end

	synonyms: G_SLIST_STRING is
			-- a list of datatype's synonyms.
		do
			create Result.from_external_pointer(gda_dict_type_get_synonyms(handle))
			Result.petrify
		ensure 
			not_void: Result/=Void
			petrified: Result.is_petrified
		end

	clear_synonyms is
			--    Removes any synonym attached to data type
		do
			gda_dict_type_clear_synonyms (handle)
		end

feature {} -- TODO: The "prop" property
	-- "prop" gpointer : Read / Write

end -- class GDA_DICT_TYPE
