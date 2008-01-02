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

class GDA_QUERY_FIELD_FUNC
	-- GdaQueryFieldFunc represents a function (selected by a
	-- GdaDictFunction object)

inherit
	GDA_QUERY_FIELD
	GDA_ENTITY_FIELD 
	GDA_REFERER
	GDA_RENDERER
	GDA_XML_STORAGE

creation from_external_pointer

feature {} -- Creation
	
	--
	--Properties
	--
	--
	--   "function"                 GdaDictFunction       : Read / Write
	--   "function-id"              gchararray            : Write
	--   "function-name"            gchararray            : Write
	--   "query"                    GdaQuery              : Read / Write / Construct Only
	--
	--Description
	--
	--   The function is applied to zero or more GdaQueryField objects of the same
	--   query
	--
	--Details
	--
	--  GdaQueryFieldFunc
	--
	-- typedef struct _GdaQueryFieldFunc GdaQueryFieldFunc;
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_func_new ()
	--
	-- GdaQueryField*      gda_query_field_func_new            (GdaQuery *query,
	--                                                          const gchar *func_name);
	--
	--   Creates a new GdaQueryFieldFunc object which represents the func_name
	--   function
	--
	--   query :     a GdaQuery in which the new object will be
	--   func_name : the name of the function to use
	--   Returns :   the new object
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_func_get_ref_func ()
	--
	-- GdaDictFunction*    gda_query_field_func_get_ref_func   (GdaQueryFieldFunc *func);
	--
	--   Get the name of the function which func represents
	--
	--   func :    a GdaQueryFieldFunc object
	--   Returns : the function name
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_func_get_ref_func_name ()
	--
	-- const gchar*        gda_query_field_func_get_ref_func_name
	--                                                         (GdaQueryFieldFunc *func);
	--
	--   func :
	--   Returns :
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_func_set_args ()
	--
	-- gboolean            gda_query_field_func_set_args       (GdaQueryFieldFunc *func,
	--                                                          GSList *args);
	--
	--   Sets the argument(s) of func. If args is NULL, then all the arguments (if
	--   there was any) are removed.
	--
	--   If func is not active, then no check on the provided args is performed.
	--
	--   func :    a GdaQueryFieldFunc object
	--   args :    a list of GdaQueryField objects
	--   Returns : TRUE if no error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_func_get_args ()
	--
	-- GSList*             gda_query_field_func_get_args       (GdaQueryFieldFunc *func);
	--
	--   Get a list of the other GdaQueryField objects which are arguments of func.
	--   If some of them are missing, then a NULL is inserted where it should have
	--   been.
	--
	--   func :    a GdaQueryFieldFunc object
	--   Returns : a new list of arguments
	--
	--Property Details
	--
	--  The "function" property
	--
	--   "function"                 GdaDictFunction       : Read / Write
	--
	--   --------------------------------------------------------------------------
	--
	--  The "function-id" property
	--
	--   "function-id"              gchararray            : Write
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "function-name" property
	--
	--   "function-name"            gchararray            : Write
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "query" property
	--
	--   "query"                    GdaQuery              : Read / Write / Construct Only
feature {}
	--                     GdaQueryFieldFunc;
	-- GdaQueryField*      gda_query_field_func_new            (GdaQuery *query,
	--                                                          const gchar *func_name);
	-- GdaDictFunction*    gda_query_field_func_get_ref_func   (GdaQueryFieldFunc *func);
	-- const gchar*        gda_query_field_func_get_ref_func_name
	--                                                         (GdaQueryFieldFunc *func);
	-- gboolean            gda_query_field_func_set_args       (GdaQueryFieldFunc *func,
	--                                                          GSList *args);
	-- GSList*             gda_query_field_func_get_args       (GdaQueryFieldFunc *func);

end -- class GDA_QUERY_FIELD_FUNC
