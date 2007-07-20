indexing
	description: "GdaDictType Represents a data type in the DBMS."
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

			-- Description: DBMS systems usually have quite large set of
			-- data types (which can sometimes be expanded by
			-- users). Each GdaDictType object represents one data
			-- type. The libgda library provides some data types, and so
			-- it is possible, for each GdaDictType object, to get the
			-- corresponding libgda data type.
			
			-- Every data type can be represented by a GdaDictType (even
			-- user defined data types). Complex data types (data types
			-- described as the aggregation of several other data types,
			-- like C structures) are handled like any other data type
			-- and it is not possible to individually access the
			-- different components of the complex data type (it is,
			-- however, possible to write a plugin for this data type).

class GDA_DICT_TYPE

inherit 
	GDA_OBJECT

		-- GdaDictType implements GdaXmlStorage.

insert GDA_DICT_TYPE_EXTERNALS

creation from_dict, from_external_pointer

feature {} -- Creation
	from_dict (a_dict: GDA_DICT) is
			-- a new GdaDictType object which represent a data type
			-- defined in a data dictionary. `a_dict' can be Void
		do
			if a_dict/=Void
			 then	from_external_pointer(gda_dict_type_new(a_dict.handle))
			else from_external_pointer(gda_dict_type_new(default_pointer))
			end
		end

feature
	set_sqlname (an_sql_name: STRING) is
			-- Set the SQL name of the data type.
		require
			sql_not_void: an_sql_name /= Void
		do
			gda_dict_type_set_sqlname(handle, an_sql_name.to_external)
		end

	sql_name: STRING is
			-- the DBMS's name of a data type.
		do
			create {CONST_STRING} Result.from_external(gda_dict_type_get_sqlname(handle))
		end
	 
	set_gda_type (a_type: INTEGER) is
			-- Set the gda type for a data type
		do
			gda_dict_type_set_gda_type(handle, a_type)
		end

	gda_type: INTEGER is
			-- the gda type of a data type
		do
			Result := gda_dict_type_get_gda_type(handle)
		end
	
	add_synonym (a_synonym: STRING) is
			-- Sets a new synonym to the data type.
		require
			synonym_not_void: a_synonym /= Void
		do
			gda_dict_type_add_synonym (handle, a_synonym.to_external)
		end

	synonyms: G_SLIST_STRING is
			-- a list of datatype's synonyms. TODO: this list must not be
			-- modified. This fact is still to be implemented
		do
			create Result.from_external_pointer(gda_dict_type_get_synonyms(handle))
		end

   clear_synonyms is
			--    Removes any synonym attached to dt
		do
			gda_dict_type_clear_synonyms (handle)
		end

feature {} -- TODO: The "prop" property
   -- "prop" gpointer : Read / Write

end -- class GDA_DICT_TYPE
