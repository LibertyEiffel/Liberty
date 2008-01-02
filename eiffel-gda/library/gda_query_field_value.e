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

class GDA_QUERY_FIELD_VALUE
	-- GdaQueryFieldValue represents a single value (or a parameter).

	-- The value held in this object can be of any type (a GdaDictType
	-- object must be provided when creating the object). If the value
	-- can be considered as a parameter, then the possible values for
	-- this parameter can be limited by the result of the execution of
	-- a sub query (use the "value_provider*" properties to tell from
	-- which query field the values will be taken).

inherit
	GDA_QUERY_FIELD
	GDA_ENTITY_FIELD
	GDA_REFERER
	GDA_RENDERER
	GDA_XML_STORAGE

creation from_external_pointer

feature {} -- Creation
	--
	--Details
	--
	--  GdaQueryFieldValue
	--
	-- typedef struct _GdaQueryFieldValue GdaQueryFieldValue;
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_value_new ()
	--
	-- GdaQueryField*      gda_query_field_value_new           (GdaQuery *query,
	--                                                          GType type);
	--
	--   Creates a new GdaQueryFieldValue object which represents a value or a
	--   parameter.
	--
	--   query :   a GdaQuery in which the new object will be
	--   type :    the GDA type for the value
	--   Returns : the new object
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_value_set_value ()
	--
	-- void                gda_query_field_value_set_value     (GdaQueryFieldValue *field,
	--                                                          const GValue *val);
	--
	--   Sets the value of field, or removes it (if val is NULL)
	--
	--   field : a GdaQueryFieldValue object
	--   val :   the value to be set, or NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_value_get_value ()
	--
	-- const GValue*       gda_query_field_value_get_value     (GdaQueryFieldValue *field);
	--
	--   Get the value stored by field. If there is no value, but a default value
	--   exists, then the default value is returned.n it's up to the caller to test
	--   if there is a default value for field. The default value can be of a
	--   different type than the one expected by field.
	--
	--   field :   a GdaQueryFieldValue object
	--   Returns : the value or NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_value_set_default_value ()
	--
	-- void                gda_query_field_value_set_default_value
	--                                                         (GdaQueryFieldValue *field,
	--                                                          const GValue *default_val);
	--
	--   Sets the default value of field, or removes it (if default_val is NULL)
	--
	--   field :       a GdaQueryFieldValue object
	--   default_val : the default value to be set, or NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_value_get_default_value ()
	--
	-- const GValue*       gda_query_field_value_get_default_value
	--                                                         (GdaQueryFieldValue *field);
	--
	--   Get the default value stored by field.
	--
	--   field :   a GdaQueryFieldValue object
	--   Returns : the value or NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_value_set_is_parameter ()
	--
	-- void                gda_query_field_value_set_is_parameter
	--                                                         (GdaQueryFieldValue *field,
	--                                                          gboolean is_param);
	--
	--   Sets wether field can be considered as a parameter
	--
	--   field :    a GdaQueryFieldValue object
	--   is_param :
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_value_get_is_parameter ()
	--
	-- gboolean            gda_query_field_value_get_is_parameter
	--                                                         (GdaQueryFieldValue *field);
	--
	--   Tells if field can be considered as a parameter
	--
	--   field :   a GdaQueryFieldValue object
	--   Returns : TRUE if field can be considered as a parameter
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_value_get_parameter_index ()
	--
	-- gint                gda_query_field_value_get_parameter_index
	--                                                         (GdaQueryFieldValue *field);
	--
	--   Get the index of field in the query it belongs, among all the parameters.
	--
	--   field :   a GdaQueryFieldValue object
	--   Returns : the index (starting at 1), or -1 if field is not a parameter
	--             field.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_value_set_not_null ()
	--
	-- void                gda_query_field_value_set_not_null  (GdaQueryFieldValue *field,
	--                                                          gboolean not_null);
	--
	--   Sets if a NULL value is acceptable for field. If not_null is TRUE, then
	--   field can't have a NULL value.
	--
	--   field :    a GdaQueryFieldValue object
	--   not_null :
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_value_get_not_null ()
	--
	-- gboolean            gda_query_field_value_get_not_null  (GdaQueryFieldValue *field);
	--
	--   Tells if field can receive a NULL value.
	--
	--   field :   a GdaQueryFieldValue object
	--   Returns : TRUE if field can't have a NULL value
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_value_is_value_null ()
	--
	-- gboolean            gda_query_field_value_is_value_null (GdaQueryFieldValue *field,
	--                                                          GdaParameterList *context);
	--
	--   Tells if field represents a NULL value.
	--
	--   field :   a GdaQueryFieldValue object
	--   context : a GdaParameterList object
	--   Returns :
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_value_restrict ()
	--
	-- gboolean            gda_query_field_value_restrict      (GdaQueryFieldValue *field,
	--                                                          GdaDataModel *model,
	--                                                          gint col,
	--                                                          GError **error);
	--
	--   Restricts the possible values which field can have among the calues stored
	--   in model at column col.
	--
	--   field :   a GdaQueryFieldValue object
	--   model :   a GdaDataModel object
	--   col :     a valid column in model
	--   error :   a place to store errors, or NULL
	--   Returns : TRUE if no error occurred
	--
	--Properties
	--
	--
	--   "entry-plugin"             gchararray            : Read / Write
	--   "g-type"                   gulong                : Read / Write
	--   "is-parameter"             gboolean              : Read / Write
	--   "query"                    GdaQuery              : Read / Write / Construct Only
	--   "restrict-column"          gint                  : Read / Write
	--   "restrict-model"           GdaDataModel          : Read / Write
	--   "string-type"              gchararray            : Read / Write
	--
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
	--  The "g-type" property
	--
	--   "g-type"                   gulong                : Read / Write
	--
	--   --------------------------------------------------------------------------
	--
	--  The "is-parameter" property
	--
	--   "is-parameter"             gboolean              : Read / Write
	--
	--   Default value: FALSE
	--
	--   --------------------------------------------------------------------------
	--
	--  The "query" property
	--
	--   "query"                    GdaQuery              : Read / Write / Construct Only
	--
	--   --------------------------------------------------------------------------
	--
	--  The "restrict-column" property
	--
	--   "restrict-column"          gint                  : Read / Write
	--
	--   Allowed values: >= 0
	--
	--   Default value: 0
	--
	--   --------------------------------------------------------------------------
	--
	--  The "restrict-model" property
	--
	--   "restrict-model"           GdaDataModel          : Read / Write
	--
	--   --------------------------------------------------------------------------
	--
	--  The "string-type" property
	--
	--   "string-type"              gchararray            : Read / Write
	--
	--   Default value: NULL

feature {}
	--                     GdaQueryFieldValue;
	-- GdaQueryField*      gda_query_field_value_new           (GdaQuery *query,
	--                                                          GType type);
	-- void                gda_query_field_value_set_value     (GdaQueryFieldValue *field,
	--                                                          const GValue *val);
	-- const GValue*       gda_query_field_value_get_value     (GdaQueryFieldValue *field);
	-- void                gda_query_field_value_set_default_value
	--                                                         (GdaQueryFieldValue *field,
	--                                                          const GValue *default_val);
	-- const GValue*       gda_query_field_value_get_default_value
	--                                                         (GdaQueryFieldValue *field);
	-- void                gda_query_field_value_set_is_parameter
	--                                                         (GdaQueryFieldValue *field,
	--                                                          gboolean is_param);
	-- gboolean            gda_query_field_value_get_is_parameter
	--                                                         (GdaQueryFieldValue *field);
	-- gint                gda_query_field_value_get_parameter_index
	--                                                         (GdaQueryFieldValue *field);
	-- void                gda_query_field_value_set_not_null  (GdaQueryFieldValue *field,
	--                                                          gboolean not_null);
	-- gboolean            gda_query_field_value_get_not_null  (GdaQueryFieldValue *field);
	-- gboolean            gda_query_field_value_is_value_null (GdaQueryFieldValue *field,
	--                                                          GdaParameterList *context);
	-- gboolean            gda_query_field_value_restrict      (GdaQueryFieldValue *field,
	--                                                          GdaDataModel *model,
	--                                                          gint col,
	--                                                          GError **error);

end -- class GDA_QUERY_FIELD_VALUE
