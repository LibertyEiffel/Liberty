indexing
	description: "."
	copyright: "[
					Copyright (C) 2008 Paolo Redaelli, GDA developers
					
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

deferred class GDA_ENTITY
	-- An interface to represent a generic entity (for tables, views or
	-- queries)

inherit GDA_OBJECT
	-- GdaEntity is implemented by GdaDictTable and GdaQuery.

feature {} -- Creation
	--
	--
	--Description
	--
	--Details
	--
	--  GdaEntity
	--
	-- typedef struct _GdaEntity GdaEntity;
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_entity_has_field ()
	--
	-- gboolean            gda_entity_has_field                (GdaEntity *iface,
	--                                                          GdaEntityField *field);
	--
	--   Tells if field belongs to the iface entity
	--
	--   iface :   an object implementing the GdaEntity interface
	--   field :   an object implementing the GdaEntityField interface
	--   Returns : TRUE if field belongs to the iface entity
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_entity_get_fields ()
	--
	-- GSList*             gda_entity_get_fields               (GdaEntity *iface);
	--
	--   Get a new list containing all the GdaEntityField objects held within the
	--   object implementing the GdaEntity interface.
	--
	--   The returned list nodes are in the order in which the fields are within
	--   the entity.
	--
	--   iface :   an object implementing the GdaEntity interface
	--   Returns : the new list.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_entity_get_n_fields ()
	--
	-- gint                gda_entity_get_n_fields             (GdaEntity *iface);
	--
	--   Get the number of fields in iface
	--
	--   iface :   an object implementing the GdaEntity interface
	--   Returns : the number of fields, or -1 if an error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_entity_get_field_by_name ()
	--
	-- GdaEntityField*     gda_entity_get_field_by_name        (GdaEntity *iface,
	--                                                          const gchar *name);
	--
	--   Get a GdaEntityField using its name. The notion of "field name" is the
	--   string returned by gda_entity_field_get_name() on each of the fields
	--   composing iface. However, if that definition does not return any field,
	--   then each particular implementation of iface may try to give an extra
	--   definition to the notion of "field name".
	--
	--   For instance, in the case of the GdaQuery object, the
	--   gda_entity_field_get_name() is used as a first try to find a field, and if
	--   that fails, then the object tries to find fields from their SQL naming.
	--
	--   In the case where there can be more than one field with the same name
	--   (depending on iface's implementation), then the returned value is NULL.
	--
	--   iface :   an object implementing the GdaEntity interface
	--   name :
	--   Returns : the requested GdaEntityField or NULL if the field cannot be
	--             found, or if more than one field has been found.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_entity_get_field_by_xml_id ()
	--
	-- GdaEntityField*     gda_entity_get_field_by_xml_id      (GdaEntity *iface,
	--                                                          const gchar *xml_id);
	--
	--   iface :   an object implementing the GdaEntity interface
	--   xml_id :
	--   Returns : the requested GdaEntityField
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_entity_get_field_by_index ()
	--
	-- GdaEntityField*     gda_entity_get_field_by_index       (GdaEntity *iface,
	--                                                          gint index);
	--
	--   iface :   an object implementing the GdaEntity interface
	--   index :
	--   Returns : the requested GdaEntityField or NULL if the index is out of
	--             bounds
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_entity_get_field_index ()
	--
	-- gint                gda_entity_get_field_index          (GdaEntity *iface,
	--                                                          GdaEntityField *field);
	--
	--   Get the position of the field in the given entity. Positions start at 0.
	--   field MUST be a visible field.
	--
	--   iface :   an object implementing the GdaEntity interface
	--   field :   an object implementing the GdaEntityField interface
	--   Returns : the position or -1 if the field is not in the entity or is not
	--             visible
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_entity_add_field ()
	--
	-- void                gda_entity_add_field                (GdaEntity *iface,
	--                                                          GdaEntityField *field);
	--
	--   Add field to iface's fields (at the end of the list)
	--
	--   iface : an object implementing the GdaEntity interface
	--   field : an object implementing the GdaEntityField interface to add
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_entity_add_field_before ()
	--
	-- void                gda_entity_add_field_before         (GdaEntity *iface,
	--                                                          GdaEntityField *field,
	--                                                          GdaEntityField *field_before);
	--
	--   Add field to iface's fields, before field_before if it is not NULL, or at
	--   the end if field_before is NULL.
	--
	--   iface :        an object implementing the GdaEntity interface
	--   field :        an object implementing the GdaEntityField interface to add
	--   field_before : an object implementing the GdaEntityField interface before
	--                  which field will be added, or NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_entity_swap_fields ()
	--
	-- void                gda_entity_swap_fields              (GdaEntity *iface,
	--                                                          GdaEntityField *field1,
	--                                                          GdaEntityField *field2);
	--
	--   iface :  an object implementing the GdaEntity interface
	--   field1 : an object implementing the GdaEntityField interface
	--   field2 : an object implementing the GdaEntityField interface
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_entity_remove_field ()
	--
	-- void                gda_entity_remove_field             (GdaEntity *iface,
	--                                                          GdaEntityField *field);
	--
	--   iface : an object implementing the GdaEntity interface
	--   field : an object implementing the GdaEntityField interface to remove
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_entity_is_writable ()
	--
	-- gboolean            gda_entity_is_writable              (GdaEntity *iface);
	--
	--   Tells if the real entity (the corresponding DBMS object) represented by
	--   iface can be written to.
	--
	--   iface :   an object implementing the GdaEntity interface
	--   Returns : TRUE if it is possible to write to iface
	--
	--Signals
	--
	--
	--   "field-added"                                    : Run First
	--   "field-removed"                                  : Run First
	--   "field-updated"                                  : Run First
	--   "fields-order-changed"                           : Run First

	--Signal Details
	--
	--  The "field-added" signal
	--
	-- void                user_function                      (GdaEntity      *gdaentity,
	--                                                         GdaEntityField *arg1,
	--                                                         gpointer        user_data)      : Run First
	--
	--   dbentity :  the object which received the signal.
	--   arg1 :
	--   user_data : user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "field-removed" signal
	--
	-- void                user_function                      (GdaEntity      *gdaentity,
	--                                                         GdaEntityField *arg1,
	--                                                         gpointer        user_data)      : Run First
	--
	--   dbentity :  the object which received the signal.
	--   arg1 :
	--   user_data : user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "field-updated" signal
	--
	-- void                user_function                      (GdaEntity      *gdaentity,
	--                                                         GdaEntityField *arg1,
	--                                                         gpointer        user_data)      : Run First
	--
	--   dbentity :  the object which received the signal.
	--   arg1 :
	--   user_data : user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "fields-order-changed" signal
	--
	-- void                user_function                      (GdaEntity *gdaentity,
	--                                                         gpointer   user_data)      : Run First
	--
	--   dbentity :  the object which received the signal.
	--   user_data : user data set when the signal handler was connected.

feature {}
	--                     GdaEntity;
	-- gboolean            gda_entity_has_field                (GdaEntity *iface,
	--                                                          GdaEntityField *field);
	-- GSList*             gda_entity_get_fields               (GdaEntity *iface);
	-- gint                gda_entity_get_n_fields             (GdaEntity *iface);
	-- GdaEntityField*     gda_entity_get_field_by_name        (GdaEntity *iface,
	--                                                          const gchar *name);
	-- GdaEntityField*     gda_entity_get_field_by_xml_id      (GdaEntity *iface,
	--                                                          const gchar *xml_id);
	-- GdaEntityField*     gda_entity_get_field_by_index       (GdaEntity *iface,
	--                                                          gint index);
	-- gint                gda_entity_get_field_index          (GdaEntity *iface,
	--                                                          GdaEntityField *field);
	-- void                gda_entity_add_field                (GdaEntity *iface,
	--                                                          GdaEntityField *field);
	-- void                gda_entity_add_field_before         (GdaEntity *iface,
	--                                                          GdaEntityField *field,
	--                                                          GdaEntityField *field_before);
	-- void                gda_entity_swap_fields              (GdaEntity *iface,
	--                                                          GdaEntityField *field1,
	--                                                          GdaEntityField *field2);
	-- void                gda_entity_remove_field             (GdaEntity *iface,
	--                                                          GdaEntityField *field);
	-- gboolean            gda_entity_is_writable              (GdaEntity *iface);
end -- class GDA_ENTITY
