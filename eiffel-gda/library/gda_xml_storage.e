indexing
	description: "GdaXmlStorage Interface which provides saving and loading using XML structures"
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

deferred class GDA_XML_STORAGE
	-- GdaXmlStorage Interface which provides saving and loading using
	-- XML structures

	-- Any object which implements this interface can be streamed and
	-- restored to and from an XML file.
inherit GDA_OBJECT
	-- Known Implementations: GdaXmlStorage is implemented by
	-- GdaGraphItem, GdaQueryFieldFunc, GdaQueryJoin, GdaDictDatabase,
	-- GdaQueryFieldAgg, GdaGraphQuery, GdaDictConstraint,
	-- GdaDictAggregate, GdaGraph, GdaDictFunction, GdaQueryFieldValue,
	-- GdaQueryCondition, GdaQueryFieldAll, GdaQueryTarget,
	-- GdaDictType, GdaDictTable, GdaDictField, GdaQuery and
	-- GdaQueryFieldField.

feature 

	--  gda_xml_storage_get_xml_id ()
	--
	-- gchar*              gda_xml_storage_get_xml_id          (GdaXmlStorage *iface);
	--
	--   Fetch the xml id string of the object, it's up to the caller to free the
	--   string.
	--
	--   iface :   an object which implements the GdaXmlStorage interface
	--   Returns : the xml id.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_xml_storage_save_to_xml ()
	--
	-- xmlNodePtr          gda_xml_storage_save_to_xml         (GdaXmlStorage *iface,
	--                                                          GError **error);
	--
	--   Creates a new xmlNodePtr structure and fills it with data representing the
	--   object given as argument.
	--
	--   iface :   an object which implements the GdaXmlStorage interface
	--   error :   location to store error, or NULL
	--   Returns : the new XML node, or NULL if an error occurred.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_xml_storage_load_from_xml ()
	--
	-- gboolean            gda_xml_storage_load_from_xml       (GdaXmlStorage *iface,
	--                                                          xmlNodePtr node,
	--                                                          GError **error);
	--
	--   Updates the object with data stored in the XML node. The object MUST
	--   already exist and be of the correct type before calling this function.
	--   This is a virtual function.
	--
	--   iface :   an object which implements the GdaXmlStorage interface
	--   node :    an XML node from an XML structure
	--   error :   location to store error, or NULL
	--   Returns : TRUE if no error occurred.

feature {} -- External calls

	-- gchar*              gda_xml_storage_get_xml_id          (GdaXmlStorage *iface);
	-- xmlNodePtr          gda_xml_storage_save_to_xml         (GdaXmlStorage *iface,  GError **error);
	-- gboolean            gda_xml_storage_load_from_xml       (GdaXmlStorage *iface,  xmlNodePtr node, GError **error);


end -- class GDA_XML_STORAGE
