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

class GDA_QUERY_FIELD_ALL
	-- GdaQueryFieldAll represents all the fields of an entity (through
	-- a GdaQueryTarget object)

inherit
	GDA_QUERY_FIELD
	GDA_XML_STORAGE
	GDA_REFERER
	GDA_ENTITY_FIELD
	GDA_RENDERER

creation from_external_pointer

feature {} -- Creation
	--
	--Description
	--
	--Details
	--
	--  GdaQueryFieldAll
	--
	-- typedef struct _GdaQueryFieldAll GdaQueryFieldAll;
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_all_new ()
	--
	-- GdaQueryField*      gda_query_field_all_new             (GdaQuery *query,
	--                                                          const gchar *target);
	--
	--   Creates a new GdaQueryFieldAll object which represents all the fields of
	--   the entity represented by a target.
	--
	--   query :   a GdaQuery in which the new object will be
	--   target :  the target's name or alias
	--   Returns : the new object
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_all_get_target ()
	--
	-- GdaQueryTarget*     gda_query_field_all_get_target      (GdaQueryFieldAll *field);
	--
	--   Get the GdaQueryTarget object field 'belongs' to
	--
	--   field :   a GdaQueryFieldAll object
	--   Returns : the GdaQueryTarget object
	--
	--Properties
	--
	--   "query"                    GdaQuery              : Read / Write / Construct Only
	--   "target"                   GdaQueryTarget        : Read / Write
	--   "target-id"                gchararray            : Write
	--   "target-name"              gchararray            : Write

	--Property Details
	--
	--  The "query" property
	--
	--   "query"                    GdaQuery              : Read / Write / Construct Only
	--
	--   --------------------------------------------------------------------------
	--
	--  The "target" property
	--
	--   "target"                   GdaQueryTarget        : Read / Write
	--
	--   --------------------------------------------------------------------------
	--
	--  The "target-id" property
	--
	--   "target-id"                gchararray            : Write
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "target-name" property
	--
	--   "target-name"              gchararray            : Write
	--
	--   Default value: NULL

feature {} -- External calls
	--                     GdaQueryFieldAll;
	-- GdaQueryField*      gda_query_field_all_new             (GdaQuery *query,
	--                                                          const gchar *target);
	-- GdaQueryTarget*     gda_query_field_all_get_target      (GdaQueryFieldAll *field);

end -- class GDA_QUERY_FIELD_ALL
