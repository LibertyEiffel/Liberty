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

deferred class GDA_ENTITY_FIELD
	-- An interface to represent a generic field (for tables's fields,
	-- etc).

inherit GDA_OBJECT undefine copy, is_equal end
	--   GdaEntityField is implemented by GdaQueryFieldFunc, GdaQueryFieldAgg,
	--   GdaQueryFieldValue, GdaQueryFieldAll, GdaDictField and GdaQueryFieldField.

feature {} -- Creation

	--  gda_entity_field_get_entity ()
	--
	-- GdaEntity*          gda_entity_field_get_entity         (GdaEntityField *iface);
	--
	--   Get a reference to the object implementing the GdaEntity interface to
	--   which the object implementing the GdaEntityField is attached to.
	--
	--   iface :   an object which implements the GdaEntityField interface
	--   Returns : the object implementing the GdaEntity interface
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_entity_field_get_g_type ()
	--
	-- GType               gda_entity_field_get_g_type         (GdaEntityField *iface);
	--
	--   Get the gda type of the object implementing the GdaEntityField interface
	--
	--   iface :   an object which implements the GdaEntityField interface
	--   Returns : the corresponding GType or G_TYPE_INVALID if the gda type is
	--             unknown
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_entity_field_get_dict_type ()
	--
	-- GdaDictType*        gda_entity_field_get_dict_type      (GdaEntityField *iface);
	--
	--   Get the dict type of the object implementing the GdaEntityField interface
	--
	--   iface :   an object which implements the GdaEntityField interface
	--   Returns : the corresponding GdaDictType
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_entity_field_get_name ()
	--
	-- const gchar*        gda_entity_field_get_name           (GdaEntityField *iface);
	--
	--   Get the name of the object implementing the GdaEntityField interface
	--
	--   iface :   an object which implements the GdaEntityField interface
	--   Returns : the name
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_entity_field_get_description ()
	--
	-- const gchar*        gda_entity_field_get_description    (GdaEntityField *iface);
	--
	--   Get the description of the object implementing the GdaEntityField
	--   interface
	--
	--   iface :   an object which implements the GdaEntityField interface
	--   Returns : the description

feature {}
	--                     GdaEntityField;
	-- GdaEntity*          gda_entity_field_get_entity         (GdaEntityField *iface);
	-- GType               gda_entity_field_get_g_type         (GdaEntityField *iface);
	-- GdaDictType*        gda_entity_field_get_dict_type      (GdaEntityField *iface);
	-- const gchar*        gda_entity_field_get_name           (GdaEntityField *iface);
	-- const gchar*        gda_entity_field_get_description    (GdaEntityField *iface);
end -- class GDA_ENTITY_FIELD
