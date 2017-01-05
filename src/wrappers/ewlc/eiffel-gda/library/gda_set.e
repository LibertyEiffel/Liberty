note
	description: "."
	copyright: "[
					Copyright (C) 2008-2017: Paolo Redaelli
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

	wrapped_version: "Unknown"

class GDA_SET
	-- Container for several values

	-- The GdaSet object is a container for several values (as GdaHolder
	-- objects), which also offers different classifications of the group of
	-- GdaHolder values.

inherit
	G_OBJECT
		redefine
			copy
		end

insert
	GDA_SET_EXTERNALS
	SHARED_G_ERROR

create {ANY} make, from_external_pointer

feature {} -- Creation
	make (some_holders: G_SLIST[GDA_HOLDER])
		-- Creates a new GDA_SET object, and populates it with `some_holders'. 
	do
		-- The list can then be freed as it is copied. All the value holders in
		-- holders are referenced counted and modified, so they should not be
		-- used anymore afterwards.
		from_external_pointer(gda_set_new (some_holders.handle))
	end

feature {ANY}
	copy (another: like Current)
		--
	do
		from_external_pointer(gda_set_copy(another.handle))
	end
	
	-- from_spec_string (an_xml_spec: )
	--
	-- GdaSet*             gda_set_new_from_spec_string        (const gchar *xml_spec,
	--                                                          GError **error);
	--
	--   Creates a new GdaSet object from the xml_spec specifications
	--
	--   xml_spec : a string
	--   error :    a place to store the error, or NULL
	--   Returns :  a new object, or NULL if an error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_set_new_from_spec_node ()
	--
	-- GdaSet*             gda_set_new_from_spec_node          (xmlNodePtr xml_spec,
	--                                                          GError **error);
	--
	--   Creates a new GdaSet object from the xml_spec specifications
	--
	--   xml_spec : a xmlNodePtr for a <holders> tag
	--   error :    a place to store the error, or NULL
	--   Returns :  a new object, or NULL if an error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_set_get_spec ()
	--
	-- gchar*              gda_set_get_spec                    (GdaSet *set);
	--
	--   Get the specification as an XML string. See the
	--   gda_set_new_from_spec_string() form more information about the XML
	--   specification string format.
	--
	--   set :     a GdaSet object
	--   Returns : a new string
	--
feature {ANY}
	holder (an_id: STRING): GDA_HOLDER
		-- The GDA_HOLDER with `an_id'; Void if cannot be found.
	require an_id/=Void
	local p: POINTER
	do
		p:= gda_set_get_holder(handle, an_id.to_external)
		if p.is_not_null then
			create Result.from_external_pointer(p)
		end
	end

	add_holder (an_holder: GDA_HOLDER)
		-- Adds holder to the list of holders managed within set.
	
		-- NOTE: if set already has a GdaHolder with the same ID as holder,
		-- then holder will not be added to the set (even if holder's type or
		-- value is not the same as the one already in set).

		-- `is_successful' will be True if `an_holder' has been added to set
		-- (and False if it has not been added because there is another
		-- GdaHolder with the same ID)
	require an_holder/=Void
	do
		is_successful := gda_set_add_holder
		(handle, an_holder.handle).to_boolean
	end

	remove_holder (an_holder: GDA_HOLDER)
		-- Remove `an_holder' from Current set.
	require an_holder/=Void
	do
		gda_set_remove_holder(handle, an_holder.handle)
	end

	merge_with (another: GDA_SET)
		-- Add to Current set all the holders of `another' set. Note1: only the
		-- GDA_HOLDER of `another' for which no holder in set has the same ID
		-- are merged Note2: all the GDA_HOLDER merged in set are still used by
		-- set_to_merge.
	require
		another/=Void
	do
		gda_set_merge_with_set(handle, another.handle)
	end

	is_valid: BOOLEAN
		-- Do all holders of Current have valid data?
		do
			Result:= gda_set_is_valid(handle).to_boolean
		end

		--  gda_set_get_node ()
	--
	-- GdaSetNode*         gda_set_get_node                    (GdaSet *set,
	--                                                          GdaHolder *param);
	--
	--   Finds a GdaSetNode holding information for holder, don't modify the
	--   returned structure
	--
	--   set :     a GdaSet object
	--   param :
	--   Returns : a GdaSetNode or NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_set_get_source_for_model ()
	--
	-- GdaSetSource*       gda_set_get_source_for_model        (GdaSet *set,
	--                                                          GdaDataModel *model);
	--
	--   Finds the GdaSetSource structure used in set for which model is a the data
	--   model, don't modify the returned structure
	--
	--   set :     a GdaSet object
	--   model :   a GdaDataModel object
	--   Returns : a GdaSetSource pointer or NULL.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_set_get_source ()
	--
	-- GdaSetSource*       gda_set_get_source                  (GdaSet *set,
	--                                                          GdaHolder *param);
	--
	--   Finds a GdaSetSource which contains the GdaDataModel restricting the
	--   possible values of holder, don't modify the returned structure.
	--
	--   set :     a GdaSet object
	--   param :
	--   Returns : a GdaSetSource or NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_set_get_group ()
	--
	-- GdaSetGroup*        gda_set_get_group                   (GdaSet *set,
	--                                                          GdaHolder *param);
	--
	--   Finds a GdaSetGroup which lists a GdaSetNode containing holder, don't
	--   modify the returned structure.
	--
	--   set :     a GdaSet object
	--   param :
	--   Returns : a GdaSetGroup or NULL
	--
	--Property Details
	--
	--  The "description" property
	--
	--   "description"              gchar*                : Read / Write
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "holders" property
	--
	--   "holders"                  gpointer              : Write / Construct Only
	--
	--   Holders the set should contain.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "id" property
	--
	--   "id"                       gchar*                : Read / Write
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "name" property
	--
	--   "name"                     gchar*                : Read / Write
	--
	--   Default value: NULL
	--
	--Signal Details
	--
	--  The "holder-attr-changed" signal
	--
	-- void                user_function                      (GdaSet    *gdaset,
	--                                                         GdaHolder *arg1,
	--                                                         gpointer   user_data)      : Run First
	--
	--   gdaset :    the object which received the signal.
	--   arg1 :
	--   user_data : user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "holder-changed" signal
	--
	-- void                user_function                      (GdaSet    *gdaset,
	--                                                         GdaHolder *arg1,
	--                                                         gpointer   user_data)      : Run First
	--
	--   gdaset :    the object which received the signal.
	--   arg1 :
	--   user_data : user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "holder-plugin-changed" signal
	--
	-- void                user_function                      (GdaSet    *gdaset,
	--                                                         GdaHolder *arg1,
	--                                                         gpointer   user_data)      : Run First
	--
	--   gdaset :    the object which received the signal.
	--   arg1 :
	--   user_data : user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "public-data-changed" signal
	--
	-- void                user_function                      (GdaSet  *gdaset,
	--                                                         gpointer user_data)      : Run First
	--
	--   gdaset :    the object which received the signal.
	--   user_data : user data set when the signal handler was connected.

feature  {} -- 
	--  enum GdaSetHint
	--
	-- typedef enum {
	--         GDA_SET_HOLDER_READ_ONLY = 1 << 0, /* holder should not be affected by user modifications */
	--         GDA_SET_HOLDER_HIDE      = 1 << 1  /* holder should not be shown to the user */
	-- } GdaSetHint;
	--
	--   --------------------------------------------------------------------------
	--
	--  GdaSetNode
	--
	-- typedef struct {
	--         GdaHolder    *holder;         /* Can't be NULL */
	--         GdaDataModel *source_model;  /* may be NULL if @holder does not have any source */
	--         gint          source_column; /* unused is @source_model is NULL */
	--         GdaSetHint    hint;
	-- } GdaSetNode;
	--
	--   For each GdaHolder object in the GdaSet object, there is a GdaSetNode
	--   structure which sums up all the information for each GdaHolder.
	--
	--   --------------------------------------------------------------------------
	--
	--  GdaSetGroup
	--
	-- typedef struct {
	--         GSList       *nodes;       /* list of GdaSetNode, at least one entry */
	--         GdaSetSource *nodes_source; /* if NULL, then @nodes contains exactly one entry */
	-- } GdaSetGroup;
	--
	--   The GdaSetGroup is another view of the GdaHolder objects contained in the
	--   "" there is one such structure for each _independant_ parameter
	--   (parameters which have the same source data model all appear in the same
	--   GdaSetGroup structure).
	--
	--   --------------------------------------------------------------------------
	--
	--  GdaSetSource
	--
	-- typedef struct {
	--         GdaDataModel   *data_model;   /* Can't be NULL */
	--         GSList         *nodes;        /* list of #GdaSetNode for which source_model == @data_model */
	--
	--         /* displayed columns in 'data_model' */
	--         gint            shown_n_cols;
	--         gint           *shown_cols_index;
	--
	--         /* columns used as a reference (corresponding to PK values) in 'data_model' */
	--         gint            ref_n_cols;
	--         gint           *ref_cols_index;
	-- } GdaSetSource;
	--
	--   There is a GdaSetSource structure for each GdaDataModel which is a source
	--   for least one GdaHolder in the GdaSet object.

feature {} -- Unwrapped
	-- variadic: gda_set_new_inline ()
	--
	-- GdaSet*             gda_set_new_inline                  (gint nb,
	--                                                          ...);
	--
	--   Creates a new GdaSet containing holders defined by each triplet in ... For
	--   each triplet (id, Glib type and value), the value must be of the correct
	--   type (gchar * if type is G_STRING, ...)
	--
	--   Note that this function is a utility function and that anly a limited set
	--   of types are supported. Trying to use an unsupported type will result in a
	--   warning, and the returned value holder holding a safe default value.
	--
	--   nb :      the number of value holders which will be contained in the new
	--             GdaSet
	--   ... :     a serie of a (const gchar*) id, (GType) type, and value
	--   Returns : a new GdaSet object

-- const GValue*       gda_set_get_holder_value            (GdaSet *set,
	--                                                          const gchar *holder_id);
	--
	--   Get the value of the GdaHolder which ID is holder_id
	--
	--   set :       a GdaSet object
	--   holder_id : the ID of the holder to set the value
	--   Returns :   the requested GValue, or NULL (see gda_holder_get_value())
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_set_set_holder_value ()
	--
	-- gboolean            gda_set_set_holder_value            (GdaSet *set,
	--                                                          const gchar *holder_id,
	--                                                          ...);
	--
	--   Set the value of the GdaHolder which ID is holder_id to a specified value
	--
	--   set :       a GdaSet object
	--   holder_id : the ID of the holder to set the value
	--   ... :       value, of the correct type, depending on the requested
	--               holder's type
	--   Returns :   TRUE if no error occurred and the value was set correctly
feature {ANY}
	struct_size: INTEGER
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaSet)"
		end

end -- class GDA_SET
