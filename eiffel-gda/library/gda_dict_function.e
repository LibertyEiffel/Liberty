indexing
	description: "GdaDictFunction Represents a function in the DBMS.."
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

class GDA_DICT_FUNCTION
	-- GDA_DICT_FUNCTION represents a function, it has zero or more
	-- input parameters, and one and only one return type. In this way
	-- it does not represent procedures which does not return any data
	-- type. Also the argument types are always of the IN kind (no OUT
	-- or IN OUT kinds); there may one day be a specific object for
	-- procedures. It does not either represent a function returning a
	-- SET OF a given data type; there may on day be a specific object
	-- for such functions.
	
	-- Because functions can be polymorphic, the name is not enough to
	-- identify them, so the DBMS provides a unique id which can be
	-- used to uniquely identify a function.
	
inherit
	GDA_OBJECT

	-- GdaDictFunction implements GdaXmlStorage.
	
insert GDA_DICT_FUNCTION_EXTERNALS

creation dummy, from_dict, from_external_pointer

feature {} -- Creation
	from_dict (a_dict: GDA_DICT) is
			-- Creates a new GdaDictFunction object which represents a
			-- function in the dictionary
		require dict_not_void: a_dict /= Void
		do
				from_external_pointer(gda_dict_function_new(handle))
		end

	dummy
			
feature 
	set_dbms_id (an_id: STRING) is
			-- Set the DBMS identifier of the function
		require id_not_void: an_id /= Void
		do
			gda_dict_function_set_dbms_id(handle,an_id.to_external)
		end
	
	dbms_id: STRING is
			-- the DBMS identifier of the function
		do
			create Result.from_external(gda_dict_function_get_dbms_id(handle))
		end

	set_sql_name (an_sql_name: STRING) is
			-- Set the SQL name of the data type.
		do
			gda_dict_function_set_sqlname(handle,an_sql_name.to_external)
		end

	sql_name: STRING is
			--    the DBMS's name of a data type.
		do
			create {CONST_STRING} Result.from_external
			(gda_dict_function_get_sqlname(handle))
		ensure not_void: Result /= Void
		end

	set_argument_types (some_types: G_SLIST[GDA_DICT_TYPE]) is
			-- Set the arguments types of a function. `some_types' is a
			-- list of GdaDictType objects or NULL values ordered to
			-- represent the data types of the function's arguments .

			-- TODO: NULL values in the list is currently not supported
		require types_not_void: some_types /= Void
		do
			gda_dict_function_set_arg_types(handle, some_types.handle)
		end

	argument_types: G_SLIST[GDA_DICT_FUNCTION] is
			--	the list of arguments types (and number) of a
			--	function. TODO: This list of GdaDictType objects is meant
			--	to be read-only nad MUST NOT be modified.
			-- TODO: shall not be modified
		do
			create Result.from_external_pointer
			(gda_dict_function_get_arg_types(handle))
		end

	set_return_type (a_type: GDA_DICT_TYPE) is
			-- Set the return type of a function. `a_type' can be Void.
		do
			if a_type=Void 
			 then	gda_dict_function_set_ret_type(handle, default_pointer)
			else gda_dict_function_set_ret_type(handle, a_type.handle)
			end
		end

	return_type: GDA_DICT_TYPE is
			-- the return type of a function (To consult it). Note: the
			-- setter feature allows Void values while the C version of
			-- this getter feature does not specify it. It could be Void
		local r: G_OBJECT_EXPANDED_FACTORY[GDA_DICT_TYPE]; p: POINTER
		do
			p:=gda_dict_function_get_ret_type(handle)
			if p.is_not_null then 
				Result:=r.eiffel_wrapper_from_gobject_pointer(p)
				if Result=Void then 
					create Result.from_external_pointer(p) 
				end
			end
		end
			
	accepts_arguments (some_arguments: G_SLIST[GDA_DICT_TYPE]): BOOLEAN is
			-- Would `some_arguments' be accepted by the Current
			-- function?  The non acceptance can be beause of data type
			-- incompatibilities or a wrong number of data types.

			-- TODO: the C version allows NULL values in
			-- `some_arguments'. This is still unimplemented
		do
			Result:=(gda_dict_function_accepts_args
						(handle, some_arguments.handle)).to_boolean
		end

feature--  The "prop" property
	--   "prop"                 gpointer              : Read / Write

end -- class GDA_DICT_FUNCTION
	
