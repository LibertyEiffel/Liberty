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

class GDA_QUERY_TARGET
	-- GdaQueryTarget represents a target entity within a query.

	-- A GdaQueryTarget object represents an entity (usually a table,
	-- as a GdaDictTable) which is taking part in a query. For SELECT
	-- queries, the targets are the entities listed after the FROM
	-- clause; for the INSERT, DELETE and UPDATE queries, there is only
	-- one target which is the entity to which the modifications apply.

	-- Within a single SELECT query, there can be more than one
	-- GdaQueryTarget object representing the same entity for queries
	-- making usage of an entity more than one time.

inherit
	GDA_QUERY_OBJECT
	
	GDA_REFERER
	GDA_RENDERER
	GDA_XML_STORAGE

creation from_external_pointer

feature {} -- Creation
	--  gda_query_target_new ()
	--
	-- GdaQueryTarget*     gda_query_target_new                (GdaQuery *query,
	--                                                          const gchar *table);
	--
	--   Creates a new GdaQueryTarget object, specifying the name of the table to
	--   reference.
	--
	--   query :   a GdaQuery object
	--   table :   the name of the table to reference
	--   Returns : the new object
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_target_new_copy ()
	--
	-- GdaQueryTarget*     gda_query_target_new_copy           (GdaQueryTarget *orig);
	--
	--   Makes a copy of an existing object (copy constructor)
	--
	--   orig :    a GdaQueryTarget object to copy
	--   Returns : the new object
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_target_get_query ()
	--
	-- GdaQuery*           gda_query_target_get_query          (GdaQueryTarget *target);
	--
	--   Get the GdaQuery in which target is
	--
	--   target :  a GdaQueryTarget object
	--   Returns : the GdaQuery object
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_target_get_represented_table_name ()
	--
	-- const gchar*        gda_query_target_get_represented_table_name
	--                                                         (GdaQueryTarget *target);
	--
	--   Get the table name represented by target
	--
	--   target :  a GdaQueryTarget object
	--   Returns : the table name or NULL if target does not represent a database
	--             table
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_target_get_represented_entity ()
	--
	-- GdaEntity*          gda_query_target_get_represented_entity
	--                                                         (GdaQueryTarget *target);
	--
	--   Get the GdaEntity object which is represented by target
	--
	--   target :  a GdaQueryTarget object
	--   Returns : the GdaEntity object or NULL if target is not active
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_target_set_alias ()
	--
	-- void                gda_query_target_set_alias          (GdaQueryTarget *target,
	--                                                          const gchar *alias);
	--
	--   Sets target's alias to alias
	--
	--   target : a GdaQueryTarget object
	--   alias :  the alias
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_target_get_alias ()
	--
	-- const gchar*        gda_query_target_get_alias          (GdaQueryTarget *target);
	--
	--   Get target's alias
	--
	--   target :  a GdaQueryTarget object
	--   Returns : the alias
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_target_get_complete_name ()
	--
	-- gchar*              gda_query_target_get_complete_name  (GdaQueryTarget *target);
	--
	--   Get a complete name for target in the form of "<entity name> AS <target
	--   alias>"
	--
	--   target :  a GdaQueryTarget object
	--   Returns : a new string
	--
	--Properties
	--
	--
	--   "entity"                   GdaEntity             : Read / Write
	--   "entity-id"                gchararray            : Write
	--   "entity-name"              gchararray            : Write
	--   "query"                    GdaQuery              : Read / Write / Construct Only

	--Property Details
	--
	--  The "entity" property
	--
	--   "entity"                   GdaEntity             : Read / Write
	--
	--   --------------------------------------------------------------------------
	--
	--  The "entity-id" property
	--
	--   "entity-id"                gchararray            : Write
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "entity-name" property
	--
	--   "entity-name"              gchararray            : Write
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "query" property
	--
	--   "query"                    GdaQuery              : Read / Write / Construct Only
feature
	dummy_gobject: POINTER is do unimplemented end
	
feature {} -- External calls
	--                     GdaQueryTarget;
	-- GdaQueryTarget*     gda_query_target_new                (GdaQuery *query,
	--                                                          const gchar *table);
	-- GdaQueryTarget*     gda_query_target_new_copy           (GdaQueryTarget *orig);
	-- GdaQuery*           gda_query_target_get_query          (GdaQueryTarget *target);
	-- const gchar*        gda_query_target_get_represented_table_name
	--                                                         (GdaQueryTarget *target);
	-- GdaEntity*          gda_query_target_get_represented_entity
	--                                                         (GdaQueryTarget *target);
	-- void                gda_query_target_set_alias          (GdaQueryTarget *target,
	--                                                          const gchar *alias);
	-- const gchar*        gda_query_target_get_alias          (GdaQueryTarget *target);
	-- gchar*              gda_query_target_get_complete_name  (GdaQueryTarget *target);
	--

end -- class GDA_QUERY_TARGET
