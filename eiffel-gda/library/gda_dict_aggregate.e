indexing
	description: "GdaDictAggregate:  Represents an aggregate in the DBMS (like COUNT() or AVG() for example)."
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

			-- Description: Because aggregates can be polymorphic, the
			-- name is not enough to identify them, so the DBMS provides
			-- a unique id which can be used to uniquely identify an
			-- aggregate.

			--    It implements the GdaXmlStorage interface.


class GDA_DICT_AGGREGATE
 
inherit GDA_OBJECT
	-- TODO: GdaDictAggregate implements GdaXmlStorage.

insert  GDA_DICT_AGGREGATE_EXTERNALS

creation make, from_external_pointer

feature {} -- Creation
  
	from_dict (a_dict: GDA_DICT) is
			-- Creates a new GdaDictAggregate object which represents an
			-- aggregate in the dictionary
		require dict_not_void
		do
			from_external_pointer(gda_dict_aggregate_new(handle))
		end

feature
	set_dbms_id (an_id: STRING) is
			-- Set the DBMS identifier of the aggregate
		require id_not_void: an_id/=Void
		do
			gda_dict_aggregate_set_dbms_id (handle, an_id.to_external)
		end

--    agg : a GdaDictAggregate object
--    id :  the DBMS identifier

--    -----------------------------------------------------------------------------------------------------------------------

--   gda_dict_aggregate_get_dbms_id ()

--  gchar*      gda_dict_aggregate_get_dbms_id  (GdaDictAggregate *agg);

--    Get the DBMS identifier of the aggregate

--    agg :     a GdaDictAggregate object
--    Returns : the aggregate's id

--    -----------------------------------------------------------------------------------------------------------------------

--   gda_dict_aggregate_set_sqlname ()

--  void        gda_dict_aggregate_set_sqlname  (GdaDictAggregate *agg,
--                                               const gchar *sqlname);

--    Set the SQL name of the data type.

--    agg :     a GdaDictAggregate object
--    sqlname :

--    -----------------------------------------------------------------------------------------------------------------------

--   gda_dict_aggregate_get_sqlname ()

--  const gchar* gda_dict_aggregate_get_sqlname (GdaDictAggregate *agg);

--    Get the DBMS's name of a data type.

--    agg :     a GdaDictAggregate object
--    Returns : the name of the data type

--    -----------------------------------------------------------------------------------------------------------------------

--   gda_dict_aggregate_set_arg_type ()

--  void        gda_dict_aggregate_set_arg_type (GdaDictAggregate *agg,
--                                               GdaDictType *dt);

--    Set the argument type of a aggregate

--    agg : a GdaDictAggregate object
--    dt :  a GdaDictType objects or NULL value to represent the data type of the aggregate's unique argument .

--    -----------------------------------------------------------------------------------------------------------------------

--   gda_dict_aggregate_get_arg_type ()

--  GdaDictType* gda_dict_aggregate_get_arg_type
--                                              (GdaDictAggregate *agg);

--    To consult the list of arguments types (and number) of a aggregate.

--    agg :     a GdaDictAggregate object
--    Returns : a list of GdaDictType objects, the list MUST NOT be modified.

--    -----------------------------------------------------------------------------------------------------------------------

--   gda_dict_aggregate_set_ret_type ()

--  void        gda_dict_aggregate_set_ret_type (GdaDictAggregate *agg,
--                                               GdaDictType *dt);

--    Set the return type of a aggregate

--    agg : a GdaDictAggregate object
--    dt :  a GdaDictType object or NULL

--    -----------------------------------------------------------------------------------------------------------------------

--   gda_dict_aggregate_get_ret_type ()

--  GdaDictType* gda_dict_aggregate_get_ret_type
--                                              (GdaDictAggregate *agg);

--    To consult the return type of a aggregate.

--    agg :     a GdaDictAggregate object
--    Returns : a GdaDictType object.

-- Properties


--    "prop"                 gpointer              : Read / Write
-- Property Details

--   The "prop" property

--    "prop"                 gpointer              : Read / Write
end -- class  GDA_DICT_AGGREGATE
