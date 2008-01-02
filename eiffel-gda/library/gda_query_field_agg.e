indexing
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GDA developers
					
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

class GDA_QUERY_FIELD_AGG
	-- GdaQueryFieldAgg represents a function (selected by a
	-- GdaDictAggregate object)

inherit
	GDA_QUERY_FIELD
	GDA_ENTITY_FIELD 
	GDA_REFERER
	GDA_RENDERER
	GDA_XML_STORAGE

creation from_external_pointer

feature {} -- Creation

	--  gda_query_field_agg_new ()
	--
	-- GdaQueryField*      gda_query_field_agg_new             (GdaQuery *query,
	--                                                          const gchar *agg_name);
	--
	--   Creates a new GdaQueryFieldAgg object which represents the agg aggregate
	--
	--   query :    a GdaQuery in which the new object will be
	--   agg_name : the name of an aggregate to represent
	--   Returns :  the new object
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_agg_get_ref_agg ()
	--
	-- GdaDictAggregate*   gda_query_field_agg_get_ref_agg     (GdaQueryFieldAgg *agg);
	--
	--   Get the real GdaDictAggregate object used by agg
	--
	--   agg :     a GdaQueryFieldAgg object
	--   Returns : the GdaDictAggregate object, or NULL if agg is not active
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_agg_set_arg ()
	--
	-- gboolean            gda_query_field_agg_set_arg         (GdaQueryFieldAgg *agg,
	--                                                          GdaQueryField *arg);
	--
	--   Sets the argument of agg. If arg is NULL, then the argument (if there was
	--   one) is removed.
	--
	--   If agg is not active, then no check on the provided arg is performed.
	--
	--   agg :     a GdaQueryFieldAgg object
	--   arg :     a GdaQueryField object
	--   Returns : TRUE if no error occurred
	--
	--Properties
	--
	--
	--   "aggregate"                GdaDictAggregate      : Read / Write
	--   "aggregate-id"             gchararray            : Write
	--   "aggregate-name"           gchararray            : Write
	--   "query"                    GdaQuery              : Read / Write / Construct Only

	--Property Details
	--
	--  The "aggregate" property
	--
	--   "aggregate"                GdaDictAggregate      : Read / Write
	--
	--   --------------------------------------------------------------------------
	--
	--  The "aggregate-id" property
	--
	--   "aggregate-id"             gchararray            : Write
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "aggregate-name" property
	--
	--   "aggregate-name"           gchararray            : Write
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "query" property
	--
	--   "query"                    GdaQuery              : Read / Write / Construct Only

feature {}
	--                     GdaQueryFieldAgg;
	-- GdaQueryField*      gda_query_field_agg_new             (GdaQuery *query,
	--                                                          const gchar *agg_name);
	-- GdaDictAggregate*   gda_query_field_agg_get_ref_agg     (GdaQueryFieldAgg *agg);
	-- gboolean            gda_query_field_agg_set_arg         (GdaQueryFieldAgg *agg,
	--                                                          GdaQueryField *arg);
end -- class GDA_QUERY_FIELD_AGG
