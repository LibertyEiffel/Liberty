indexing
	description: "."
	copyright: "[
					Copyright (C) 2007 $EWLC_developer, $original_copyright_holder
					
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

class GDA_QUERY_FIELD_FIELD
	-- GdaQueryFieldField represents one field of an entity (through a
	-- GdaQueryTarget object)

inherit
	GDA_QUERY_FIELD

	GDA_ENTITY_FIELD
	GDA_REFERER
	GDA_RENDERER
	GDA_XML_STORAGE 

creation from_external_pointer

feature {} -- Creation
	--  gda_query_field_field_new ()
	--
	-- GdaQueryField*      gda_query_field_field_new           (GdaQuery *query,
	--                                                          const gchar *field);
	--
	--   Creates a new GdaQueryFieldField object which represents a given field.
	--   field can be among the following forms:
	--
	--     o field_name
	--
	--     o table_name.field_name
	--
	--   query :   a GdaQuery in which the new object will be
	--   field :   the name of the field to represent
	--   Returns : the new object
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_field_get_ref_field_name ()
	--
	-- gchar*              gda_query_field_field_get_ref_field_name
	--                                                         (GdaQueryFieldField *field);
	--
	--   Get the real name of the represented field. The returned name can be in
	--   either forms:
	--
	--     o field_name
	--
	--     o table_name.field_name
	--
	--   field :   a GdaQueryFieldField object
	--   Returns : represented field name (free the memory after usage)
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_field_get_ref_field ()
	--
	-- GdaEntityField*     gda_query_field_field_get_ref_field (GdaQueryFieldField *field);
	--
	--   Get the real GdaEntityField object (well, the object which implements that
	--   interface) referenced by field
	--
	--   field :   a GdaQueryFieldField object
	--   Returns : the GdaEntityField object, or NULL if field is not active
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_field_get_target ()
	--
	-- GdaQueryTarget*     gda_query_field_field_get_target    (GdaQueryFieldField *field);
	--
	--   Get the GdaQueryTarget object field 'belongs' to
	--
	--   field :   a GdaQueryFieldField object
	--   Returns : the GdaQueryTarget object
	--
	--Properties
	--
	--
	--   "entry-plugin"             gchararray            : Read / Write
	--   "field"                    GdaEntityField        : Read / Write
	--   "field-id"                 gchararray            : Write
	--   "field-name"               gchararray            : Read / Write
	--   "query"                    GdaQuery              : Read / Write / Construct Only
	--   "target"                   GdaQueryTarget        : Read / Write
	--   "target-id"                gchararray            : Write
	--   "target-name"              gchararray            : Write
	--   "value-provider"           GdaQueryField         : Read / Write
	--   "value-provider-xml-id"    gchararray            : Read / Write

	--Property Details
	--
	--  The "entry-plugin" property
	--
	--   "entry-plugin"             gchararray            : Read / Write
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "field" property
	--
	--   "field"                    GdaEntityField        : Read / Write
	--
	--   --------------------------------------------------------------------------
	--
	--  The "field-id" property
	--
	--   "field-id"                 gchararray            : Write
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "field-name" property
	--
	--   "field-name"               gchararray            : Read / Write
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
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
	--
	--   --------------------------------------------------------------------------
	--
	--  The "value-provider" property
	--
	--   "value-provider"           GdaQueryField         : Read / Write
	--
	--   --------------------------------------------------------------------------
	--
	--  The "value-provider-xml-id" property
	--
	--   "value-provider-xml-id"    gchararray            : Read / Write
	--
	--   Default value: NULL
feature {} -- External calls
	--                     GdaQueryFieldField;
	-- GdaQueryField*      gda_query_field_field_new           (GdaQuery *query,
	--                                                          const gchar *field);
	-- gchar*              gda_query_field_field_get_ref_field_name
	--                                                         (GdaQueryFieldField *field);
	-- GdaEntityField*     gda_query_field_field_get_ref_field (GdaQueryFieldField *field);
	-- GdaQueryTarget*     gda_query_field_field_get_target    (GdaQueryFieldField *field);

end -- class GDA_QUERY_FIELD_FIELD
