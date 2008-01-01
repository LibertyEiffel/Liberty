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

class GDA_QUERY_FIELD
	--   GdaQueryField, parent class for any query's field

inherit GDA_QUERY_OBJECT redefine copy, struct_size end

insert GDA_QUERY_FIELD_STATE

creation copy, from_sql, from_external_pointer

feature -- Creation
	-- TODO: gda_query_field_new_from_xml ()
	
	-- GdaQueryField*      gda_query_field_new_from_xml        (GdaQuery *query,
	--                                                          xmlNodePtr node,
	--                                                          GError **error);
	
	--   This is an object factory which does create instances of class inheritants
	--   of the GnomeDbDfield class. Ths GdaQueryField object MUST then be attached
	--   to query
	
	--   query :   a GdaQuery object
	--   node :    an XML node corresponding to a GDA_QUERY_FIELD tag
	--   error :   location to store error, or NULL
	--   Returns : the newly created object
	--
	
	copy (another: like Current) is
			-- Copy constructor
		do
			from_external_pointer(gda_query_field_new_copy(another.handle))
		end

	
	from_sql (a_query: GDA_QUERY; an_sql_field: STRING) is
			-- A new GdaQueryField from its SQL representation If an
			-- error occurred, Current will be invalid (i.e. `is_null' is
			-- True); `error' is updated.
		require 
			query_not_void: a_query/=Void
			field_not_void: an_sql_field/=Void
		local p: POINTER
		do
			p:=gda_query_field_new_from_sql(a_query.handle, an_sql_field.to_external,
														 address_of(error.handle))
			if p.is_not_null then from_external_pointer(p) end
		end

feature	
	set_alias (an_alias: STRING) is
			--   Sets qfield's alias
		require alias_not_void: an_alias/=Void
		do
			gda_query_field_set_alias(handle,an_alias.to_external)
		end

	field_alias: CONST_STRING is 
			--The alias of Current query field.
		do
			create Result.from_external(gda_query_field_get_alias(handle))
		end

	--  gda_query_field_set_visible ()
	--
	-- void                gda_query_field_set_visible         (GdaQueryField *qfield,
	--                                                          gboolean visible);
	--
	--   Sets the visibility of qfield. A visible field will appear in the query's
	--   corresponding (virtual) entity, whereas a non visible one will be hidden
	--   (and possibly not taking part in the query).
	--
	--   qfield :  a GdaQueryField object
	--   visible :
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_is_visible ()
	--
	-- gboolean            gda_query_field_is_visible          (GdaQueryField *qfield);
	--
	--   qfield :  a GdaQueryField object
	--   Returns : TRUE if field is visible
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_set_internal ()
	--
	-- void                gda_query_field_set_internal        (GdaQueryField *qfield,
	--                                                          gboolean internal);
	--
	--   Sets weather qfield is internal or not. Internal fields in a query are
	--   fields added or changed by libgnomedb itself, such fields may or may not
	--   be visible.
	--
	--   qfield :   a GdaQueryField object
	--   internal :
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_is_internal ()
	--
	-- gboolean            gda_query_field_is_internal         (GdaQueryField *qfield);
	--
	--   qfield :  a GdaQueryField object
	--   Returns : TRUE if field is internal
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_get_dict_type ()
	--
	-- GdaDictType*        gda_query_field_get_dict_type       (GdaQueryField *qfield);
	--
	--   Get the GdaDictType represented by the qfield object: for a function it
	--   returns the return type, for a value, it returns its type, etc.
	--
	--   qfield :  a GdaQueryField object
	--   Returns : the data type, or NULL if qfield does not have a data type.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_get_parameters ()
	--
	-- GSList*             gda_query_field_get_parameters      (GdaQueryField *qfield);
	--
	--   Get a list of all the parameters needed to qfield to be rendered as a
	--   valid statement
	--
	--   qfield :  a GdaQueryField object
	--   Returns : a new list of parameters for qfield
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_is_equal ()
	--
	-- gboolean            gda_query_field_is_equal            (GdaQueryField *qfield1,
	--                                                          GdaQueryField *qfield2);
	--
	--   Compares the qfield1 and qfield2. The name and aliases of the two fields
	--   are not compared, only the contents of the fields are.
	--
	--   qfield1 : a GdaQueryField object
	--   qfield2 : a GdaQueryField object
	--   Returns : TRUE if they are equal and FALSE otherwise
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_field_is_list ()
	--
	-- gboolean            gda_query_field_is_list             (GdaQueryField *qfield);
	--
	--   Tells if qfield can potentially represent a list of values.
	--
	--   qfield :  a GdaQueryField object
	--   Returns : TRUE if field can be a list of values

feature -- size
	dummy_gobject: POINTER is do unimplemented end

	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaQueryField)"
		end

feature {} -- External calls
	-- enum GdaQueryFieldState;

	--TODO: GdaQueryField* gda_query_field_new_from_xml (GdaQuery *query, xmlNodePtr node, GError **error);

	gda_query_field_new_copy (an_orig: POINTER): POINTER is
			-- GdaQueryField* gda_query_field_new_copy (GdaQueryField *orig);
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_new_from_sql (a_query, an_sqlfield, an_error_ref: POINTER): POINTER is
			-- GdaQueryField* gda_query_field_new_from_sql (GdaQuery *query, const gchar *sqlfield, GError **error);
		external "C use <libgda/libgda.h>"
		end
	
	gda_query_field_set_alias (a_field, an_alias: POINTER) is
			-- void gda_query_field_set_alias (GdaQueryField *qfield, const gchar *alias);
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_get_alias (a_field: POINTER): POINTER is
			-- const gchar* gda_query_field_get_alias (GdaQueryField *qfield);
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_set_visible (a_field: POINTER; a_visible_bool: INTEGER) is
			-- void gda_query_field_set_visible (GdaQueryField *qfield, gboolean visible);
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_is_visible (a_field: POINTER): INTEGER is
			-- gboolean gda_query_field_is_visible (GdaQueryField *qfield);
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_set_internal (a_field: POINTER; an_internal_bool: INTEGER) is
			-- void gda_query_field_set_internal (GdaQueryField *qfield, gboolean internal);
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_is_internal (a_field: POINTER): INTEGER is
			-- gboolean gda_query_field_is_internal (GdaQueryField *qfield);
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_get_dict_type (a_field: POINTER): POINTER is
			-- GdaDictType* gda_query_field_get_dict_type (GdaQueryField *qfield);
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_get_parameters (a_field: POINTER): POINTER is
			-- GSList* gda_query_field_get_parameters (GdaQueryField *qfield);
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_is_equal (a_field, another: POINTER): INTEGER is
			-- gboolean gda_query_field_is_equal (GdaQueryField *qfield1, GdaQueryField *qfield2);
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_is_list (a_field: POINTER): INTEGER is
			-- gboolean gda_query_field_is_list (GdaQueryField *qfield);
		external "C use <libgda/libgda.h>"
		end

end -- class GDA_QUERY_FIELD
